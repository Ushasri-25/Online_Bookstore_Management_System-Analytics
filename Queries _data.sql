CREATE DATABASE online_bookstore_managementdb;


CREATE TABLE Books (
    Book_Id VARCHAR(10) PRIMARY KEY,
    Book_Title VARCHAR(255),
    Author VARCHAR(150),
    Category VARCHAR(100),
    Publication_Year INT,
    Publisher VARCHAR(150),
    Language VARCHAR(50),
    Pages INT,
    Unit_Price_Inr INT,
    Discount_Pct INT,
    Sale_Price_Inr DECIMAL(10,2),
    Stock_Quantity INT,
    Avg_Rating DECIMAL(3,1),
    Num_Reviews INT,
    Is_Bestseller VARCHAR(10)
);

--> View all books
SELECT * FROM Books;
--> Show book title and author
SELECT Book_Title, Author
FROM Books;

--> Find all bestseller books
SELECT * FROM Books
WHERE Is_Bestseller = 'Yes';

--> Books published after 2015
SELECT Book_Title, Publication_Year FROM Books
WHERE Publication_Year > 2015;

--> Books with rating greater than 4.5
SELECT Book_Title, Avg_Rating FROM Books
WHERE Avg_Rating > 4.5;

--> Most expensive books
SELECT Book_Title, Sale_Price_Inr FROM Books
ORDER BY Sale_Price_Inr DESC;

--> Highest-rated books
SELECT Book_Title, Avg_Rating FROM Books
ORDER BY Avg_Rating DESC;

--> Most reviewed books
SELECT Book_Title, Num_Reviews FROM Books
ORDER BY Num_Reviews DESC;

--> Total number of books
SELECT COUNT(*) AS Total_Books FROM Books;

--> Average sale price
SELECT AVG(Sale_Price_Inr) AS Avg_Sale_Price FROM Books;

--> Maximum and minimum sale price
SELECT
    MAX(Sale_Price_Inr) AS Highest_Price,
    MIN(Sale_Price_Inr) AS Lowest_Price
FROM Books

--> Total stock available
SELECT SUM(Stock_Quantity) AS Total_Stock
FROM Books;

--> Number of books by category
SELECT Category,
       COUNT(*) AS Total_Books
FROM Books
GROUP BY Category;

--> Average rating by category
SELECT Category,
       AVG(Avg_Rating) AS Avg_Category_Rating
FROM Books
GROUP BY Category;

--> Total stock by category
SELECT Category,
       SUM(Stock_Quantity) AS Total_Stock
FROM Books
GROUP BY Category;

--> Number of books by language
SELECT Language,
       COUNT(*) AS Total_Books
FROM Books
GROUP BY Language;

--> Top 5 highest-rated books
SELECT Book_Title, Author, Avg_Rating
FROM Books
ORDER BY Avg_Rating DESC
LIMIT 5;

--> Top 5 most reviewed books
SELECT Book_Title, Num_Reviews
FROM Books
ORDER BY Num_Reviews DESC
LIMIT 5;

--> Calculate discount amount for each book
SELECT Book_Title,
       Unit_Price_Inr,
       Sale_Price_Inr,
       (Unit_Price_Inr - Sale_Price_Inr) AS Discount_Amount
FROM Books;

--> Total inventory value
SELECT SUM(Stock_Quantity * Sale_Price_Inr) AS Total_Inventory_Value FROM Books;

--> Category with highest average rating
SELECT Category,
       AVG(Avg_Rating) AS Avg_Rating
FROM Books
GROUP BY Category
ORDER BY Avg_Rating DESC
LIMIT 1;

--> Rank books by rating
SELECT Book_Title,
       Avg_Rating,
       RANK() OVER (ORDER BY Avg_Rating DESC) AS Rating_Rank
FROM Books;

--> Rank books by reviews
SELECT Book_Title,
       Num_Reviews,
       DENSE_RANK() OVER (ORDER BY Num_Reviews DESC) AS Review_Rank
FROM Books;

--> Creating Table on customers 
CREATE TABLE Customers (
    Customer_Id VARCHAR(10) PRIMARY KEY,
    Customer_Name VARCHAR(100) NOT NULL,
    Gender VARCHAR(10),
    Age INT,
    Email VARCHAR(100) UNIQUE,
    Phone_Number BIGINT,
    City VARCHAR(50),
    State VARCHAR(50),
    Registration_Date DATE,
    Membership VARCHAR(20),
    Preferred_Category VARCHAR(50)
);

--> Total Customers
SELECT COUNT(*) AS Total_Customers FROM Customers;
--> Average Age
SELECT AVG(Age) AS Average_Age FROM Customers;
--> Youngest and Oldest Customer
SELECT MIN(Age) AS Youngest_Age,
       MAX(Age) AS Oldest_Age
FROM Customers;

--> Customers Between Ages 25 and 35
SELECT * FROM Customers
WHERE Age BETWEEN 25 AND 35;

