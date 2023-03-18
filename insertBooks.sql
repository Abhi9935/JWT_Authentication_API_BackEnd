Declare @BookName nvarchar(256)='Adv Data Structure',
		@Author nvarchar(256)='Abhinav',
		@Detail nvarchar(256)='adfhj ghn fgghm dnhmh',
		@Price float=180.75,
		@Publication nvarchar(256)='AK Publication',
		@Categories nvarchar(256)='Computer Science',
		@Quantities int=6,
		@AvailableQnt int=5,
		@RentQnt int=1,
		@Image nvarchar(1000)='Adv_ds_Abhi.jpg',
		@EntryDate DATETIME

	INSERT INTO Books (BookName, Author, Detail, Price,    Publication, Categories,   Quantities, AvailableQnt,   RentQnt,  Image, EntryDate )
			   Values(@BookName, @Author, @Detail, @Price, @Publication, @Categories, @Quantities, @AvailableQnt, @RentQnt, @Image, GETDATE())

-- Select * from Books