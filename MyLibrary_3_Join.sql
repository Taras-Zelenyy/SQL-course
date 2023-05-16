 USE MyLibrary

DROP INDEX IF EXISTS Index_Reader_Email ON Reader;
DROP INDEX IF EXISTS Index_Reader_PhoneNumber ON Reader;

--Inner Join
SELECT b.BookId, b.Title, b.BookDescription, bc.BookCopyId, bc.BookStatus, r.FirstName, r.LastName, r.Email, r.PhoneNumber, ll.DateOfTaking, ll.DateOfReturning
FROM Book b
INNER JOIN BookCopy bc ON b.BookId = bc.BookId
INNER JOIN LibraryLog ll ON bc.BookCopyId = ll.BookCopyId
INNER JOIN Reader r ON ll.ReaderId = r.ReaderId
INNER JOIN ReaderPassword rp ON r.ReaderId = rp.ReaderId

--Right Join
SELECT *
FROM Book b
RIGHT JOIN BookCopy bc ON b.BookId = bc.BookId
RIGHT JOIN LibraryLog ll ON bc.BookCopyId = ll.BookCopyId
RIGHT JOIN Reader r ON ll.ReaderId = r.ReaderId
RIGHT JOIN ReaderPassword rp ON r.ReaderId = rp.ReaderId

--Left Join
SELECT *
FROM Book b
LEFT JOIN BookCopy bc ON b.BookId = bc.BookId
LEFT JOIN LibraryLog ll ON bc.BookCopyId = ll.BookCopyId
LEFT JOIN Reader r ON ll.ReaderId = r.ReaderId
LEFT JOIN ReaderPassword rp ON r.ReaderId = rp.ReaderId

--Використання Join з використанням оператора з 2 лабораторної
SELECT rp.UserPassword AS "Password", r.FirstName AS "FirstName", COUNT(lc.LibraryLogId) AS "Count of books"
FROM LibraryLog lc
INNER JOIN Reader r ON lc.ReaderId = r.ReaderId
INNER JOIN ReaderPassword rp ON r.ReaderId = rp.ReaderId
GROUP BY rp.UserPassword, r.FirstName
ORDER BY r.FirstName ASC

CREATE UNIQUE INDEX Index_Reader_Email ON Reader (Email);
CREATE UNIQUE INDEX Index_Reader_PhoneNumber ON Reader (PhoneNumber);

--SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID('Reader') AND name = 'Index_Reader_Email';
--SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID('Reader') AND name = 'Index_Reader_PhoneNumber';