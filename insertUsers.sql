 Declare   @FirstName nvarchar(75)='Anupam',
     @LastName nvarchar(75)='Kushwaha',
     @Gender nvarchar(50)='Male',	 
	 @DateOfBirth DATE='1992-03-30',
	 @EmailID nvarchar(75)='kushwahaabinav96@gmail.com',
	 @PasswordHashed nvarchar(max)='Abhi302',
	 @UserType int=1,
	 @CreatedAt DateTime,
	 @UpdatedAt DateTime
    
	INSERT INTO Users (FirstName, LastName, Gender, DateOfBirth, EmailID, PasswordHashed, UserType, CreatedAt, UpdatedAt )
			Values(@FirstName, @LastName, @Gender, @DateOfBirth, @EmailID, @PasswordHashed, @UserType, GETDATE(),GETDATE())

-- Select * from Users