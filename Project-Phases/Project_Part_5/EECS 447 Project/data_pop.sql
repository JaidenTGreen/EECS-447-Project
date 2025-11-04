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
--    ITEMS and BOOKS
--~~~~~~~~~~~~~~~~~~~~~~~~~

--Great Gatsby Book and rest of books: Jaiden and Shero
INSERT INTO Items (CopyID, Title, Genre, ReleaseDate, Availability, NumofCheckouts, Duedate) VALUES 
('C0000001', 'The Great Gatsby', 'Fiction', '1925-04-10', 1, 5, NULL),
('C0000002','To Kill a Mockingbird','Fiction','1960-07-11', 1, 18, NULL),
('C0000003','1984','Dystopian','1949-06-08', 0, 25, '2025-11-18'),
('C0000004','Clean Code','Education','2008-08-01', 1, 12, NULL),
('C0000005','The Pragmatic Programmer','Education','1999-10-30', 1, 14, NULL),
('C0000006','The Hobbit','Fantasy','1937-09-21', 0, 33, '2025-11-20'),
('C0000007','Sapiens','Nonfiction','2011-01-01', 1, 9, NULL),
('C0000008','Dune','Sci-Fi','1965-08-01', 0, 21, '2025-11-22'),
('C0000009','The Catcher in the Rye','Fiction','1951-07-16', 1, 17, NULL),
('C0000010','Introduction to Algorithms','Education','2009-07-31', 1, 7, NULL);

INSERT INTO Books (CopyID, ISBN, Author) VALUES 
('C0000001', '9780743273565', 'F. Scott Fitzgerald'),
('C0000002','9780061120084','Harper Lee'),
('C0000003','9780451524935','George Orwell'),
('C0000004','9780132350884','Robert C. Martin'),
('C0000005','9780201616224','Andrew Hunt & David Thomas'),
('C0000006','9780547928227','J.R.R. Tolkien'),
('C0000007','9780062316097','Yuval Noah Harari'),
('C0000008','9780441172719','Frank Herbert'),
('C0000009','9780316769488','J.D. Salinger'),
('C0000010','9780262033848','Cormen, Leiserson, Rivest, Stein');

--~~~~~~~~~~~~~~~~~~~~~~~~~
--    ITEMS and MOVIES
--~~~~~~~~~~~~~~~~~~~~~~~~~

-- Movies: Shero

INSERT INTO Items (CopyID, Title, Genre, ReleaseDate, Availability, NumofCheckouts, Duedate) VALUES
('C0000011','Inception','Sci-Fi','2010-07-16', 1, 40, NULL),
('C0000012','The Grand Budapest Hotel','Comedy','2014-03-28', 1, 19, NULL),
('C0000013','Arrival','Sci-Fi','2016-11-11', 0, 23, '2025-11-25'),
('C0000014','The Social Network','Drama','2010-10-01', 1, 27, NULL),
('C0000015','Spider-Verse','Animation','2018-12-14', 1, 31, NULL),
('C0000016','Interstellar','Sci-Fi','2014-11-07', 0, 45, '2025-11-19'),
('C0000017','La La Land','Musical','2016-12-09', 1, 22, NULL),
('C0000018','Mad Max: Fury Road','Action','2015-05-15', 1, 38, NULL),
('C0000019','The Martian','Sci-Fi','2015-10-02', 0, 29, '2025-11-21'),
('C0000020','Inside Out','Family','2015-06-19', 1, 34, NULL);

INSERT INTO Movies (CopyID, Rating, Director) VALUES
('C0000011','87%','Christopher Nolan'),
('C0000012','92%','Wes Anderson'),
('C0000013','94%','Denis Villeneuve'),
('C0000014','96%','David Fincher'),
('C0000015','97%','Bob Persichetti'),
('C0000016','73%','Christopher Nolan'),
('C0000017','91%','Damien Chazelle'),
('C0000018','97%','George Miller'),
('C0000019','91%','Ridley Scott'),
('C0000020','98%','Pete Docter');

--~~~~~~~~~~~~~~~~~~~~~~~~~
--    ITEMS and MAGAZINES
--~~~~~~~~~~~~~~~~~~~~~~~~~

--Magazine: Shero

