USE master;
if exists(select 1 from master.dbo.sysdatabases where name = 'VIDEO_RENTAL') drop database VIDEO_RENTAL;
GO

CREATE DATABASE VIDEO_RENTAL
GO

USE VIDEO_RENTAL
GO

CREATE TABLE Member(
	member_id int PRIMARY KEY NOT NULL IDENTITY(1,1),
	last_name varchar(25) NOT NULL,
	first_name varchar(25),
	address varchar(100),
	city varchar(30),
	phone varchar(15),
	join_date DATETIME CONSTRAINT CurrentDate_DF DEFAULT GETDATE()
);
GO

CREATE TABLE Title(
	title_id int PRIMARY KEY NOT NULL IDENTITY(1,1),
	title varchar(60) NOT NULL,
	description varchar(400) NOT NULL,
	rating varchar(4) CONSTRAINT Rating_CHECK CHECK (rating in ('G', 'PG', 'R', 'NC17', 'NR')),
	category varchar(20) CONSTRAINT Category_CHECK CHECK (category in ('Drama', 'Comedy', 'Child', 'Action', 'Scifi', 'Documentary')),
	release_date DATETIME
);
GO

CREATE TABLE Title_Copy(
	copy_id int NOT NULL,
	title_id int NOT NULL CONSTRAINT Title_Copy_titleID FOREIGN KEY (title_id) REFERENCES Title(title_id),
	CONSTRAINT Copy_Title_PK PRIMARY KEY (copy_id, title_id),
	status varchar(15) CONSTRAINT Status_CHECK CHECK (status in ('Available', 'Destroyed', 'Rented', 'Reserved'))
);
GO

/* Ask why book_date has identity */
CREATE TABLE Rental(
	book_date DATE NOT NULL CONSTRAINT BookDate_DF DEFAULT GETDATE(),
	member_id int NOT NULL CONSTRAINT Rental_MemberID FOREIGN KEY (member_id) REFERENCES Member(member_id),
	copy_id int NOT NULL,
	title_id int NOT NULL,
	CONSTRAINT Rental_Copy_id_Title_id FOREIGN KEY (copy_id, title_id) REFERENCES Title_Copy(copy_id, title_id),
	CONSTRAINT PK_Rental_Date_Member_Copy_Title_Ids PRIMARY KEY (book_date, member_id, copy_id, title_id),
	exp_ret_date DATETIME CONSTRAINT ExpectedReturnDateAfterTwoDays_DF DEFAULT DATEADD(day, 2, GETDATE()),
	act_ret_date DATETIME
);
GO

CREATE TABLE Reservation(
	res_date DATETIME PRIMARY KEY NOT NULL,
	member_id int NOT NULL CONSTRAINT Reservation_MemberID FOREIGN KEY (member_id) REFERENCES Member(member_id),
	title_id int NOT NULL CONSTRAINT Reservation_TitleID FOREIGN KEY (title_id) REFERENCES Title(title_id)
);
GO