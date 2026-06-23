-- Create Database
CREATE DATABASE OnlineBookstore;

-- Switch to the database
\c OnlineBookstore;

-- Create Tables

CREATE TABLE Books (
    Book_ID SERIAL PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Published_Year INT,
    Price NUMERIC(10, 2),
    Stock INT
);

CREATE TABLE Customers (
    Customer_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    Country VARCHAR(150)
);

CREATE TABLE Orders (
    Order_ID SERIAL PRIMARY KEY,
    Customer_ID INT REFERENCES Customers(Customer_ID),
    Book_ID INT REFERENCES Books(Book_ID),
    Order_Date DATE,
    Quantity INT,
    Total_Amount NUMERIC(10, 2)
);

SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;


-- Import Data into Books Table
COPY Books(Book_ID, Title, Author, Genre,	Published_Year,	Price, Stock)
FROM 'D:\DATA ANALYTICS BY ASHU\SQL Sheets\All Excel Practice Files\Books.csv'
CSV HEADER;

-- Import Data into Customers Table
COPY Customers(Customer_ID, Name, Email, Phone,	City, Country)
FROM 'D:\DATA ANALYTICS BY ASHU\SQL Sheets\All Excel Practice Files\Customers.csv'
CSV HEADER;

-- Import Data into Orders Table
COPY Orders(Order_ID, Customer_ID, Book_ID, Order_Date,	Quantity, Total_Amount)
FROM 'D:\DATA ANALYTICS BY ASHU\SQL Sheets\All Excel Practice Files\orders.csv'
HEADER;


-- QUERIES

-- 1) Retrieve all books in the "Fiction" genre:

SELECT * FROM Books
WHERE Genre='Fiction';

-- 2) Find books published after the year 1950:

SELECT * FROM Books
WHERE Published_year>1950;

-- 3) List all customers from the Canada:

SELECT * FROM Customers
WHERE Country='Canada';

-- 4) Show orders placed in November 2023:

SELECT * FROM Orders
WHERE order_date Between'2023-11-01' AND '2023-11-30';

-- 5) Retrieve the total stock of books available:

SELECT SUM(stock) AS Total_Stocks
FROM Books;

-- 6) Find the details of the most expensive book:

SELECT * FROM Books ORDER BY price DESC LIMIT 1;

-- 7) Show all customers who ordered more than 1 quantity of a book:

SELECT * FROM Orders
WHERE Quantity>1;

-- 8) Retrieve all orders where the total amount exceeds $20:

SELECT * FROM Orders
WHERE total_amount>20;

-- 9) List all genres available in the Books table:

SELECT DISTINCT genre FROM Books;

-- 10) Find the book with the lowest stock:

SELECT * FROM Books ORDER BY stock LIMIT 1;

-- 11) Calculate the total revenue generated from all orders:

SELECT SUM(total_amount) AS Revenue FROM Orders;
