CREATE DATABASE Kutuphane_Yonetim_Sistemi
--DROP DATABASE Kutuphane_Yonetim_Sistemi

USE Kutuphane_Yonetim_Sistemi

--DROP TABLE Books
--DROP TABLE Authors
--DROP TABLE Genres
--DROP TABLE Members
--DROP TABLE Borrowings
--DROP TABLE Staff
--DROP TABLE Positions
--DROP TABLE Penalties
--DROP TABLE Cities
--DROP TABLE Publishers

CREATE TABLE Publishers(
Publisher_ID INT IDENTITY(1,1) PRIMARY KEY,
Publisher_Name VARCHAR(30), 
PPhone_Number CHAR(10)
)

CREATE TABLE Authors(
Author_ID INT IDENTITY(1,1) Primary Key,
AFirst_Name NVARCHAR(50),
ALast_Name NVARCHAR(50),
ABirth_Date DATE 
)

CREATE TABLE Genres(
Genre_ID INT IDENTITY(1,1) Primary Key,
Genre_Name VARCHAR(50)
)

CREATE TABLE Cities(
City_ID TINYINT PRIMARY KEY,
City_Name VARCHAR(30)
)

CREATE TABLE Positions(
Position_ID TINYINT IDENTITY(1,1) Primary Key, 
Position_Name VARCHAR(30)
)

CREATE TABLE Staff(
Staff_ID TINYINT IDENTITY(1,1) Primary Key,
SFirst_Name VARCHAR(30), 
SLast_Name VARCHAR(30), 
Position_ID TINYINT,
SPhone_Number CHAR(10) 
CONSTRAINT fk_Position FOREIGN KEY (Position_ID) REFERENCES Positions(Position_ID)
)

CREATE TABLE Books (
Book_ID INT IDENTITY(1,1) Primary Key,
Title VARCHAR(50),
ISBN CHAR(13),
Publicition_Year DATE,
Publisher_ID INT ,
Book_Status BIT, 
Genre_ID INT,
Author_ID INT,
CONSTRAINT fk_Publisher FOREIGN KEY (Publisher_ID) REFERENCES Publishers(Publisher_ID),
CONSTRAINT fk_Genre FOREIGN KEY (Genre_ID) REFERENCES Genres(Genre_ID),
CONSTRAINT fk_Author FOREIGN KEY (Author_ID) REFERENCES Authors(Author_ID)
)

CREATE TABLE Members(
Member_ID INT IDENTITY(1,1) Primary Key,
MFirst_Name NVARCHAR(50),
MLast_Name NVARCHAR(50),
Membership_Date DATE,
MPhone_Number CHAR(10), 
Email VARCHAR(50),
City_ID TINYINT
CONSTRAINT fk_City FOREIGN KEY (City_ID) REFERENCES Cities(City_ID)
)

CREATE TABLE Borrowings(
    Borrowing_ID INT IDENTITY(1,1) PRIMARY KEY,
    Book_ID INT,
    Member_ID INT,
    Borrow_Date DATETIME2, --YYYY-MM-DD hh:mm:ss
    Due_Date DATETIME2,
    Return_Date DATETIME2,
    Penalty_Amount MONEY,
    Staff_ID TINYINT,
    CONSTRAINT fk_Book FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID),
    CONSTRAINT fk_Member FOREIGN KEY (Member_ID) REFERENCES Members(Member_ID),
    CONSTRAINT fk_Staff FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID)
)

CREATE TABLE Penalties(
Penalty_ID INT IDENTITY(1,1) Primary Key,
Member_ID INT,
Book_ID INT,
Due_Date DATETIME2, 
Return_Date DATETIME2, 
Penalty_Amount MONEY,
Penalty_Status BIT 
CONSTRAINT fk_Penalty_Member FOREIGN KEY (Member_ID) REFERENCES Members(Member_ID),
CONSTRAINT fk_Penalty_Book FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID)
)

--ALTER TABLE Positions ALTER COLUMN Position_Name VARCHAR(40);

--ALTER TABLE Staff ADD City_ID TINYINT;

--ALTER TABLE Staff ADD CONSTRAINT fk_City FOREIGN KEY (City_ID) REFERENCES Cities(City_ID);

--ALTER TABLE Staff DROP CONSTRAINT fk_City;

--ALTER TABLE Staff DROP COLUMN City_ID;