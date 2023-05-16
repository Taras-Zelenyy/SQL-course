USE MyLibrary

--UPDATE Book
--SET Title = 'Nineteen Eighty-Four'
--WHERE BookId = 3;

--UPDATE Book
--SET Title = 'Nineteen Eighty-Four'
--WHERE BookId = 3;

--UPDATE Reader
--SET Email = 'davidbrown123@example.com'
--WHERE ReaderId = 4;

--UPDATE LibraryLog
--SET DateOfReturning = '2022-01-25'
--WHERE LibraryLogId = 3;
GO
	EXEC dbo.DropAndCreateIndexes;

GO
	SELECT [UserPassword], [ReaderId] FROM ReaderPassword WHERE [ReaderId] = 1

	SELECT * FROM LibraryLog WHERE [BookCopyId] = 5

	SELECT * FROM Book WHERE [Title] = 'Nineteen Eighty-Four'

	SELECT [UserPassword], [ReaderId] FROM ReaderPassword WHERE [ReaderId] = 1

	SELECT * FROM Book WHERE [Title] LIKE 'T%';
	
	SELECT * FROM ReaderPassword WHERE UserPassword LIKE 'p%' or UserPassword LIKE 'l%';

	SELECT * FROM Reader WHERE FirstName LIKE 'j_%';

	SELECT * FROM Reader WHERE FirstName LIKE 'S_%' GROUP BY ReaderId, FirstName, LastName, Email, PhoneNumber HAVING LEN(FirstName) > 4;

	SELECT * FROM Book GROUP BY BookId, Title, BookDescription HAVING BookId >= 2 and BookId <= 4;

	SELECT * FROM LibraryLog 
	GROUP BY LibraryLogId, DateOfTaking, DateOfReturning, ReaderId, BookCopyId 
	HAVING DateOfTaking >= '2022-01-01 00:00:00.000' and DateOfReturning <= '2022-01-25 00:00:00.000';

	SELECT * FROM Book 
	ORDER BY Title ASC;

	SELECT * FROM Book 
	ORDER BY Title DESC;

	SELECT * FROM LibraryLog 
	GROUP BY LibraryLogId, DateOfTaking, DateOfReturning, ReaderId, BookCopyId 
	HAVING DateOfTaking >= '2022-01-01 00:00:00.000' and DateOfReturning <= '2022-01-25 00:00:00.000' 
	ORDER BY DateOfTaking, DateOfReturning;