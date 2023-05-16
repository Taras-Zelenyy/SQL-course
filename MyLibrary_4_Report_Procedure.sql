IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'MyLibraryReport')
CREATE DATABASE MyLibraryReport;

USE MyLibraryReport

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reader_Report]') AND type in (N'U'))
DROP TABLE [dbo].[Reader_Report];

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LibraryLog_Report]') AND type in (N'U'))
DROP TABLE [dbo].[LibraryLog_Report];

--DROP PROCEDURE IF EXISTS InsertReaderReport
--DROP SYNONYM IF EXISTS InsertReaderReportSynonym

--DROP PROCEDURE IF EXISTS InsertLibraryLogReport
--DROP SYNONYM IF EXISTS InsertLibraryLogReportSynonym

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Reader_Report')
	BEGIN
		CREATE TABLE Reader_Report
		(
			ReaderId INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
			FirstName NVARCHAR(255) NOT NULL,
			LastName NVARCHAR(255) NOT NULL,
			Email NVARCHAR(255) NOT NULL,
			PhoneNumber NVARCHAR(12) NOT NULL
		);
	END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'LibraryLog_Report')
	BEGIN
		CREATE TABLE LibraryLog_Report
		(
			LibraryLogId INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
			DateOfTaking DATETIME NOT NULL,
			DateOfReturning DATETIME NOT NULL,
			ReaderId INT NOT NULL,
			BookCopyId INT NOT NULL,
		);
	END

--------------------------Reader------------------------------------
--GO
--	CREATE PROCEDURE InsertReaderReportWithParametr @PhoneNumber NVARCHAR(12)
--	AS
--		BEGIN
--			SET NOCOUNT ON;

--			INSERT INTO Reader_Report (FirstName, LastName, Email, PhoneNumber)
--			SELECT FirstName, LastName, Email, PhoneNumber
--			FROM MyLibrary.dbo.Reader
--			WHERE PhoneNumber = @PhoneNumber
--		END

GO
	EXEC InsertReaderReportWithParametr '555-1234';

--------------------------LibraryLog------------------------------------
--GO
--	CREATE PROCEDURE InsertLibraryLogReportWithParametr @ReaderId INT
--	AS
--		BEGIN
--			SET NOCOUNT ON;
--			INSERT INTO LibraryLog_Report (DateOfTaking, DateOfReturning, ReaderId, BookCopyId)
--			SELECT DateOfTaking, DateOfReturning, ReaderId, BookCopyId
--			FROM MyLibrary.dbo.LibraryLog
--			WHERE ReaderId = @ReaderId
--		END

GO
	EXEC InsertLibraryLogReportWithParametr '1'