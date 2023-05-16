USE MyLibrary

DROP VIEW IF EXISTS dbo.View_Book
DROP VIEW IF EXISTS dbo.View_BookCopy
DROP VIEW IF EXISTS dbo.View_ReaderPassword
DROP VIEW IF EXISTS dbo.View_LibraryLog
DROP VIEW IF EXISTS dbo.View_Reader

DROP TRIGGER IF EXISTS dbo.TrigerInsertDateOfTaking
DROP TRIGGER IF EXISTS dbo.TrigerInsertDateOfReturning

DROP FUNCTION IF EXISTS GetReaderName
DROP FUNCTION IF EXISTS MyTableFunction

GO
	CREATE VIEW View_Book AS
	SELECT Title, BookDescription
	FROM Book
	WHERE BookDescription LIKE 'A novel%';

GO
	CREATE VIEW View_BookCopy AS
	SELECT BookStatus, BookId
	FROM BookCopy
	WHERE BookStatus = 1;

GO
	CREATE VIEW View_ReaderPassword AS
	SELECT UserPassword, ReaderId
	FROM ReaderPassword
	WHERE ReaderId = 1;

GO
	CREATE VIEW View_LibraryLog AS
	SELECT DateOfTaking, DateOfReturning, ReaderId, BookCopyId,
	CONVERT(NVARCHAR(80), DATEDIFF(DAY, DateOfTaking, DateOfReturning)) + ' Day(s)' AS Duration
	FROM LibraryLog

GO
	CREATE VIEW View_Reader AS
	SELECT FirstName, LastName, Email, PhoneNumber, GETDATE() as 'Current date time'
	FROM Reader
	WHERE Email LIKE '%@example.com';
	
GO
	CREATE TRIGGER TrigerInsertDateOfTaking
	ON dbo.LibraryLog
	AFTER INSERT
	AS
		BEGIN
			UPDATE dbo.LibraryLog
			SET DateOfTaking = GETDATE()
			FROM dbo.LibraryLog
			INNER JOIN inserted ON dbo.LibraryLog.LibraryLogId = inserted.LibraryLogId
		END;

GO
	CREATE TRIGGER TrigerInsertDateOfReturning
	ON dbo.LibraryLog
	AFTER INSERT
	AS
		BEGIN
			UPDATE dbo.LibraryLog
			SET DateOfReturning = GETDATE() + 10
			FROM dbo.LibraryLog
			INNER JOIN inserted ON dbo.LibraryLog.LibraryLogId = inserted.LibraryLogId
		END;

GO
	DELETE FROM LibraryLog;
	--TRUNCATE TABLE LibraryLog;

GO
	INSERT INTO LibraryLog (DateOfTaking, DateOfReturning, ReaderId, BookCopyId)
	VALUES ('2022-01-01', '2022-01-15', 1, 1),
			('2022-01-05', '2022-01-20', 2, 3),
			('2022-01-10', '2022-01-25', 3, 5),
			('2022-01-15', '2022-01-30', 4, 7),
			('2022-01-20', '2022-02-5', 5, 9);

GO
	Select * FROM LibraryLog
	Select AVG(CONVERT(INT, DATEDIFF(DAY, DateOfTaking, DateOfReturning))) AS 'AVG Day(s)' FROM View_LibraryLog

GO
	CREATE FUNCTION GetReaderName(@ReaderId INT)
	RETURNS NVARCHAR(MAX)
	AS
		BEGIN
			DECLARE @FullName NVARCHAR(MAX)

			SELECT @FullName = CONCAT(FirstName, ' ', LastName)
			FROM Reader
			WHERE ReaderId = @ReaderId

			RETURN @FullName
		END

GO
	SELECT dbo.GetReaderName(Reader.ReaderId) AS "Full Name", Reader.PhoneNumber FROM dbo.Reader

GO
	CREATE FUNCTION dbo.MyTableFunction (@ReaderId INT)
	RETURNS TABLE
	AS
		RETURN (
			SELECT *
			FROM Reader
			WHERE ReaderId IN (SELECT ReaderId FROM Reader  WHERE ReaderId >= @ReaderId)
		);

GO
	SELECT * FROM dbo.MyTableFunction(1);

--GO
--	DECLARE @number INT
--	SET @number = 5;
 
--	WHILE @number > 0
--		BEGIN
--			SELECT * FROM dbo.MyTableFunction(@number);
--			SET @number = @number - 1
--		END;