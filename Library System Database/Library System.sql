/*-------------------------------*/
/*    LIBRARY SYSTEM DATABASE    */
/*     (C) 2018 SAGE FREMONT     */
/*-------------------------------*/


/*----------------------*/
/*    TABLE CREATION    */
/*----------------------*/

CREATE TABLE Book
(
    ISBN integer NOT NULL,
    Title varchar(60) NOT NULL,
    Author varchar(40),
    Cost decimal(10,2),
    UNIQUE (ISBN),
    PRIMARY KEY (ISBN)
);

CREATE TABLE BookCopy
(
    ISBN integer NOT NULL,
    sequence integer NOT NULL,
    PublicationDate date,
    UNIQUE (ISBN, sequence),
    PRIMARY KEY (ISBN, sequence),
    FOREIGN KEY (ISBN) REFERENCES Book(ISBN) ON DELETE CASCADE
);

CREATE TABLE Borrower
(
    LibraryCard integer NOT NULL IDENTITY,
    Name char(40) NOT NULL,
    Address char(40),
    PostalCode char(20),
    PhoneNumber char(20),
    MembershipDate date,
    PRIMARY KEY (LibraryCard)
);

CREATE TABLE Librarian
(
    LibrarianID integer NOT NULL,
    Name char(40) NOT NULL,
    PhoneNumber char(20),
    Supervisor integer,
    UNIQUE (LibrarianID),
    PRIMARY KEY (LibrarianID)
);

CREATE TABLE BookLended
(
    LibraryCard integer NOT NULL,
    CheckoutDate date NOT NULL,
    ReturnDate date,
    ISBN integer NOT NULL,
    sequence integer NOT NULL,
    LibrarianID integer NOT NULL,
    UNIQUE (LibraryCard, CheckoutDate, ISBN, sequence),
    PRIMARY KEY (LibraryCard, CheckoutDate, ISBN, sequence),
    FOREIGN KEY (LibraryCard) REFERENCES Borrower(LibraryCard) ON DELETE CASCADE,
    FOREIGN KEY (ISBN, sequence) REFERENCES BookCopy(ISBN, sequence),
    FOREIGN KEY (LibrarianID) REFERENCES Librarian(LibrarianID) ON DELETE CASCADE
);

/*--------------------------------------*/
/*    Book - EXAMPLE DATA POPULATION    */
/*--------------------------------------*/

INSERT INTO Book
    (ISBN, Title, Author, Cost)
    VALUES (1441438, 'Alice in Wonderland', 'Lewis Carroll', 7.95);

INSERT INTO Book
    (ISBN, Title, Author, Cost)
    VALUES (6006374, 'A First Course in Database Systems (3rd ed.)', 'Jeffrey Ullman', 99.49);

INSERT INTO Book
    (ISBN, Title, Author, Cost)
    VALUES (3523323, 'Database System Concepts', 'Abraham Silberschatz', 119.67);

INSERT INTO Book
    (ISBN, Title, Author, Cost)
    VALUES (1429477, 'Grimm’s Fairy Tales', 'Jacob Grimm', 26.99);

INSERT INTO Book
    (ISBN, Title, Author, Cost)
    VALUES (1486025, 'A Tale of Two Cities', 'Charles Dickens', 7.95);

INSERT INTO Book
    (ISBN, Title, Author, Cost)
    VALUES (1853602, 'War and Peace', 'Leo Tolstoy', 7.99);
    
INSERT INTO Book
    (ISBN, Title, Author, Cost)
    VALUES (1904129, 'The Scarlet letter', 'Nathaniel Hawthorne', 7.95);
        
INSERT INTO Book
    (ISBN, Title, Author, Cost)
    VALUES (1593832, 'Pride and Prejudice', 'Jane Austen', 7.95);

INSERT INTO Book
    (ISBN, Title, Author, Cost)
    VALUES (1538243, 'Pride and Prejudice', 'Jane Austen', 7.95);

/*------------------------------------------*/
/*    BookCopy - EXAMPLE DATA POPULATION    */
/*------------------------------------------*/

INSERT INTO BookCopy
    (ISBN, sequence, PublicationDate)
    VALUES (1441438, 1, '1997-05-01');

INSERT INTO BookCopy
    (ISBN, sequence, PublicationDate)
    VALUES (6006374, 1, '2007-10-06');

INSERT INTO BookCopy
    (ISBN, sequence, PublicationDate)
    VALUES (6006374, 2, '2007-10-06');

INSERT INTO BookCopy
    (ISBN, sequence, PublicationDate)
    VALUES (3523323, 1, '2010-01-27');
    
INSERT INTO BookCopy
    (ISBN, sequence, PublicationDate)
    VALUES (1429477, 1, '2004-02-01');

INSERT INTO BookCopy
    (ISBN, sequence, PublicationDate)
    VALUES (1429477, 2, '2004-02-01');

INSERT INTO BookCopy
    (ISBN, sequence, PublicationDate)
    VALUES (1429477, 3, '2004-02-01');

INSERT INTO BookCopy
    (ISBN, sequence, PublicationDate)
    VALUES (1429477, 4, '2004-02-01');

INSERT INTO BookCopy
    (ISBN, sequence, PublicationDate)
    VALUES (1486025, 1, '2010-12-01');

INSERT INTO BookCopy
    (ISBN, sequence, PublicationDate)
    VALUES (1853602, 1, '2007-09-01');

INSERT INTO BookCopy
    (ISBN, sequence, PublicationDate)
    VALUES (1853602, 2, '2010-09-01');

INSERT INTO BookCopy
    (ISBN, sequence, PublicationDate)
    VALUES (1904129, 1, '2009-10-01');