INSERT INTO Items (CopyID, Title, Genre, ReleaseDate, Availability, NumofCheckouts, Duedate) VALUES
('C0000021','National Geographic Oct 2025','Magazine','2025-10-01', 1, 4,  NULL),
('C0000022','The New Yorker Sep 2025','Magazine','2025-09-15', 1, 6,  NULL),
('C0000023','Scientific American Aug 2025','Magazine','2025-08-01', 1, 8,  NULL),
('C0000024','Time Nov 2025','Magazine','2025-11-01', 0, 2,  '2025-11-18'),
('C0000025','Wired Jul 2025','Magazine','2025-07-01', 1, 5,  NULL),
('C0000026','Economist Oct 2025','Magazine','2025-10-05', 1, 3,  NULL),
('C0000027','Nature Sep 2025','Magazine','2025-09-07', 1, 9,  NULL),
('C0000028','IEEE Spectrum Aug 2025','Magazine','2025-08-15', 1, 7,  NULL),
('C0000029','Sports Illustrated Oct 2025','Magazine','2025-10-10', 1, 3,  NULL),
('C0000030','Popular Science Jun 2025','Magazine','2025-06-10', 1, 6,  NULL);

INSERT INTO Magazines (CopyID, IssueNum, Publisher) VALUES
('C0000021','102025','National Geographic'),
('C0000022','092025','Condé Nast'),
('C0000023','082025','Springer Nature'),
('C0000024','112025','Time USA, LLC'),
('C0000025','072025','Condé Nast'),
('C0000026','102025','The Economist Group'),
('C0000027','092025','Springer Nature'),
('C0000028','082025','IEEE'),
('C0000029','102025','Authentic Brands'),
('C0000030','062025','Recurrent');

--~~~~~~~~~~~~~~~~~~~~~~~~~
--    Rented
--~~~~~~~~~~~~~~~~~~~~~~~~~

--Rented: Shero

INSERT INTO Rented (TransactionID, CopyID) VALUES
('T0000001','C0000001'), -- Luffy checked out Gatsby
('T0000002','C0000003'),
('T0000003','C0000006'),
('T0000004','C0000008'),
('T0000005','C0000013'),
('T0000006','C0000016'),
('T0000007','C0000019'),
('T0000008','C0000024'),
('T0000009','C00000011'), 
('T0000010','C0000006');

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

-- Luffy, T0000001: returned late by 1 day
INSERT INTO FEE VALUES ('F0000001','U0000001','2025-10-15','2025-10-16', TRUE ,'Credit Card', TRUE ,'T0000001', 5.00);

-- Frank, T0000002: paid early, not overdue
INSERT INTO FEE VALUES ('F0000002','U0000002','2025-10-20','2025-10-19', FALSE,'Cash', TRUE ,'T0000002', 5.00);

-- Dennis, T0000003: unpaid and overdue as of 2025-11-03
INSERT INTO FEE VALUES ('F0000003','U0000003','2025-10-22', NULL, TRUE ,'Pending', FALSE,'T0000003', 5.00);

-- Dee, T0000004: unpaid, not overdue yet (due 2025-11-05)
INSERT INTO FEE VALUES ('F0000004','U0000004','2025-11-05', NULL, FALSE,'Pending', FALSE,'T0000004', 5.00);

-- Mac, T0000005: paid on time
INSERT INTO FEE VALUES ('F0000005','U0000005','2025-10-25','2025-10-25', FALSE,'Online', TRUE ,'T0000005', 5.00);

-- Charlie, T0000006: paid after due date -> overdue
INSERT INTO FEE VALUES ('F0000006','U0000006','2025-10-28','2025-11-01', TRUE ,'Debit Card', TRUE ,'T0000006', 5.00);

-- Luffy again, T0000007: unpaid, future due date
INSERT INTO FEE VALUES ('F0000007','U0000001','2025-11-10', NULL, FALSE,'Pending', FALSE,'T0000007', 5.00);

-- Frank, T0000008: paid on time
INSERT INTO FEE VALUES ('F0000008','U0000002','2025-10-18','2025-10-18', FALSE,'Cash', TRUE ,'T0000008', 5.00);

-- Dennis, T0000009: unpaid and overdue (due 2025-11-02)
INSERT INTO FEE VALUES ('F0000009','U0000003','2025-11-02', NULL, TRUE ,'Pending', FALSE,'T0000009', 5.00);

-- Dee, T0000010: unpaid, future due date
INSERT INTO FEE VALUES ('F0000010','U0000004','2025-11-12', NULL, FALSE,'Pending', FALSE,'T0000010', 5.00);

--~~~~~~~~~~~~~~~~~~~~~~~~~
--    Rents
--~~~~~~~~~~~~~~~~~~~~~~~~~
