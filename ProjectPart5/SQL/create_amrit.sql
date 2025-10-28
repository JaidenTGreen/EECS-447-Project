-- Create UserTransaction table
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


-- Create Assists table
CREATE TABLE IF NOT EXISTS Assists (                            -- Creates the Assists table if it doesn't already exist
    LibrarianID CHAR(8) NOT NULL,                               -- References the librarian assisting with the transaction
    TransactionID CHAR(8) NOT NULL,                             -- References the related transaction
    PRIMARY KEY (LibrarianID, TransactionID),                   -- Composite primary key (each librarian-transaction pair is unique)
    FOREIGN KEY (LibrarianID) REFERENCES Librarian(UID),        -- Foreign key linking to Librarian table
    FOREIGN KEY (TransactionID) REFERENCES UserTransaction(TransactionID)  -- Foreign key linking to UserTransaction table
);                                                              -- Ends table creation

CREATE INDEX IF NOT EXISTS idx_assists_lib ON Assists(LibrarianID);      -- Index on LibrarianID for quick lookup by librarian
CREATE INDEX IF NOT EXISTS idx_assists_txn ON Assists(TransactionID);    -- Index on TransactionID for quick lookup by transaction