INSERT INTO BookCopy
    (ISBN, sequence, PublicationDate)
    VALUES (1593832, 1, '2004-09-20');

INSERT INTO BookCopy
    (ISBN, sequence, PublicationDate)
    VALUES (1538243, 1, '2004-09-20');

INSERT INTO BookCopy
    (ISBN, sequence, PublicationDate)
    VALUES (1538243, 2, '2004-09-20');

/*------------------------------------------*/
/*    Borrower - EXAMPLE DATA POPULATION    */
/*------------------------------------------*/

INSERT INTO Borrower
    (LibraryCard, Name, Address, PostalCode, PhoneNumber, MembershipDate)
    VALUES (1, 'Samil Shah', '123 Home st', '62989', '555-1212', '2008-02-01');

INSERT INTO Borrower
    (Name, Address, PostalCode, PhoneNumber, MembershipDate)
    VALUES ('Tim Jones', '3435 Main st.', '54232', '555-2934', '2011-07-13');

INSERT INTO Borrower
    (Name, Address, PostalCode, PhoneNumber, MembershipDate)
    VALUES ('Sue Smith', '2176 Baker st.', '43542', '555-6723', '2005-05-10');

INSERT INTO Borrower
    (Name, Address, PostalCode, PhoneNumber, MembershipDate)
    VALUES ('Jeff Bridges', '176 Right st.', '28460', '555-1745', '2010-06-20');

INSERT INTO Borrower
    (Name, Address, PostalCode, PhoneNumber, MembershipDate)
    VALUES ('Steve Smith', '435 Main St.', '28454', '555-6565', '2005-05-18');

INSERT INTO Borrower
    (Name, Address, PostalCode, PhoneNumber, MembershipDate)
    VALUES ('Arun Goel', '34 Home St.', '56234', '555-4889', '2008-03-15');

INSERT INTO Borrower
    (Name, Address, PostalCode, PhoneNumber, MembershipDate)
    VALUES ('Jane Doe', '65 Water St.', '42358', '555-4581', '2011-09-07');

INSERT INTO Borrower
    (Name, Address, PostalCode, PhoneNumber, MembershipDate)
    VALUES ('Jim Jones', '23 Hill Drive', '85423', '555-7891', '2010-11-23');

/*--------------------------------------------*/
/*    BookLended - EXAMPLE DATA POPULATION    */
/*--------------------------------------------*/

INSERT INTO BookLended
    (LibraryCard, CheckoutDate, ReturnDate, ISBN, sequence, LibrarianID)
    VALUES (2, '2010-12-01', '2013-10-20', 1441438, 1, 1);

INSERT INTO BookLended
    (LibraryCard, CheckoutDate, ReturnDate, ISBN, sequence, LibrarianID)
    VALUES (5, '2010-12-01', '2010-10-01', 6006374, 2, 2);

INSERT INTO BookLended
    (LibraryCard, CheckoutDate, ReturnDate, ISBN, sequence, LibrarianID)
    VALUES (2, '2010-12-01', '2012-01-20', 3523323, 1, 2);

INSERT INTO BookLended
    (LibraryCard, CheckoutDate, ReturnDate, ISBN, sequence, LibrarianID)
    VALUES (8, '2010-12-01', '2015-01-27', 1429477, 1, 3);

INSERT INTO BookLended
    (LibraryCard, CheckoutDate, ReturnDate, ISBN, sequence, LibrarianID)
    VALUES (6, '2010-12-01', '2015-07-01', 1853602, 2, 4);

INSERT INTO BookLended
    (LibraryCard, CheckoutDate, ReturnDate, ISBN, sequence, LibrarianID)
    VALUES (3, '2010-12-01', '2015-08-23', 1904129, 1, 2);

/*-------------------------------------------*/
/*    Librarian - EXAMPLE DATA POPULATION    */
/*-------------------------------------------*/

INSERT INTO Librarian
    (LibrarianID, Name, PhoneNumber, Supervisor)
    VALUES (1, 'Gertrude Smith', '555-1212', NULL);

INSERT INTO Librarian
    (LibrarianID, Name, PhoneNumber, Supervisor)
    VALUES (2, 'Mable Markham', '555-1212', 1);

INSERT INTO Librarian
    (LibrarianID, Name, PhoneNumber, Supervisor)
    VALUES (3, 'Penelope Pretty', '555-1212', 1);

INSERT INTO Librarian
    (LibrarianID, Name, PhoneNumber, Supervisor)
    VALUES (4, 'Olga Brown', '555-2300', 1);

/*--------------------------------------------------------------------------------------------*/
/*  EXAMPLE SQL QUERY - Considers only books that are past due and greater cost than $10.00   */
/*  returns the name, address, postal code, and phone number of the Borrower                  */
/*  returns the name and phone number of the Librarian responsible for the transaction        */
/*  returns the date the book was due to be returned, title, cost, and ISBN of the book       */
/*  sorts the list by the return date in descending order                                     */
/*--------------------------------------------------------------------------------------------*/
SELECT O.RETURNDATE, B.ISBN, B.TITLE, B.COST, C.NAME, C.ADDRESS, C.POSTALCODE, C.PHONENUMBER,
    L.NAME, L.PHONENUMBER
FROM BOOK B, BORROWER C, BOOKLENDED O, LIBRARIAN L
WHERE O.LIBRARYCARD = C.LIBRARYCARD 
    AND O.LIBRARIANID = L.LIBRARIANID
    AND O.ISBN = B.ISBN
    AND O.RETURNDATE < CURRENT_DATE
    AND B.COST > 10.00
ORDER BY O.RETURNDATE DESC;