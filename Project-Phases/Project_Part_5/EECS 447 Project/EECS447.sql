/*
NAME: EECS 447 PROJECT (DDL)
DESCRIPTION: DDL OF DATABASE SYSTEM FOR LIBRARY MANAGEMENT
CONTRIBUTORS: JAIDEN GREEN, SHERO BAIG, LUIS, ERIC, AMRIT
START DATE: OCTOBER 22, 2025
LAST UPDATED: November 4, 2025
*/

--Creates Library User Entity Table: Jaiden
CREATE TABLE LIBUSER(
UID CHAR(8) not null primary key,       --Identification Number for Users
Fname VARCHAR(20) not null,             --First name of the user 
Lname VARCHAR(20) not null,             --Last name of the user
Phone VARCHAR(15) not null,             --Phone number of the user 
Email VARCHAR(50) not null,             --Email address of the user
HouseNum VARCHAR(10) not null,          --House number of the user
City VARCHAR(20) not null,              --City of the user
State VARCHAR(20) not null,             --State of the user
ZIP CHAR(5) not null,                   --ZIP code of the user
Street VARCHAR(50) not null,            --Street of the user
AptNum VARCHAR(10)                      --Apartment number of the user
);

--CREATES CLIENT SPECIALIZATION TABLE: Jaiden
CREATE TABLE Client(
UID CHAR(8) not null PRIMARY KEY,           --Identification number for User
AcctStanding INT,                           --Stores how many items are loaned(should not be more than 3)
MemStart DATE,                              --Date of membership start
FOREIGN KEY (UID) REFERENCES LIBUSER(UID)
);

--CREATES LIBRARIAN SPECIALIZATION TABLE: Jaiden
CREATE TABLE Librarian(
UID CHAR(8) not null PRIMARY KEY,               --Identification number for User
Salary Float(10,2),                             --Salary of the librarian
FOREIGN KEY (UID) REFERENCES LIBUSER(UID)
);

--Moved the Items Table above Reserves to make sure Reserves is referencing Items Correctly; Jaiden
--CREATES ITEMS ENTITY TABLE: SHERO
CREATE TABLE IF NOT EXISTS Items(
CopyID CHAR(8) NOT NULL PRIMARY KEY, --Identification Number for the Copy, primary key of Items entity
Title VARCHAR(50) NOT NULL, -- Title of the Copy with up to 50 characters allowed, cant be null
Genre VARCHAR(15) NOT NULL, -- Genre of the Copy with up to 15 characters allowed, cant be null
ReleaseDate DATE NOT NULL, -- Release date of the Copy, cant be null
Availability BOOLEAN NOT NULL, -- Availability of Copy, either Availabile or not (True or False), cant be null
NumofCheckouts SMALLINT, -- Tells the number of times the copy has been checked out, smallint used cause it will be small whole numbers
Duedate DATE -- Date when the copy is due
);
--CREATES BOOKS SPECIALIZATION TABLE: SHERO
CREATE TABLE IF NOT EXISTS Books(
CopyID CHAR(8) NOT NULL PRIMARY KEY, --Identification Number for the Copy, primary key of books specialization 
ISBN CHAR(13) NOT NULL, --ISBN Number for books with a fixed amount of 13 characters, cant be null
Author VARCHAR(50) NOT NULL, -- Author's name with up to 50 characters allowed, cant be null
FOREIGN KEY (CopyID) REFERENCES Items(CopyID) -- foreign key is the copyID cause it is referenced from Items
);

--CREATES MAGAZINES SPECIALIZATION TABLE: SHERO
CREATE TABLE IF NOT EXISTS Magazines(
CopyID CHAR(8) NOT NULL PRIMARY KEY, --Identification Number for the Copy, primary key of magazines specialization with a fixed amount of 8 characters, and cant be null
IssueNum CHAR(6) NOT NULL, --Issue number of the magazine with a fixed amount of 6 characters, and cant be null
Publisher VARCHAR(50) NOT NULL, --Publisher of the magazine that can go up to 50 characters
FOREIGN KEY (CopyID) REFERENCES Items(CopyID) -- foreign key is the copyID cause it is referenced from Items
);

--CREATES MOVIES SPECIALIZATION TABLE: SHERO
CREATE TABLE IF NOT EXISTS Movies(
CopyID CHAR(8) NOT NULL PRIMARY KEY, --Identification Number for the Copy, primary key of movies specialization with a fixed amount of 8 characters, and cant be null
Rating CHAR(4) NOT NULL, --Rating on rotten tomatoes for the movie, with a fixed amount of 4 characters, cant be null
Director VARCHAR(50) NOT NULL, --Director of the movie, can go up to 50 characters, cant be null
FOREIGN KEY (CopyID) REFERENCES Items(CopyID)
);

--CREATES RESERVES RELATINSHIP TABLE: Jaiden
CREATE TABLE Reserves(
CopyID CHAR(8) not null,            --Identification number for Items
UID CHAR(8) not null,                           --Identification number for User
ReservedAt DATE,
FOREIGN KEY (CopyID) REFERENCES Items(CopyID),
FOREIGN KEY (UID) REFERENCES Client(UID)
);

