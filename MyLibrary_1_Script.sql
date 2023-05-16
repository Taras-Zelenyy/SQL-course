IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'MyLibrary')
CREATE DATABASE MyLibrary;

USE MyLibrary
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookCopy_Book]') AND type = 'F')
ALTER TABLE BookCopy DROP CONSTRAINT FK_BookCopy_Book;

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FK_LibraryLog_BookCopy]') AND type = 'F')
	ALTER TABLE LibraryLog DROP CONSTRAINT FK_LibraryLog_BookCopy;

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FK_LibraryLog_Reader]') AND type = 'F')
	ALTER TABLE LibraryLog DROP CONSTRAINT FK_LibraryLog_Reader;

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FK_Reader_ReaderPassword]') AND type = 'F')
	ALTER TABLE Reader DROP CONSTRAINT FK_Reader_ReaderPassword;

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LibraryLog]') AND type in (N'U'))
	DROP TABLE [dbo].[LibraryLog];

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BookCopy]') AND type in (N'U'))
	DROP TABLE [dbo].[BookCopy];

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReaderPassword]') AND type in (N'U'))
	DROP TABLE [dbo].[ReaderPassword];

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reader]') AND type in (N'U'))
	DROP TABLE [dbo].[Reader];

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Book]') AND type in (N'U'))
	DROP TABLE [dbo].[Book];

CREATE TABLE Book
(
	BookId INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Title NVARCHAR(MAX) NOT NULL,
	BookDescription NVARCHAR(MAX)
);

CREATE TABLE BookCopy 
(
	BookCopyId INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	BookStatus BIT,
	BookId INT NOT NULL,
	CONSTRAINT FK_BookCopy_Book FOREIGN KEY (BookId) REFERENCES Book(BookId)
);

CREATE TABLE ReaderPassword
(
	UserPassword NVARCHAR(MAX) NOT NULL,
	ReaderId INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
);

CREATE TABLE Reader
(
	ReaderId INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	FirstName NVARCHAR(MAX) NOT NULL,
	LastName NVARCHAR(MAX) NOT NULL,
	Email NVARCHAR(255) NOT NULL,
	PhoneNumber NVARCHAR(12) NOT NULL,
	CONSTRAINT FK_Reader_ReaderPassword FOREIGN KEY (ReaderId) REFERENCES ReaderPassword(ReaderId)
);

CREATE TABLE LibraryLog 
(
	LibraryLogId INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	DateOfTaking DATETIME NOT NULL,
	DateOfReturning DATETIME NOT NULL,
	ReaderId INT NOT NULL,
	BookCopyId INT NOT NULL,
	CONSTRAINT FK_LibraryLog_BookCopy FOREIGN KEY (BookCopyId) REFERENCES dbo.BookCopy(BookCopyId),
	CONSTRAINT FK_LibraryLog_Reader FOREIGN KEY (ReaderId) REFERENCES dbo.Reader(ReaderId)
);

INSERT INTO Book (Title, BookDescription)
	VALUES ('Pride and Prejudice', 'A novel by Jane Austen'),
		   ('To Kill a Mockingbird', 'A novel by Harper Lee'),
		   ('1984', 'A novel by George Orwell'),
		   ('The Catcher in the Rye', 'A novel by J.D. Salinger'),
		   ('Brave New World', 'A novel by Aldous Huxley');

INSERT INTO BookCopy (BookStatus, BookId)
VALUES (0, 1),
		(1, 1),
		(0, 2),
		(1, 2),
		(0, 3),
		(1, 3),
		(0, 4),
		(1, 4),
		(0, 5),
		(1, 5);

INSERT INTO ReaderPassword (UserPassword)
VALUES ('password123'),
		('letmein'),
		('changeme'),
		('password'),
		('123456');

INSERT INTO Reader (FirstName, LastName, Email, PhoneNumber)
VALUES ('John', 'Doe', 'johndoe@example.com', '555-1234'),
		('Jane', 'Smith', 'janesmith@example.com', '555-5678'),
		('Bob', 'Johnson', 'bobjohnson@example.com', '555-9012'),
		('Samantha', 'Lee', 'samanthalee@example.com', '555-3456'),
		('David', 'Brown', 'davidbrown@example.com', '555-7890');

INSERT INTO LibraryLog (DateOfTaking, DateOfReturning, ReaderId, BookCopyId)
VALUES ('2022-01-01', '2022-01-15', 1, 1),
		('2022-01-05', '2022-01-20', 2, 3),
		('2022-01-10', '2022-01-25', 3, 5),
		('2022-01-15', '2022-01-30', 4, 7),
		('2022-01-20', '2022-02-5', 5, 9);

--GO  
--	EXEC StorageMyLibrary_DropTables; 
--GO

--GO  
--	EXEC StorageMyLibrary_CreateTables; 
--GO  

--GO  
--	EXEC StorageMyLibrary_InsertTables; 
--GO  