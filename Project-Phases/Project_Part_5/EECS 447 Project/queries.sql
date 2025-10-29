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
JOIN USER U ON C.UID = U.UID
JOIN Items I ON T.CopyID = I.CopyID;

--~~~~~~~~~~~~~~~~~~~~~~~~~
--    Reports
--~~~~~~~~~~~~~~~~~~~~~~~~~

-- Late returns report: Jaiden
SELECT U.Fname || ' ' || U.Lname AS ClientName, I.Title, T.DueDate, T.ReturnDate
FROM UserTransaction T
JOIN Client C ON T.ClientID = C.UID
JOIN USER U ON C.UID = U.UID
JOIN Items I ON T.CopyID = I.CopyID
WHERE T.ReturnDate > T.DueDate;
