/** -- create books tables
create table Books
(
BookID int primary key identity (1,1),
BookName nvarchar(256),
Author nvarchar(256),
Detail nvarchar(256),
Price float,
Publication nvarchar(256),
Categories nvarchar(256),
Quantities int,
AvailableQnt int,
RentQnt int,
Image nvarchar(1000),
EntryDate DATETIME
)
*/

/**
CREATE TABLE Users
(
     ID int primary key identity,
     FirstName nvarchar(75) not null,
     LastName nvarchar(75),
     Gender nvarchar(50) not null,	 
	 DateOfBirth DATE,
	 EmailID nvarchar(75) not null,
	 PasswordHashed nvarchar(max) not null,
	 UserType int not null,
	 CreatedAt DateTime,
	 UpdatedAt DateTime
)
*/
/**
create table IssuedRecord
(
IRID INT PRIMARY KEY IDENTITY(1,1),
BookName NVARCHAR(256),
UserID INT,
Days INT,
IssueDate DATETIME,
ReturnDate DATETIME,
Status INT, 
)
*/