-- CREATES FEE ENTITY TABLE: LUIS
CREATE TABLE IF NOT EXISTS Fee(
FeeID CHAR(8) NOT NULL PRIMARY KEY,	            --Identification Number for Fee
UID CHAR(8) NOT NULL,	                        --Foreign Key of Client'sID
DueDate DATE NOT NULL,	                        --Date Fee is Due
PaidAt DATE,	                                --Date Fee is Paid
Overdue	BOOLEAN NOT NULL,	                    --y/n if fee is overdue
PaymentMethod VARCHAR(15) NOT NULL,             --how was the fee paid
PaidStatus BOOLEAN NOT NULL,	                --y/n if the fee is paid
TransactionID CHAR(8) NOT NULL,                 --Foreign key to Transaction ID
Amount NUMERIC(12,2) NOT NULL,	                    --Amount of money due
FOREIGN KEY (UID) REFERENCES Client(UID),
FOREIGN KEY (TransactionID) REFERENCES UserTransaction(TransactionID)
);

-- CREATES RENTS RELATIONSHIP TABLE: LUIS
CREATE TABLE IF NOT EXISTS Rents(
TransactionID CHAR(8) NOT NULL,	    --Identifies the checkout/return record this copy is part of
UID CHAR(8) NOT NULL,	            --Identification number for User
FOREIGN KEY (TransactionID) REFERENCES UserTransaction(TransactionID),
FOREIGN KEY (UID) REFERENCES Client(UID)
);


--CREATES RENTED RELATIONSHIP TABLE: SHERO
CREATE TABLE IF NOT EXISTS Rented(
TransactionID CHAR(8) NOT NULL PRIMARY KEY, -- Idenitfies the checkout/return record this copy is part of. Up to fixed amount of 8 characters and a primary key and cant be null
CopyID CHAR(8) NOT NULL, -- Identifies the exact physical copy that's being rented. Up to fixed amount of 8 characters and cant be null
FOREIGN KEY (TransactionID) REFERENCES UserTransaction(TransactionID), --Foreign key is transactionid and it is referenced from UserTransaction
FOREIGN KEY (CopyID) REFERENCES Items(CopyID) --Another foreign key is CopyID and it is referenced from Items
);

-- Create UserTransaction table: Amrit
CREATE TABLE IF NOT EXISTS UserTransaction (                     -- Creates the UserTransaction table if it doesn't already exist
    TransactionID CHAR(8) PRIMARY KEY,                           -- Unique transaction identifier
    LateFee NUMERIC(12,2) DEFAULT 0 CHECK (LateFee >= 0),        -- Late fee amount, must be non-negative
    CopyID CHAR(8) NOT NULL,                                     -- References the specific item copy being rented
    ClientID CHAR(8) NOT NULL,                                   -- References the client performing the transaction
    LibrarianID CHAR(8) NOT NULL,                                -- References the librarian processing the transaction
    CheckoutDate DATE NOT NULL,                                  -- Date when the item was checked out
    DueDate DATE NOT NULL,                                       -- Date when the item is due for return
    ReturnDate DATE,                                             -- Date when the item was returned (nullable)
    CHECK (DueDate >= CheckoutDate),                             -- Ensures due date is not before checkout date
    CHECK (ReturnDate IS NULL OR ReturnDate >= CheckoutDate),    -- Ensures return date is not before checkout date
    FOREIGN KEY (CopyID) REFERENCES Items(CopyID),               -- Foreign key linking to Items table
    FOREIGN KEY (ClientID) REFERENCES Client(UID),               -- Foreign key linking to Client table
    FOREIGN KEY (LibrarianID) REFERENCES Librarian(UID)          -- Foreign key linking to Librarian table
);                                                               -- Ends table creation

-- Helpful indexes
CREATE INDEX IF NOT EXISTS idx_ut_copy ON UserTransaction(CopyID);      -- Index on CopyID for faster lookups by item
CREATE INDEX IF NOT EXISTS idx_ut_client ON UserTransaction(ClientID);  -- Index on ClientID for efficient client searches
CREATE INDEX IF NOT EXISTS idx_ut_lib ON UserTransaction(LibrarianID);  -- Index on LibrarianID for efficient librarian searches

CREATE TABLE IF NOT EXISTS Assists(
    LibrarianID CHAR(8) NOT NULL, -- References the librarian assisting with the transaction
    TransactionID CHAR(8) NOT NULL, -- References the related transaction
    PRIMARY KEY (LibrarianID, TransactionID), -- Composite primary key (each librarian-transaction pair is unique)
    FOREIGN KEY (LibrarianID) REFERENCES Librarian(UID), -- Foreign key linking to Librarian table
    FOREIGN KEY (TransactionID) REFERENCES UserTransaction(TransactionID) -- Foreign key linking to UserTransaction table
);

-- Creates Pays Table: Eric
CREATE TABLE IF NOT EXISTS Pays (
    FeeID CHAR(8) NOT NULL, -- Identifies the specific fee being paid 
    UID CHAR(8) NOT NULL, -- Identifies the user paying the fee
    PRIMARY KEY (FeeID), -- Primary key FeeId uniquely identifies the transaction 
    FOREIGN KEY (UID) REFERENCES Client(UID), -- Foreign key linking to Client 
    FOREIGN KEY (FeeID) REFERENCES Fee(FeeID) -- Foreign key linking to Fee
    ); -- Ends table creation 

CREATE INDEX IF NOT EXISTS idx_assists_lib ON Assists(LibrarianID);      -- Index on LibrarianID for quick lookup by librarian
CREATE INDEX IF NOT EXISTS idx_assists_txn ON Assists(TransactionID);    -- Index on TransactionID for quick lookup by transaction