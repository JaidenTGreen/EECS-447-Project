/*
NAME: EECS 447 PROJECT: Functionality Testing
DESCRIPTION: Queries/Reports for DATABASE SYSTEM FOR LIBRARY MANAGEMENT
CONTRIBUTORS: JAIDEN GREEN, SHERO BAIG, LUIS, ERIC, AMRIT
START DATE: OCTOBER 29, 2025
LAST UPDATED: NOVEMBER 13, 2025
*/

/*
This file is used to store predetermined queries
Formatted as:

Name: (name of query)
(actual SQL code)

*/

--~~~~~~~~~~~~~~~~~~~~~~~~~
--    Searches
--~~~~~~~~~~~~~~~~~~~~~~~~
-- Find all available fiction books: Jaiden
-- Name: All fiction books
SELECT Title FROM Items WHERE Genre = 'Fiction' AND Availability = 1;

-- List all clients who currently have overdue items
-- Name: Clients with overdue items
SELECT U.Fname, U.Lname, I.Title, T.DueDate
FROM UserTransaction T
JOIN Client C ON T.ClientID = C.UID
JOIN LIBUSER U ON C.UID = U.UID
JOIN Items I ON T.CopyID = I.CopyID
WHERE T.ReturnDate IS NULL AND T.DueDate < CURRENT_DATE;

-- Display total revenue collected from paid fees
-- Name: Fee Revenue
SELECT SUM(Amount) AS TotalRevenue
FROM FEE
WHERE PaidStatus = TRUE;

-- Show librarians and how many transactions they assisted with
-- Name: Librarian Transaction Assists
SELECT U.Fname, U.Lname, COUNT(A.TransactionID) AS NumTransactionsAssisted
FROM Assists A
JOIN Librarian L ON A.LibrarianID = L.UID
JOIN LIBUSER U ON L.UID = U.UID
GROUP BY U.Fname, U.Lname
ORDER BY NumTransactionsAssisted DESC;

-- Finds clients who do not currently have any reservations (Shero)
-- Name: Clients with No Reservations     
SELECT 
    U.Fname,
    U.Lname,
    C.UID
FROM Client C
JOIN LIBUSER U ON C.UID = U.UID
LEFT JOIN Reserves R ON R.UID = C.UID
WHERE R.UID IS NULL;

-- Shows clients who have fees, but no unpaid fees remaining (Shero)
-- Name: Clients with All Fees Paid
SELECT 
    U.Fname,
    U.Lname,
    C.UID
FROM Client C
JOIN LIBUSER U ON C.UID = U.UID
WHERE EXISTS (
    SELECT 1 
    FROM Fee F
    WHERE F.UID = C.UID
)
AND NOT EXISTS (
    SELECT 1
    FROM Fee F2
    WHERE F2.UID = C.UID
      AND F2.PaidStatus = FALSE
);

--~~~~~~~~~~~~~~~~~~~~~~~~~
--    Updates
--~~~~~~~~~~~~~~~~~~~~~~~~~
-- Updates can be done in the dashboard
-- Mark item as rented: Jaiden
-- UPDATE Items SET Availability = 0 WHERE CopyID = 'C0000001';

--~~~~~~~~~~~~~~~~~~~~~~~~~
--    Joins
--~~~~~~~~~~~~~~~~~~~~~~~~~

-- Show which client rented which book: Jaiden
-- Name: Client rented books
SELECT U.Fname, U.Lname, I.Title, T.CheckoutDate, T.DueDate
FROM UserTransaction T
JOIN Client C ON T.ClientID = C.UID
JOIN LIBUSER U ON C.UID = U.UID
JOIN Items I ON T.CopyID = I.CopyID;

-- Shows how many unique clients each librarian has helped (Shero)
-- Name: Librarian Client Interaction Count     
SELECT 
    L.UID AS LibrarianID,
    U.Fname,
    U.Lname,
    COUNT(DISTINCT T.ClientID) AS NumClientsHelped
