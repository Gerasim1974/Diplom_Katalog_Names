USE [NamesCatalog]
GO

CREATE TABLE Auth(AuthId [bigint] IDENTITY(1,1) NOT NULL,	
     [Login] [NVARCHAR](150) NOT NULL UNIQUE,
	 [password] [NVARCHAR](150) NOT NULL,
	 [email] [NVARCHAR](150) NOT NULL UNIQUE,
	 [dateInsert] DATETIME NOT NULL)
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddAuth]
  @Login NVARCHAR(150),
  @Password NVARCHAR(150),
  @Email NVARCHAR(150)
AS
BEGIN
 SET NOCOUNT ON;

 DECLARE @sError NVARCHAR(1500) = '';

 IF LEN(LTRIM(@Login)) = 0
  SET @sError = 'Отсутствует логин'

 IF (LEN(@sError)=0) AND (LEN(LTRIM(@Password))=0)
  SET @sError = 'Отсутствует пароль'

 IF (LEN(@sError)=0) AND (LEN(LTRIM(@Password))=0)
  SET @sError = 'Отсутствует Email'

IF LEN(@sError)=0
 BEGIN
   BEGIN TRAN TranAdd
   BEGIN TRY
     DECLARE @CountItem INTEGER
	 SET @CountItem = (SELECT COUNT(*) FROM [NamesCatalog].[dbo].[Auth]
	                     WHERE UPPER(@Login) = UPPER(CAST([Login] AS NVARCHAR(150)))
					)
	 IF @CountItem = 0
	     SET @CountItem = (SELECT COUNT(*) FROM [NamesCatalog].[dbo].[Auth]
	                       WHERE UPPER(@Email) = UPPER(CAST([Email] AS NVARCHAR(150)))
					       )
		  ELSE SET @sError = 'Такой Логин уже существует'
	  IF @CountItem > 0 SET @sError = 'Такой Email уже существует'

	  IF LEN(@sError) = 0
	   BEGIN
	      INSERT INTO [NamesCatalog].[dbo].[Auth]([Login], [password], [email], [dateInsert])
		   VALUES(@Login, @Password, @Email, GetDate())
	   END
     COMMIT TRAN TranAdd
   END TRY
   BEGIN CATCH
     ROLLBACK TRAN TranAdd
	 SET @sError = ERROR_MESSAGE()
   END CATCH
 END

 SELECT @sError
END

GO

CREATE PROCEDURE DBO.ListNamesIntoFilter
       @sex NVarChar(1),
       @FullNameOrigin NVARCHAR(150),
       @Denotation NVARCHAR(150)
AS
BEGIN
    SET NOCOUNT ON;

  CREATE TABLE #TMP([Name] NVARCHAR(150), [Sex] NCHAR(1), FullNameOrigin NVARCHAR(150), DetailName NVARCHAR(150), ReferenceUrl NVARCHAR(4000))

  INSERT INTO #TMP
  SELECT DISTINCT [Name], [Sex], [FullNameOrigin], [DetailName], [ReferenceUrl]
    FROM [NamesCatalog].[dbo].[NamesFullInfo]

  IF LEN(UPPER(ISNULL(@sex,'')))>0 
    DELETE FROM #TMP WHERE UPPER([Sex]) <> UPPER(@sex)

  IF LEN(UPPER(ISNULL(@FullNameOrigin,'')))>0 
    DELETE FROM #TMP WHERE UPPER([FullNameOrigin]) <> UPPER(@FullNameOrigin)

  IF LEN(UPPER(ISNULL(@Denotation,'')))>0 
    DELETE FROM #TMP WHERE UPPER([DetailName]) <> UPPER(@Denotation)

  SELECT [Name], [Sex], [FullNameOrigin], [DetailName], [ReferenceUrl] FROM #TMP
         ORDER BY [Name]

  DROP TABLE #TMP
END

GO

CREATE PROCEDURE DBO.AngelDayToNames
       @Name NVARCHAR(150),
	     @Separator NVARCHAR(10)
