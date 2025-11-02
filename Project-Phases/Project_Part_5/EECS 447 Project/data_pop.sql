/*
NAME: EECS 447: Data Population
DESCRIPTION: Insertion of data into the DATABASE SYSTEM FOR LIBRARY MANAGEMENT
CONTRIBUTORS: JAIDEN GREEN, SHERO BAIG, LUIS, ERIC
START DATE: OCTOBER 29, 2025
LAST UPDATED: November 2, 2025
*/

--~~~~~~~~~~~~~~~~~~~~~~~~~
--    USER
--~~~~~~~~~~~~~~~~~~~~~~~~~

--Clients

--Luffy as a Client: Jaiden
INSERT INTO LIBUSER VALUES ('U0000001', 'Luffy', 'Monkey', '555-1234', 'mdl@gmail.com', '12', 'Lawrence', 'KS', '66044', 'Maple St', NULL);
INSERT INTO Client VALUES ('U0000001', 1, '2024-10-20');

--Frank as a Client: Jaiden
INSERT INTO LIBUSER VALUES ('U0000002', 'Frank', 'Reynolds', '515-2344', 'frankreynolds@gmail.com', '1738', 'Philadelphia', 'PA', '19146', 'Paddys Ct', NULL);
INSERT INTO Client VALUES ('U0000002', 2, '2004-07-14');

--Dennis as a Client: Jaiden
INSERT INTO LIBUSER VALUES ('U0000003', 'Dennis', 'Smith', '555-3456', 'dennissmith@gmail.com', '4567', 'New York', 'NY', '10001', 'Broadway', NULL);
INSERT INTO Client VALUES ('U0000003', 3, '2005-08-15');

--Dee as a Client: Jaiden
INSERT INTO LIBUSER VALUES ('U0000004', 'Dee', 'Williams', '555-4567', 'deewilliams@gmail.com', '8901', 'Los Angeles', 'CA', '90001', 'Sunset Blvd', NULL);
INSERT INTO Client VALUES ('U0000004', 2, '2006-09-16');

--Mac as a Client: Jaiden
INSERT INTO LIBUSER VALUES ('U0000005', 'Mac', 'Jones', '555-5678', 'macjones@gmail.com', '2345', 'San Francisco', 'CA', '94105', 'Market St', NULL);
INSERT INTO Client VALUES ('U0000005', 1, '2007-10-17');

--Charlie as a Client: Jaiden
INSERT INTO LIBUSER VALUES ('U0000006', 'Charlie', 'Brown', '555-6789', 'charliebrown@gmail.com', '3456', 'Los Angeles', 'CA', '90001', 'Hollywood Blvd', NULL);
INSERT INTO Client VALUES ('U0000006', 3, '2008-11-18');

--Librarians

--Mike Wazowsky as a Librarian: Jaiden
INSERT INTO LIBUSER VALUES ('U0000007', 'Mike', 'Wazowsky', '555-2345', 'MWazzy@gmail.com', '1245', 'Lawrence', 'KS', '66044', 'Iowa St', NULL);
INSERT INTO Librarian VALUES ('U0000007', 45000.00);

--Scrooge McDuck as a Librarian: Jaiden
INSERT INTO LIBUSER VALUES ('U0000008', 'Scrooge', 'McDuck', '555-3456', 'ScroogeMcDuck@gmail.com', '6789', 'Duckburg', 'CA', '90210', 'Duckburg Ave', NULL);
INSERT INTO Librarian VALUES ('U0000008', 60000.00);

--Danny as a Librarian: Jaiden
INSERT INTO LIBUSER VALUES ('U0000009', 'Danny', 'Phantom', '555-4567', 'DannyPhantom@gmail.com', '8901', 'Amity Park', 'IL', '60412', 'Ghost Zone', NULL);
INSERT INTO Librarian VALUES ('U0000009', 50000.00);

--Edna Mode as a Librarian: Jaiden
INSERT INTO LIBUSER VALUES ('U0000010', 'Edna', 'Mode', '555-5678', 'EdnaMode@gmail.com', '2345', 'Metro City', 'CA', '90210', 'Incredibles Ave', NULL);
INSERT INTO Librarian VALUES ('U0000010', 70000.00);

--~~~~~~~~~~~~~~~~~~~~~~~~~
--    Reserves
--~~~~~~~~~~~~~~~~~~~~~~~~~

--Luffy reserves Great Gatsby: Jaiden
INSERT INTO Reserves VALUES ('U0000001', 'C0000001', '2025-09-15');

--Frank reserves ___: Jaiden
INSERT INTO Reserves VALUES ('U0000002', 'C0000002', '2025-09-16');

--Dennis reserves ___: Jaiden
INSERT INTO Reserves VALUES ('U0000003', 'C0000003', '2025-09-17');

--Dee reserves ___: Jaiden
INSERT INTO Reserves VALUES ('U0000004', 'C0000004', '2025-09-18');

--Mac reserves ___: Jaiden
INSERT INTO Reserves VALUES ('U0000005', 'C0000005', '2025-09-19');

--Charlie reserves ___: Jaiden
INSERT INTO Reserves VALUES ('U0000006', 'C0000006', '2025-09-20');

--Luffy reserves ___: Jaiden
INSERT INTO Reserves VALUES ('U0000001', 'C0000007', '2025-09-21');

--Frank reserves ___: Jaiden
INSERT INTO Reserves VALUES ('U0000002', 'C0000008', '2025-09-22'); 

--Dennis reserves ___: Jaiden
INSERT INTO Reserves VALUES ('U0000003', 'C0000009', '2025-09-23');

--Dee reserves ___: Jaiden
INSERT INTO Reserves VALUES ('U0000004', 'C0000010', '2025-09-24');

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

-- Mike Wazowsky helps Luffy with checking out Great Gatsby: Jaiden
Insert INTO Assists VALUES ('U0000007', 'T0000001');

-- Mike Wazowsky helps ___ with checking out ___: Jaiden
Insert INTO Assists VALUES ('U0000007', 'T0000002');

-- Edna Mode helps ___ with checking out ___: Jaiden
Insert INTO Assists VALUES ('U0000010', 'T0000003');

-- Danny Phantom helps ___ with checking out ___: Jaiden
Insert INTO Assists VALUES ('U0000009', 'T0000004');

-- Scrooge McDuck helps ___ with checking out ___: Jaiden
Insert INTO Assists VALUES ('U0000008', 'T0000005');

-- Scrooge McDuck helps ___ with checking out ___: Jaiden
Insert INTO Assists VALUES ('U0000008', 'T0000006');

-- Danny Phantom helps ___ with checking out ___: Jaiden
Insert INTO Assists VALUES ('U0000009', 'T0000007');

-- Mike Wazowsky helps ___ with checking out ___: Jaiden
Insert INTO Assists VALUES ('U0000007', 'T0000008');

-- Edna Mode helps ___ with checking out ___: Jaiden
Insert INTO Assists VALUES ('U0000010', 'T0000009');

-- Edna Mode helps ___ with checking out ___: Jaiden
Insert INTO Assists VALUES ('U0000010', 'T00000010');



--~~~~~~~~~~~~~~~~~~~~~~~~~
--    Pays
--~~~~~~~~~~~~~~~~~~~~~~~~~

--~~~~~~~~~~~~~~~~~~~~~~~~~
--    FEE
--~~~~~~~~~~~~~~~~~~~~~~~~~

--~~~~~~~~~~~~~~~~~~~~~~~~~
--    Rents
--~~~~~~~~~~~~~~~~~~~~~~~~~