FROM Librarian L
JOIN LIBUSER U ON L.UID = U.UID
JOIN Assists A ON L.UID = A.LibrarianID
JOIN UserTransaction T ON T.TransactionID = A.TransactionID
GROUP BY L.UID, U.Fname, U.Lname
ORDER BY NumClientsHelped DESC;

--~~~~~~~~~~~~~~~~~~~~~~~~~
--    Reports
--~~~~~~~~~~~~~~~~~~~~~~~~~

-- Late returns report: Jaiden
-- Name: Late Returns
SELECT U.Fname || ' ' || U.Lname AS ClientName, I.Title, T.DueDate, T.ReturnDate
FROM UserTransaction T
JOIN Client C ON T.ClientID = C.UID
JOIN LIBUSER U ON C.UID = U.UID
JOIN Items I ON T.CopyID = I.CopyID
WHERE T.ReturnDate > T.DueDate;

-- Name: Assists Activity
SELECT Fname, Lname, LibrarianID, COUNT(*) AS TransactionsHelped
FROM Assists JOIN LIBUSER ON LibrarianID = UID
GROUP BY LibrarianID
ORDER BY TransactionsHelped DESC;

-- Name: Overdue Fees
SELECT FeeID, UID, DueDate, Overdue, PaidStatus
FROM Fee
WHERE Overdue = TRUE AND PaidStatus = FALSE;

-- Name: Item Availability
SELECT CopyID, Title, Availability
FROM Items
WHERE Availability = TRUE;

-- Name: Checkouts Per Item
SELECT Title, NumofCheckouts
FROM Items
ORDER BY NumofCheckouts DESC

-- Name: Unpaid Fees
SELECT * FROM Fee
WHERE PaidStatus = 0;

-- Name: High Rated Movies
SELECT Title, m.Rating
FROM ITEMS i 
JOIN MOVIES m ON i.CopyID = m. CopyID
WHERE m.Rating >= 90;

-- Name: Reserved Items
SELECT l.Fname, l.UID, i.Title 
FROM RESERVES  r 
JOIN LIBUSER l ON r.UID = l.UID
JOIN ITEMS i ON i.CopyID = r.CopyID

-- Shows how many rentals each client has made
-- Name: Most Active Clients (Rent Count) (Shero)
SELECT 
    U.Fname,
    U.Lname,
    R.UID,
    COUNT(*) AS NumRentals
FROM Rents R
JOIN LIBUSER U ON R.UID = U.UID
GROUP BY U.Fname, U.Lname, R.UID
ORDER BY NumRentals DESC;

-- Lists clients who have at least one reservation and at least one rental
-- Name: Clients with Reservations and Rentals  (Shero)
SELECT 
    U.Fname,
    U.Lname,
    C.UID
FROM Client C
JOIN LIBUSER U ON C.UID = U.UID
WHERE EXISTS (
    SELECT 1 
    FROM Reserves R 
    WHERE R.UID = C.UID
)
AND EXISTS (
    SELECT 1 
    FROM Rents Rt
    WHERE Rt.UID = C.UID
);

-- Name: Top Circulated Items
SELECT 
    Title,
    NumofCheckouts
FROM Items
ORDER BY NumofCheckouts DESC
LIMIT 10;

-- Name: Clients With Overdue Unpaid Fees
SELECT 
    U.Fname,
    U.Lname,
    F.FeeID,
    F.Amount,
    F.DueDate
FROM Fee F
JOIN Client C ON F.UID = C.UID
JOIN LIBUSER U ON C.UID = U.UID
WHERE F.Overdue = TRUE
  AND F.PaidStatus = FALSE;

-- Name: Currently Checked Out Items
SELECT 
    I.Title,
    T.CopyID,
    U.Fname,
    U.Lname,
    T.CheckoutDate,
    T.DueDate
FROM UserTransaction T
JOIN Items I ON T.CopyID = I.CopyID
JOIN Client C ON T.ClientID = C.UID
JOIN LIBUSER U ON C.UID = U.UID
WHERE T.ReturnDate IS NULL;
