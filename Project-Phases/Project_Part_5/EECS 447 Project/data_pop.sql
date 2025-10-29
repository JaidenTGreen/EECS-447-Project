/*
NAME: EECS 447: Data Population
DESCRIPTION: Insertion of data into the DATABASE SYSTEM FOR LIBRARY MANAGEMENT
CONTRIBUTORS: JAIDEN GREEN, SHERO BAIG, LUIS, ERIC
START DATE: OCTOBER 29, 2025
LAST UPDATED: OCTOBER 29, 2025
*/

--~~~~~~~~~~~~~~~~~~~~~~~~~
--    USER
--~~~~~~~~~~~~~~~~~~~~~~~~~

--Luffy as a Client: Jaiden
INSERT INTO USER VALUES ('U0000001', 'Luffy', 'Monkey', '555-1234', 'mdl@gmail.com', '12', 'Lawrence', 'KS', '66044', 'Maple St', NULL);
INSERT INTO Client VALUES ('U0000001', 1, '2024-10-20');

--Mike Wazowsky as a Librarian: Jaiden
INSERT INTO USER VALUES ('U0000002', 'Mike', 'Wazowsky', '555-2345', 'MWazzy@gmail.com', '1245', 'Lawrence', 'KS', '66044', 'Iowa St', NULL);
INSERT INTO Librarian VALUES ('U0000002', 45000.00);

--~~~~~~~~~~~~~~~~~~~~~~~~~
--    Reserves
--~~~~~~~~~~~~~~~~~~~~~~~~~

--~~~~~~~~~~~~~~~~~~~~~~~~~
--    ITEMS
--~~~~~~~~~~~~~~~~~~~~~~~~~

--Great Gatsby Book: Jaiden
INSERT INTO Items VALUES ('C0000001', 'The Great Gatsby', 'Fiction', '1925-04-10', 1, 5, NULL);
INSERT INTO Books VALUES ('C0000001', '9780743273565', 'F. Scott Fitzgerald');

--~~~~~~~~~~~~~~~~~~~~~~~~~
--    Rented
--~~~~~~~~~~~~~~~~~~~~~~~~~

--~~~~~~~~~~~~~~~~~~~~~~~~~
--    USERTRANSACTION
--~~~~~~~~~~~~~~~~~~~~~~~~~

--Luffy checks out Great Gatsby, helped by Mike Wazowski: Jaiden
INSERT INTO UserTransaction VALUES ('T0000001', 0, 'C0000001', 'U0000001', 'U0000002', '2025-10-01', '2025-10-15', NULL);

--~~~~~~~~~~~~~~~~~~~~~~~~~
--    Assists
--~~~~~~~~~~~~~~~~~~~~~~~~~

--~~~~~~~~~~~~~~~~~~~~~~~~~
--    Pays
--~~~~~~~~~~~~~~~~~~~~~~~~~

--~~~~~~~~~~~~~~~~~~~~~~~~~
--    FEE
--~~~~~~~~~~~~~~~~~~~~~~~~~

--~~~~~~~~~~~~~~~~~~~~~~~~~
--    Rents
--~~~~~~~~~~~~~~~~~~~~~~~~~
