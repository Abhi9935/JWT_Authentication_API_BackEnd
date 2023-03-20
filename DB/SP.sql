IF EXISTS ( SELECT * FROM   sysobjects WHERE  id = object_id(N'[dbo].[Users_Create]') 
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[Users_Create]
END

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Users_Create]
     @FirstName nvarchar(75),
     @LastName nvarchar(75),
     @Gender nvarchar(50),	 
	 @DateOfBirth DATE,
	 @EmailID nvarchar(75),
	 @PasswordHashed nvarchar(max),
	 @UserType int,
	 @CreatedAt DateTime,
	 @UpdatedAt DateTime
    
AS
BEGIN	
	INSERT INTO Users (FirstName, LastName, Gender, DateOfBirth, EmailID, PasswordHashed, UserType, CreatedAt, UpdatedAt )
			Values(@FirstName, @LastName, @Gender, @DateOfBirth, @EmailID, @PasswordHashed, @UserType, GETDATE(),GETDATE()
	)
END
GO


/****** Object:  StoredProcedure [dbo].[Users_UPDATE]    */  
IF EXISTS ( SELECT * FROM   sysobjects WHERE  id = object_id(N'[dbo].[Users_UPDATE]') 
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[Users_UPDATE]
END

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Users_UPDATE]
	@UserID AS INT,
	@FirstName AS NVARCHAR(75),
	@LastName AS NVARCHAR(75),
	@Gender AS NVARCHAR (50),
	@DateOfBirth AS DATE,
	@EmailID AS nvarchar(75),
	@PasswordHashed AS nvarchar(max),
	@UserType AS int,
	@UpdatedAt AS DateTime
    
AS
BEGIN	
	UPDATE Users SET
	FirstName=@FirstName, 
	LastName=@LastName, 
	Gender=@Gender, 
	DateOfBirth=@DateOfBirth, 
	EmailID=@EmailID, 
	UserType=@UserType,
	UpdatedAt=GETDATE()
	 WHERE ID=@UserID
END
GO


/****** Object:  StoredProcedure [dbo].[Users_SELECT_SEARCH]    */  
IF EXISTS ( SELECT * FROM   sysobjects WHERE  id = object_id(N'[dbo].[Users_SELECT_SEARCH]') 
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[Users_SELECT_SEARCH]
END

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Users_SELECT_SEARCH]
	@name as nvarchar(75)
AS
BEGIN	
	SET NOCOUNT ON;
	SELECT * FROM Users where FirstName like @name
END
GO



/****** Object:  StoredProcedure [dbo].[Users_SELECT_LOGIN]    */  

IF EXISTS ( SELECT * FROM   sysobjects WHERE  id = object_id(N'[dbo].[Users_SELECT_LOGIN]') 
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[Users_SELECT_LOGIN]
END

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Users_SELECT_LOGIN]
@EMAIL AS  NVARCHAR(75),
@pass as nvarchar(256),
@userType int
AS
BEGIN	
	SET NOCOUNT ON;
	SELECT * FROM Users WHERE EmailID=@EMAIL and UserType=@userType
END
GO