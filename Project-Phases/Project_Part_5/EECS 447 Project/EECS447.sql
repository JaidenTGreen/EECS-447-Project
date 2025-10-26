/*
NAME: EECS 447 PROJECT
DESCRIPTION: DATABASE SYSTEM FOR LIBRARY MANAGEMENT
CONTRIBUTORS: JAIDEN GREEN
DATE: OCTOBER 22, 2025
LAST UPDATED: OCTOBER 26, 2025
*/

--Creates User Entity Table: Jaiden
CREATE TABLE USER(
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
FOREIGN KEY (UID) REFERENCES USER(UID)
);

--CREATES LIBRARIAN SPECIALIZATION TABLE: Jaiden
CREATE TABLE Librarian(
UID CHAR(8) not null PRIMARY KEY,               --Identification number for User
Salary Float(10,2),                             --Salary of the librarian
FOREIGN KEY (UID) REFERENCES USER(UID)
);

--CREATES RESERVES RELATINSHIP TABLE: Jaiden
CREATE TABLE Reserves(
CopyID CHAR(8) not null PRIMARY KEY,            --Identification number for Items
UID CHAR(8) not null,                           --Identification number for User
FOREIGN KEY (CopyID) REFERENCES Items(CopyID)
);