--> Customers by Membership
SELECT Membership,
       COUNT(*) AS Total_Customers
FROM Customers
GROUP BY Membership;

--> Customers by City
SELECT City,
       COUNT(*) AS Customer_Count
FROM Customers
GROUP BY City;

--> Customers by State
SELECT State,
       COUNT(*) AS Customer_Count
FROM Customers
GROUP BY State;

--> Customers by Preferred Category
SELECT Preferred_Category,
       COUNT(*) AS Total_Customers
FROM Customers
GROUP BY Preferred_Category;

--> Average Age by Membership
SELECT Membership,
       AVG(Age) AS Average_Age
FROM Customers
GROUP BY Membership;

--> Top 5 Oldest Customers
SELECT Customer_Name, Age
FROM Customers
ORDER BY Age DESC
LIMIT 5;

--> Top 5 Youngest Customers
SELECT Customer_Name, Age
FROM Customers
ORDER BY Age ASC
LIMIT 5;

--> Cities Having More Than 3 Customers
SELECT City,
       COUNT(*) AS Total_Customers
FROM Customers
GROUP BY City
HAVING COUNT(*) > 3;

--> Most Preferred Category
SELECT Preferred_Category,
       COUNT(*) AS Total_Customers
FROM Customers
GROUP BY Preferred_Category
ORDER BY Total_Customers DESC
LIMIT 1;

--> State With Maximum Customers
SELECT State,
       COUNT(*) AS Total_Customers
FROM Customers
GROUP BY State
ORDER BY Total_Customers DESC
LIMIT 1;

--> Rank Customers by Age (Window Function)
SELECT Customer_Name,
       Age,
       RANK() OVER(ORDER BY Age DESC) AS Age_Rank
FROM Customers;

--> Creating a Table on Orders
CREATE TABLE Orders (
    Order_Id INT PRIMARY KEY,
    Order_Date DATE,
    Customer_Id VARCHAR(10),
    Book_Id VARCHAR(10),
    Quantity_Ordered INT,
    Total_Amount_Inr DECIMAL(10,2),
    Payment_Method VARCHAR(30),
    Payment_Status VARCHAR(20),
    Order_Status VARCHAR(20),
    Coupon_Used VARCHAR(30)
);

--> Total Number of Orders
SELECT COUNT(*) AS Total_Orders FROM Orders;

--> Total Revenue
SELECT SUM(Total_Amount_Inr) AS Total_Revenue
FROM Orders;

--> Average Order Value
SELECT AVG(Total_Amount_Inr) AS Average_Order_Value FROM Orders;

--> Highest Order Amount
SELECT MAX(Total_Amount_Inr) AS Highest_Order FROM Orders;

--> Orders by Payment Method
SELECT Payment_Method,
       COUNT(*) AS Total_Orders
FROM Orders
GROUP BY Payment_Method;

--> Orders by Status
SELECT Order_Status,
       COUNT(*) AS Total_Orders
FROM Orders
GROUP BY Order_Status;

--> Top 5 Customers by Spending
SELECT Customer_Id,
       SUM(Total_Amount_Inr) AS Total_Spent
FROM Orders
GROUP BY Customer_Id
ORDER BY Total_Spent DESC
LIMIT 5;

--> Monthly Revenue Report
SELECT EXTRACT(MONTH FROM Order_Date) AS Month_No,
       SUM(Total_Amount_Inr) AS Revenue
FROM Orders
GROUP BY EXTRACT(MONTH FROM Order_Date)
ORDER BY Month_No;

--> Paid Orders
SELECT
    COUNT(CASE WHEN Payment_Status = 'Success' THEN 1 END) AS Success_Count,
    COUNT(CASE WHEN Payment_Status = 'Failed' THEN 1 END) AS Failed_Count,
    COUNT(CASE WHEN Payment_Status = 'Pending' THEN 1 END) AS Pending_Count
FROM Orders;

--> Rank Customers by Spending
SELECT Customer_Id,
       SUM(Total_Amount_Inr) AS Total_Spent,
       RANK() OVER(ORDER BY SUM(Total_Amount_Inr) DESC) AS Customer_Rank
FROM Orders
GROUP BY Customer_Id;

--> Creating a Table on Returns 
CREATE TABLE Returns (
    Return_Id VARCHAR(10) PRIMARY KEY,
    Order_Id INT NOT NULL,
    Customer_Id VARCHAR(10) NOT NULL,
    Customer_Name VARCHAR(100) NOT NULL,
    Book_Id VARCHAR(10) NOT NULL,
    Book_Title VARCHAR(255) NOT NULL,
    Category VARCHAR(50),
    Purchase_Date DATE,
    Return_Date DATE,
    Days_To_Return INT,
    Return_Reason VARCHAR(100),
    Original_Amount_Inr DECIMAL(10,2),
    Refund_Amount_Inr DECIMAL(10,2),
    Refund_Method VARCHAR(50),
    Refund_Status VARCHAR(20),
    Return_Condition VARCHAR(30)
);

