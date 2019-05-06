USE master;
if exists(select 1 from master.dbo.sysdatabases where name = 'LIBRARY') drop database LIBRARY;
GO

/* 1. */
CREATE DATABASE LIBRARY
GO

USE LIBRARY
GO

CREATE TABLE MEMBERS(
	CardNo char(5) PRIMARY KEY,
	Surname varchar(15) NOT NULL,
	Name varchar(15) NOT NULL,
	PersonalID varchar(11) NOT NULL,
	Birthday_date date NOT NULL,
	Gender char(1),
	CONSTRAINT GenderIsMorF_CHECK CHECK (Gender in ('M', 'F')),
	Phone_No varchar(15)
);
GO

CREATE TABLE EMPLOYEES(
	emp_id int PRIMARY KEY IDENTITY(1,1),
	Surname varchar(15) NOT NULL,
	Name varchar(15) NOT NULL,
	Birthday_date date NOT NULL,
	Emp_Date date,
	CONSTRAINT BirthdayEarlierThanEmployment_CHECK CHECK (Birthday_date < Emp_Date)
);
GO

CREATE TABLE PUBLISHERS(
	pub_id int PRIMARY KEY IDENTITY(1,1),
	Name varchar(50) NOT NULL,
	City varchar(50) NOT NULL,
	Phone_No varchar(15)
);
GO

CREATE TABLE BOOKS(
	BookID int PRIMARY KEY,
	Pub_ID int,
	CONSTRAINT Books_PubID_FK FOREIGN KEY (Pub_ID) REFERENCES PUBLISHERS(pub_id),
	Title varchar(40) NOT NULL,
	Price money NOT NULL,
	PagesNo int,
	Type varchar(30),
	CONSTRAINT TypeIsCorrect_CHECK CHECK (Type in ('novel', 'historical', 'for kids', 'poems', 'crime story', 'science fiction', 'science'))
);
GO

CREATE TABLE BOOK_LOANS(
	LoanID int PRIMARY KEY IDENTITY(1,1),
	BookID int,
	CONSTRAINT Book_Loans_BookID_FK FOREIGN KEY (BookID) REFERENCES BOOKS(BookID),
	CardNo char(5),
	CONSTRAINT Book_Loans_CardNo_FK FOREIGN KEY (CardNo) REFERENCES MEMBERS(CardNo),
	emp_id int,
	CONSTRAINT Book_Loans_emp_id_FK FOREIGN KEY (emp_id) REFERENCES EMPLOYEES(emp_id),
	DateOut date,
	DueDate date,
	CONSTRAINT OutBeforeDue_CHECK CHECK (DateOut < DueDate),
	Penalty money DEFAULT 0
);
GO

/* 5. */
ALTER TABLE BOOK_LOANS
ADD CONSTRAINT BookID_DateOut_UNIQUE UNIQUE (BookID, DateOut);
GO