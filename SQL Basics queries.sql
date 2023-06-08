CREATE DATABASE Bookstore;
CREATE TABLE Authors (
  AuthorID INT PRIMARY KEY,
  FirstName VARCHAR(255),
  LastName VARCHAR(255)
);

CREATE TABLE Books (
  BookID INT PRIMARY KEY,
  Title VARCHAR(255),
  AuthorID INT,
  FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

INSERT INTO Authors (AuthorID, FirstName, LastName)
VALUES
  (1, 'John', 'Kindee'),
  (2, 'Mark', 'Mulwa'),
  (3, 'David', 'Maraga');


  INSERT INTO Books (BookID, Title, AuthorID)
VALUES
  (1, 'Book1', 1),
  (2, 'Book2', 2),
  (3, 'Book3', 3);


  --Retrieve the book with the title 'Book2':

  SELECT * FROM Books WHERE Title = 'Book2';

  --Update the author's last name to 'Smithson' for the book with the title 'Book1
  UPDATE Authors
SET LastName = 'Smithson'
WHERE AuthorID = (SELECT AuthorID FROM Books WHERE Title = 'Book1');

--Delete the author with AuthorID 3 and their associated books from the database:
DELETE FROM Books WHERE AuthorID = 3;
DELETE FROM Authors WHERE AuthorID = 3;

--Count the total number of books in the "Books" table:
SELECT COUNT(*) AS TotalBooks FROM Books;

--Retrieve all books along with their authors' first and last names:
SELECT Books.Title, Authors.FirstName, Authors.LastName
FROM Books
JOIN Authors ON Books.AuthorID = Authors.AuthorID;
