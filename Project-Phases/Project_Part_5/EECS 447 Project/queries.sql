/*
NAME: EECS 447 PROJECT: Functionality Testing
DESCRIPTION: Queries/Reports for DATABASE SYSTEM FOR LIBRARY MANAGEMENT
CONTRIBUTORS: JAIDEN GREEN, SHERO BAIG, LUIS, ERIC, AMRIT
START DATE: OCTOBER 29, 2025
LAST UPDATED: OCTOBER 29, 2025
*/

--~~~~~~~~~~~~~~~~~~~~~~~~~
--    Searches
--~~~~~~~~~~~~~~~~~~~~~~~~~

-- Find all available fiction books: Jaiden
SELECT Title FROM Items WHERE Genre = 'Fiction' AND Availability = 1;

-- List all clients who currently have overdue items
SELECT U.Fname, U.Lname, I.Title, T.DueDate
FROM UserTransaction T
JOIN Client C ON T.ClientID = C.UID
JOIN USER U ON C.UID = U.UID
JOIN Items I ON T.CopyID = I.CopyID
WHERE T.ReturnDate IS NULL AND T.DueDate < CURRENT_DATE;

-- Display total revenue collected from paid fees
SELECT SUM(Amount) AS TotalRevenue
FROM FEE
WHERE PaidStatus = TRUE;

-- Show librarians and how many transactions they assisted with
SELECT U.Fname, U.Lname, COUNT(A.TransactionID) AS NumTransactionsAssisted
FROM Assists A
JOIN Librarian L ON A.LibrarianID = L.UID
JOIN USER U ON L.UID = U.UID
GROUP BY U.Fname, U.Lname
ORDER BY NumTransactionsAssisted DESC;

--~~~~~~~~~~~~~~~~~~~~~~~~~
--    Updates
--~~~~~~~~~~~~~~~~~~~~~~~~~

-- Mark item as rented: Jaiden
UPDATE Items SET Availability = 0 WHERE CopyID = 'C0000001';

--~~~~~~~~~~~~~~~~~~~~~~~~~
--    Joins
--~~~~~~~~~~~~~~~~~~~~~~~~~

-- Show which client rented which book: Jaiden
SELECT U.Fname, U.Lname, I.Title, T.CheckoutDate, T.DueDate
FROM UserTransaction T
JOIN Client C ON T.ClientID = C.UID
JOIN LIBUSER U ON C.UID = U.UID
JOIN Items I ON T.CopyID = I.CopyID;

--~~~~~~~~~~~~~~~~~~~~~~~~~
--    Reports
--~~~~~~~~~~~~~~~~~~~~~~~~~

-- Late returns report: Jaiden
SELECT U.Fname || ' ' || U.Lname AS ClientName, I.Title, T.DueDate, T.ReturnDate
FROM UserTransaction T
JOIN Client C ON T.ClientID = C.UID
JOIN LIBUSER U ON C.UID = U.UID
JOIN Items I ON T.CopyID = I.CopyID
WHERE T.ReturnDate > T.DueDate;

-- Assists activity: Luis
SELECT Fname, Lname, LibrarianID, COUNT(*) AS TransactionsHelped
FROM Assists JOIN LIBUSER ON LibrarianID = UID
GROUP BY LibrarianID
ORDER BY TransactionsHelped DESC;

-- Overdue fees: Luis
SELECT FeeID, UID, DueDate, Overdue, PaidStatus
FROM Fee
WHERE Overdue = TRUE AND PaidStatus = FALSE;

-- Check availability: Luis
SELECT CopyID, Title, Availability
FROM Items
WHERE Availability = TRUE;

-- See number of checkouts: Luis
SELECT Title, NumofCheckouts
FROM Items
ORDER BY NumofCheckouts DESC

-- Revenue from fees: Luis
SELECT SUM(Amount) AS TotalRevenue
FROM Fee
WHERE PaidStatus = TRUE;