AS
BEGIN
   SET NOCOUNT ON;

   DECLARE @NmbMnth SMALLINT = 0
   DECLARE  @NumbMonth SMALLINT
   DECLARE @NumbDay SMALLINT
   DECLARE @MonthCaption NVARCHAR(8)
   DECLARE @Result NVARCHAR(500) = ''
   DECLARE @Ident SMALLINT

   DECLARE AngelDay CURSOR FOR
     SELECT [NumbOfMonth], [NumbOfDay], [MonthCaption_1] 
	   FROM [dbo].[NamesFullInfo]
         WHERE UPPER([Name]) = @Name
	 ORDER BY [NumbOfMonth], [NumbOfDay]

   OPEN AngelDay
   FETCH NEXT FROM AngelDay INTO @NumbMonth, @NumbDay, @MonthCaption
   WHILE @@FETCH_STATUS = 0
   BEGIN
     IF @NumbMonth <> @NmbMnth 
	  BEGIN
	   IF LEN(@Result)>0 SET @Result = @Result + @Separator
	   SET @Result = @Result + @MonthCaption+': '
	   SET @NmbMnth = @NumbMonth
	   SET @Ident = 0
	  END
	  IF @Ident <> 0 SET @Result = @Result +', '
	  set @Ident = @Ident+1
	  SET @Result = @Result + CAST(@NumbDay AS NVARCHAR(2))
	  FETCH NEXT FROM AngelDay INTO @NumbMonth, @NumbDay, @MonthCaption
   END
   CLOSE AngelDay
   DEALLOCATE AngelDay

   IF LEN(@Result) = 0 SET @Result = 'Информация о именинах отсутствует'
   SELECT @Result
END

GO

CREATE PROCEDURE DBO.InsertNamesEdit
   @Names NVARCHAR(150),
   @urlAdress NVARCHAR(4000),
   @Notice NVARCHAR(4000),
   @Login NVARCHAR(150)
AS
BEGIN
   SET NOCOUNT ON;

   INSERT INTO [dbo].[NamesToEdit]([Names], [urlAdress], [Notice], [Login], [dateInsert])
    VALUES(@Names, @urlAdress,@Notice, @Login, GETDATE())
END

GO

UPDATE [NamesCatalog].[dbo].[Origin] SET FullNameOrigin = 'еврейское' WHERE FullNameOrigin = 'евр.'
UPDATE [NamesCatalog].[dbo].[Origin] SET FullNameOrigin = 'латинское' WHERE FullNameOrigin = 'лат.'
UPDATE [NamesCatalog].[dbo].[Origin] SET FullNameOrigin = 'халдейское' WHERE FullNameOrigin = 'халд.'
UPDATE [NamesCatalog].[dbo].[Origin] SET FullNameOrigin = 'персидское' WHERE FullNameOrigin = 'перс.'
UPDATE [NamesCatalog].[dbo].[Origin] SET FullNameOrigin = 'греческое' WHERE FullNameOrigin = 'греч.'
UPDATE [NamesCatalog].[dbo].[Origin] SET FullNameOrigin = 'русское' WHERE FullNameOrigin = 'рус.'
UPDATE [NamesCatalog].[dbo].[Origin] SET FullNameOrigin = 'германское' WHERE FullNameOrigin = 'герм.'
UPDATE [NamesCatalog].[dbo].[Origin] SET FullNameOrigin = 'арабское' WHERE FullNameOrigin = 'араб.'
UPDATE [NamesCatalog].[dbo].[Origin] SET FullNameOrigin = 'английское' WHERE FullNameOrigin = 'англ.'
UPDATE [NamesCatalog].[dbo].[Origin] SET FullNameOrigin = 'египетское' WHERE FullNameOrigin = 'егип.'
UPDATE [NamesCatalog].[dbo].[Origin] SET FullNameOrigin = 'грузинское' WHERE FullNameOrigin = 'груз.'
UPDATE [NamesCatalog].[dbo].[Origin] SET FullNameOrigin = 'славянское' WHERE FullNameOrigin = 'слав.'
UPDATE [NamesCatalog].[dbo].[Origin] SET FullNameOrigin = 'тюркское' WHERE FullNameOrigin = 'тюрк.'
UPDATE [NamesCatalog].[dbo].[Origin] SET FullNameOrigin = 'сирийское' WHERE FullNameOrigin = 'сир.'
UPDATE [NamesCatalog].[dbo].[Origin] SET FullNameOrigin = 'скандинавское' WHERE FullNameOrigin = 'скан.'

GO

