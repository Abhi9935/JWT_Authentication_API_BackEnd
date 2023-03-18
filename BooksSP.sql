IF EXISTS ( SELECT * FROM   sysobjects WHERE  id = object_id(N'[dbo].[BOOK_Create]') 
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[BOOK_Create]
END

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BOOK_Create]
		@BookName nvarchar(256),
		@Author nvarchar(256),
		@Detail nvarchar(256),
		@Price float,
		@Publication nvarchar(256),
		@Categories nvarchar(256),
		@Quantities int,
		@AvailableQnt int,
		@RentQnt int,
		@Image nvarchar(1000),
		@EntryDate DATETIME
    
AS
BEGIN	
	INSERT INTO Books (BookName, Author, Detail, Price,    Publication, Categories,   Quantities, AvailableQnt,   RentQnt,  Image, EntryDate )
			   Values(@BookName, @Author, @Detail, @Price, @Publication, @Categories, @Quantities, @AvailableQnt, @RentQnt, @Image, GETDATE())
END
GO


/****** Object:  StoredProcedure [dbo].[BOOK_UPDATE]   */   
IF EXISTS ( SELECT * FROM   sysobjects WHERE  id = object_id(N'[dbo].[BOOK_UPDATE]') 
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[BOOK_UPDATE]
END
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[BOOK_UPDATE]
	@BookID int,
	@BookName nvarchar(256),
	@Author nvarchar(256),
	@Detail nvarchar(256),
	@Price float,
	@Publication nvarchar(256),
	@Categories nvarchar(256),
	@Quantities int,
	@AvailableQnt int,
	@RentQnt int,
	@Image nvarchar(1000),
	@EntryDate DATETIME
AS
BEGIN
 update Books set
		BookName =@BookName,
		Author=@Author,
		Detail=@Detail,
		Price=@Price,
		Publication =@Publication,
		Categories=@Categories,
		Quantities =@Quantities,
		AvailableQnt =@AvailableQnt,
		RentQnt =@RentQnt,
		Image =@Image,
		EntryDate =GETDATE()		
		Where BookID=@BookID
END
GO