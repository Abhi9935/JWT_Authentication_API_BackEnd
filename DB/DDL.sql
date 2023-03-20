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