--> Total Returns
SELECT COUNT(*) AS Total_Returns FROM Returns;

--> Total Refund Amount
SELECT SUM(Refund_Amount_Inr) AS Total_Refund FROM Returns;

--> Returns by Refund Status
SELECT Refund_Status,
       COUNT(*) AS Total_Returns
FROM Returns
GROUP BY Refund_Status;

--> Returns by Reason
SELECT Return_Reason,
       COUNT(*) AS Total_Returns
FROM Returns
GROUP BY Return_Reason
ORDER BY Total_Returns DESC;

--> Returns by Category
SELECT Category,
       COUNT(*) AS Total_Returns
FROM Returns
GROUP BY Category;

--> Processed Returns Only
SELECT * FROM Returns
WHERE Refund_Status = 'Processed';

--> Rejected Returns Only
SELECT * FROM Returns
 HERE Refund_Status = 'Rejected';

--> Average Days to Return
SELECT AVG(Days_To_Return) AS Avg_Return_Days FROM Returns;

--> Top Returned Books
SELECT Book_Title,
       COUNT(*) AS Return_Count
FROM Returns
GROUP BY Book_Title
ORDER BY Return_Count DESC;

--> Refund Status Summary in One Query
SELECT
    COUNT(CASE WHEN Refund_Status = 'Processed' THEN 1 END) AS Processed_Count,
    COUNT(CASE WHEN Refund_Status = 'Rejected' THEN 1 END) AS Rejected_Count
FROM Returns;

--> Creating a Table on Reviews
CREATE TABLE Reviews (
    Review_Id VARCHAR(10) PRIMARY KEY,
    Book_Id VARCHAR(10) NOT NULL,
    Book_Title VARCHAR(255) NOT NULL,
    Category VARCHAR(50),
    Customer_Id VARCHAR(10) NOT NULL,
    Customer_Name VARCHAR(100),
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Review_Text TEXT,
    Review_Date DATE,
    Helpful_Votes INT,
    Verified_Purchase VARCHAR(10)
);

--> Total Reviews
SELECT COUNT(*) AS Total_Reviews
FROM Reviews;

--> Average Rating
SELECT AVG(Rating) AS Average_Rating
FROM Reviews;

--> Highest Rated Review
SELECT MAX(Rating) AS Highest_Rating
FROM Reviews;

--> Lowest Rated Review
SELECT MIN(Rating) AS Lowest_Rating
FROM Reviews;

--> Reviews by Category
SELECT Category,
       COUNT(*) AS Total_Reviews
FROM Reviews
GROUP BY Category
ORDER BY Total_Reviews DESC;

--> Average Rating by Category
SELECT Category,
       AVG(Rating) AS Average_Rating
FROM Reviews
GROUP BY Category
ORDER BY Average_Rating DESC;

--> Top 5 Rated Books
SELECT Book_Title,
       AVG(Rating) AS Avg_Rating
FROM Reviews
GROUP BY Book_Title
ORDER BY Avg_Rating DESC
LIMIT 5;

--> Most Reviewed Books
SELECT Book_Title,
       COUNT(*) AS Review_Count
FROM Reviews
GROUP BY Book_Title
ORDER BY Review_Count DESC
LIMIT 5;

--> Top Customers by Number of Reviews
SELECT Customer_Name,
       COUNT(*) AS Total_Reviews
FROM Reviews
GROUP BY Customer_Name
ORDER BY Total_Reviews DESC
LIMIT 5;

--> Verified vs Non-Verified Reviews
SELECT Verified_Purchase,
       COUNT(*) AS Total_Reviews
FROM Reviews
GROUP BY Verified_Purchase;

--> Rating Distribution
SELECT Rating,
       COUNT(*) AS Total_Reviews
FROM Reviews
GROUP BY Rating
ORDER BY Rating DESC;

--> Most Helpful Reviews
SELECT Book_Title,
       Customer_Name,
       Helpful_Votes
FROM Reviews
ORDER BY Helpful_Votes DESC
LIMIT 5;

--> Monthly Review Report
SELECT EXTRACT(MONTH FROM Review_Date) AS Month_No,
       COUNT(*) AS Total_Reviews
FROM Reviews
GROUP BY EXTRACT(MONTH FROM Review_Date)
ORDER BY Month_No;

--> Books with More Than 5 Reviews
SELECT Book_Title,
       COUNT(*) AS Review_Count
FROM Reviews
GROUP BY Book_Title
HAVING COUNT(*) > 5;

--> Rank Books by Average Rating
SELECT Book_Title,
       AVG(Rating) AS Avg_Rating,
       RANK() OVER(ORDER BY AVG(Rating) DESC) AS Book_Rank
FROM Reviews
GROUP BY Book_Title;