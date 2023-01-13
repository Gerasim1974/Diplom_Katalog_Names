USE [NamesCatalog]
GO

CREATE TABLE Auth(AuthId [bigint] IDENTITY(1,1) NOT NULL,	
     [Login] [VARCHAR](150) NOT NULL UNIQUE,
	 [password] [VARCHAR](150) NOT NULL,
	 [email] [VARCHAR](150) NOT NULL UNIQUE,
	 [dateInsert] DATETIME NOT NULL)
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddAuth]
  @Login VARCHAR(150),
  @Password VARCHAR(150),
  @Email VARCHAR(150)
AS
BEGIN
 SET NOCOUNT ON;

 DECLARE @sError VARCHAR(1500) = '';

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
	                     WHERE UPPER(@Login) = UPPER(CAST([Login] AS VARCHAR(150)))
					)
	 IF @CountItem = 0
	     SET @CountItem = (SELECT COUNT(*) FROM [NamesCatalog].[dbo].[Auth]
	                       WHERE UPPER(@Email) = UPPER(CAST([Email] AS VARCHAR(150)))
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
       @sex VarChar(1),
       @FullNameOrigin VARCHAR(150),
       @Denotation VARCHAR(150)
AS
BEGIN
    SET NOCOUNT ON;

  CREATE TABLE #TMP([Name] VARCHAR(150), [Sex] CHAR(1), FullNameOrigin VARCHAR(150), DetailName VARCHAR(150), ReferenceUrl VARCHAR(8000))

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
       @Name VARCHAR(150),
	     @Separator VARCHAR(10)
AS
BEGIN
   SET NOCOUNT ON;

   DECLARE @NmbMnth SMALLINT = 0
   DECLARE  @NumbMonth SMALLINT
   DECLARE @NumbDay SMALLINT
   DECLARE @MonthCaption VARCHAR(8)
   DECLARE @Result VARCHAR(500) = ''
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
	  SET @Result = @Result + CAST(@NumbDay AS VARCHAR(2))
	  FETCH NEXT FROM AngelDay INTO @NumbMonth, @NumbDay, @MonthCaption
   END
   CLOSE AngelDay
   DEALLOCATE AngelDay

   IF LEN(@Result) = 0 SET @Result = 'Информация о именинах отсутствует'
   SELECT @Result
END

GO

CREATE PROCEDURE DBO.InsertNamesEdit
   @Names VARCHAR(150),
   @urlAdress VARCHAR(4000),
   @Notice VARCHAR(4000),
   @Login VARCHAR(150)
AS
BEGIN
   SET NOCOUNT ON;

   INSERT INTO [dbo].[NamesToEdit]([Names], [urlAdress], [Notice], [Login], [dateInsert])
    VALUES(@Names, @urlAdress,@Notice, @Login, GETDATE())
END

GO

