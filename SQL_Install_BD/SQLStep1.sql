CREATE DATABASE [NamesCatalog]
GO

USE [NamesCatalog]
GO

--STEP 0001
CREATE TABLE DBO.DaysOfYears(DaysOfYearsId BIGINT NOT NULL PRIMARY KEY IDENTITY(1,1),
       NumbOfMonth SMALLINT NOT NULL, NumbOfDay SMALLINT NOT NULL,
	   UNIQUE(NumbOfMonth,  NumbOfDay))
GO

CREATE TABLE DBO.Names(NamesId BIGINT NOT NULL PRIMARY KEY IDENTITY(1,1),
     [Name] VARCHAR(150) NOT NULL, Sex CHAR(1) NOT NULL,
	 UNIQUE([Name], Sex))
GO


CREATE TABLE DBO.DaysOrtodoxChristians( DaysOrtodoxChristiansId BIGINT NOT NULL PRIMARY KEY IDENTITY(1,1),
          DaysOfYearsId BIGINT NOT NULL, NamesId BIGINT NOT NULL,
		  UNIQUE(DaysOfYearsId, NamesId))
GO

CREATE TABLE [dbo].[NamesToEdit](NamesToEditId BIGINT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Names] varchar(150) NOT NULL, [urlAdress] varchar(4000), [Notice] varchar(4000),
	[Login] varchar(150) NOT NULL, [dateInsert] datetime NOT NULL)
GO

--STEP 2
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		GIS
-- Create date: 2022-11-15
-- Description:	СПИСКОМ ДОБАВЛЯЕМ ИМЕНА ПО ДНЯМ ИМЕНИН
-- ПО ПРАВОСЛАВНЫМ СВЯТЦАМ
-- =============================================
CREATE PROCEDURE AddToOrtodoxChristiansCatalogBase
	@MonthNumb smallint,
	@DaysNumb smallint,
	@Name varchar(50),
	@Sex char(1)
AS
BEGIN
	SET NOCOUNT ON;

    SET @Name = LTRIM(RTRIM(@Name))
	IF LEN(@Name)>0
	 BEGIN
	 
    --КАЛЕНДАРНЫЙ ДЕНЬ МЕСЯЦА
    DECLARE @IdDay INT
    DECLARE @CountData SMALLINT
    SET @CountData = (SELECT COUNT(*) from[dbo].[DaysOfYears]  where NumbOfMonth = @MonthNumb and NumbOfDay = @DaysNumb)
    IF @CountData = 0
     BEGIN
       INSERT INTO [dbo].[DaysOfYears](NumboFMonth, NumbOfDay) VALUES(@MonthNumb, @DaysNumb)
       SET @IdDay = (SELECT @@IDENTITY) 
     END
     ELSE SET @IdDay = (SELECT [DaysOfYearsId] FROM [dbo].[DaysOfYears] WHERE NumbOfMonth = @MonthNumb AND NumbOfDay = @DaysNumb)
     
     --ИМЯ
     DECLARE @NamesId INT
     DECLARE @CountName SMALLINT
     SET @CountName = (SELECT COUNT(*) FROM dbo.Names WHERE UPPER(Name) = UPPER(@Name) AND UPPER(Sex) = UPPER(@Sex))
     IF @CountName = 0
      BEGIN
       INSERT INTO dbo.Names(Name, Sex) VALUES(@Name, @Sex)
       SET @NamesId = (SELECT @@IDENTITY)
      END
      ELSE SET @NamesId = (SELECT NamesId FROM dbo.Names WHERE UPPER(Name) = UPPER(@Name) AND UPPER(Sex) = UPPER(@Sex))
     
     --ИМЕНИНЫ ПРАВОСЛАВНЫЕ
     DECLARE @CountOrthodoxy SMALLINT
     SET @CountOrthodoxy = (SELECT COUNT(*) FROM [dbo].[DaysOrtodoxChristians] WHERE [DaysOfYearsId] = @IdDay AND NamesId = @NamesId)
     IF @CountOrthodoxy = 0
      BEGIN
      INSERT INTO [dbo].[DaysOrtodoxChristians]([DaysOfYearsId], NamesId) VALUES(@IdDay, @NamesId)
      END
	END
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		GIS
-- Create date: 2022-11-22
-- Description:	Добавляет списком. разделитель ","
-- =============================================
CREATE PROCEDURE dbo.AddListToOrtodoxChristiansCatalogBase 
	@MonthNumb smallint,
	@DaysNumb smallint,
	@Names varchar(1500),
	@Sex char(1)
AS
BEGIN
	SET NOCOUNT ON;

    DECLARE @sItem VARCHAR(100) = ''
    DECLARE @I SMALLINT = 1
    WHILE @I <= LEN(@Names)
    BEGIN
     IF SUBSTRING(@Names, @I, 1) <> ','
     SET @sItem = @sItem+SUBSTRING(@Names, @I, 1)
      ELSE BEGIN
		SET @sItem = RTRIM(LTRIM(@sItem))
		EXEC [NamesCatalog].[dbo].[AddToOrtodoxChristiansCatalogBase] @MonthNumb, @DaysNumb, @sItem, @Sex
        SET @sItem = ''
         END 
      SET @I = @I+1  
     END
     IF LEN(@sItem)>0 
	  BEGIN
       SET @sItem = RTRIM(LTRIM(@sItem))
	   EXEC [NamesCatalog].[dbo].[AddToOrtodoxChristiansCatalogBase] @MonthNumb, @DaysNumb, @sItem, @Sex
	  END
END
GO



DECLARE @MonthNumb SMALLINT
DECLARE @DaysNumb SMALLINT
DECLARE @ListName VARCHAR(1500) --РАЗДЕЛИТЕЛЬ ","
DECLARE @Sex char(1)

--####################################################
-- ЯНВАРЬ
--####################################################

SET @MonthNumb = 1
SET @DaysNumb =1
SET @ListName ='Арис, Вонифатий, Григорий, Евтихий, Илья, Полиевкт, Пров, Тимофей, Трифон'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =1
SET @ListName ='Аглаида, Фессалоникия'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =2
SET @ListName ='Гаспар, Даниил, Иван, Игнатий, Филогоний'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =2
SET @ListName ='Юлиания'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =3
SET @ListName ='Альфред, Пётр, Прокопий, Фемистокл, Феофан'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =3
SET @ListName ='Анастасия, Феодотия'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =4
SET @ListName ='Евод, Евтихиан, Зоил, Хрисогон'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =4
SET @ListName ='Анастасия, Феодотия'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =5
SET @ListName ='Агафопус, Василид, Геласий, Давид, Еварест, Евникиан, Евпор, Зотик, Наум, Нифонт, Павел, Помпей, Сатурнин, Феодул, Феоктист'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 1
--SET @DaysNumb =5
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =6
SET @ListName ='Антиох, Ахаик, Василла, Евсузий, Иакинф, Николай, Прот, Филипп'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =6
SET @ListName ='Агафья, Евгения, Клавдия'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 1
--SET @DaysNumb =7
--SET @ListName =''
--SET @Sex = 'М' 
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 1
--SET @DaysNumb =7
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =8
SET @ListName ='Еварест, Ефим, Константин, Констанций'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 1
--SET @DaysNumb =8
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =9
SET @ListName ='Лука, Степан, Фёдор, Ферапонт'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 1
--SET @DaysNumb =9
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =10
SET @ListName ='Гликерий, Горгоний, Дорофей, Ефим, Зенон, Игнатий, Индис, Мардоний, Мигдоний, Никанор, Никострат, Пётр, Секунд, Симон, Феофил'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =10
SET @ListName ='Агафья, Домна, Феофила'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =11
SET @ListName ='Афинодор, Вениамин, Георгий, Иван, Марк, Маркелл, Фаддей, Феофил'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 1
--SET @DaysNumb =11
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =12
SET @ListName ='Антон, Ариан, Вир, Зотик, Лев, Макар, Тимон, Филетер'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =12
SET @ListName ='Ирина, Феодора, Феодосия'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =13
SET @ListName ='Гай, Геласий, Ириний, Олимпиодор, Саламин'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =13
SET @ListName ='Мелания, Немь, Олимпиодора'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =14
SET @ListName ='Василий, Григорий, Пётр, Федот, Феодосий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =14
SET @ListName ='Эмилия'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =15
SET @ListName ='Закхей, Кузьма, Марк, Модест, Пётр, Серафим, Сергей, Сильвестр, Феоген, Феопент, Феопист'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =15
SET @ListName ='Феодотия, Юлиания'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =16
SET @ListName ='Гордей, Малахий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =16
SET @ListName ='Ирина, Павла'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =17
SET @ListName ='Агав, Александр, Алфей, Амплий, Ананий, Андроник, Анисим, Апеллий, Аполлос, Аристарх, Аристовул, Артемий, Архипп, Асинкрит, Афанасий, Ахаик, Варнава, Гай, Денис, Евод, Евстафий, Епафрас, Епафродит, Епенет, Ераст, Ерм, Ермий, Ефим, Зосима, Иосия, Иродион, Карп, Кварт, Кесарь, Кифа, Климент, Клеопа, Кондратий, Крискент, Крисп, Лин, Лука, Лукий, Марк, Наркисс, Никанор, Олимп, Онисифор, Онуфрий, Патров, Прохор, Пуд, Пармен, Родион, Руф, Семён, Сила, Сильван, Сосипатр, Сосфен, Стахий, Степан, Тертий, Тимон, Тимофей, Тит, Тихик, Трофим, Увеликий, Урван, Фаддей, Феоктист, Филимон, Филипп, Филолог, Флегонт, Фортунат, Хрисанф, Юст, Яков, Ясон'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =17
SET @ListName ='Ефимия, Зина'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =18
SET @ListName ='Григорий, Лукьян, Мина, Михей, Роман, Саис, Феоид, Феона, Феопент, Фома, Фостирий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =18
SET @ListName ='Аполлинария, Синклитикия, Татьяна'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 1
--SET @DaysNumb =19
--SET @ListName =''
--SET @Sex = 'М' 
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 1
--SET @DaysNumb =19
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =20
SET @ListName ='Афанасий, Иван'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 1
--SET @DaysNumb =20
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =21
SET @ListName ='Анастасий, Антон, Аттик, Георгий, Григорий, Евгений, Емельян, Зотик, Илья, Исидор, Картерий, Кельсий, Кир, Паисий, Феоктист, Феофил, Элладий, Юлиан'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =21
SET @ListName ='Василиса, Домна, Инесса, Марионилла'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =22
SET @ListName ='Евстрат, Захар, Никандр, Пантелеймон, Пётр, Полиевкт, Самей, Филипп'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =22
SET @ListName ='Антонина'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =23
SET @ListName ='Аммоний, Григорий, Дометиан, Макар, Маркиан, Павел, Феофан'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =23
SET @ListName ='Феозва'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =24
SET @ListName ='Агап, Майор, Михаил, Ромил, Степан, Терентий, Фёдор, Феодосий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =24
SET @ListName ='Евпраксия, Татьяна'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =25
SET @ListName ='Галактион, Леандр, Макар, Мартиниан, Мертий, Пётр, Савва, Сильван'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =25
SET @ListName ='Евпраксия'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =26
SET @ListName ='Афанасий, Варсонофий, Елизар, Ермил, Иринарх, Иуда, Иуст, Исай, Максим, Никифор, Никодим, Папирин, Пахом, Пётр, Стратоник, Яков'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 1
--SET @DaysNumb =26
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =27
SET @ListName ='Адам, Андрей, Аристарх, Вениамин, Геласий, Давид, Евсевий, Еремей, Илья, Иосиф, Ипатий, Исаакий, Исай, Макар, Марк, Маркелл, Моисей, Орион, Павел, Пафнутий, Прокл, Савва, Сергей, Степан, Феодул'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =27
SET @ListName ='Агния, Нина'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =28
SET @ListName ='Варлаам, Гавриил, Елпидий, Иван, Карл, Павел, Пансофий, Прохор'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =28
SET @ListName ='Елена'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =29
SET @ListName ='Варсонофий, Данакт, Еврет, Елевсипп, Максим, Мелевсипп, Неон, Пётр, Спевсипп, Турвон'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =29
SET @ListName ='Иовилла, Леонилла'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =30
SET @ListName ='Антон, Ахилл, Георгий, Иван, Мартирий, Феодосий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =30
SET @ListName ='Антонина'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =31
SET @ListName ='Афанасий, Димитрий, Емельян, Ефрем, Иларион, Кириак, Кирилл, Максим, Маркиан'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =31
SET @ListName ='Ксения, Феодосия'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--####################################################
-- ФЕВРАЛЬ
--####################################################
SET @MonthNumb = 2
SET @DaysNumb =1
SET @ListName ='Арсений, Григорий, Макар, Марк, Мелетий, Савва, Фёдор, Януарий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =1
SET @ListName ='Евфрасия, Луиза, Феодосия'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =2
SET @ListName ='Василид, Васс, Евсевий, Евтихий, Ефим, Захар, Лаврентий, Лев, Римма, Инна, Пинна'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 2
--SET @DaysNumb =2
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =3
SET @ListName ='Анастасий, Валериан, Евгений, Иван, Кандид, Максим, Неофит, Феодосий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =3
SET @ListName ='Агния'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =4
SET @ListName ='Агафон, Ананий, Анастасий, Гавриил, Георгий, Иван, Иосиф, Леонт, Леонтий, Макар, Мануил, Парод, Пётр, Сионий, Тимофей'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 2
--SET @DaysNumb =4
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =5
SET @ListName ='Агафангел, Геннадий, Евсевий, Климент, Мавсима, Павлин, Саламан, Фёдор, Феоктист'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 2
--SET @DaysNumb =5
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =6
SET @ListName ='Агап, Анастасий, Вавила, Герасим, Денис, Зосима, Иван, Македон, Павел, Павсирий, Тимофей, Феодотион, Филиппик, Филон'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =6
SET @ListName ='Ксения, Хрисоплока'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =7
SET @ListName ='Авксентий, Александр, Аполлос, Виталий, Григорий, Димитрий, Мар, Маресий, Марциал, Моисей, Поплий, Сильван, Феликс, Филипп, Януарий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =7
SET @ListName ='Фелицата'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =8
SET @ListName ='Аммоний, Ананий, Аркадий, Гавриил, Давид, Иван, Иосиф, Климент, Ксенофонт, Пётр, Семён, Фёдор'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =8
SET @ListName ='Берта, Ирма, Мария, Павла'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =9
SET @ListName ='Гермоген, Димитрий, Иван, Пётр, Полихроний'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 2
--SET @DaysNumb =9
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =10
SET @ListName ='Георгий, Ефрем, Исаакий, Палладий, Плутодор, Феодосий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =10
SET @ListName ='Домна, Маркиана'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =11
SET @ListName ='Авив, Афраат, Герасим, Димитрий, Игнатий, Иона, Иперехий, Лаврентий, Лука, Мокей, Паригорий, Питирим, Роман, Сильван, Фафуил, Филофей, Юлиан, Яков'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =11
SET @ListName ='Хрисия'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =12
SET @ListName ='Амандин, Архелай, Василий, Григорий, Евсевий, Ерм, Зенон, Иван, Ипполит, Кенсорин, Кипр, Кирин, Климент, Коммод, Мавр, Максим, Мина, Монагрей, Олимпий, Пётр, Рустик, Савин, Стиракин, Тривун, Фёдор, Феофил, Филикл'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 2
--SET @DaysNumb =12
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =13
SET @ListName ='Афанасий, Виктор, Викторин, Диодор, Иван, Илья, Кир, Клавдий, Никита, Никифор, Папий, Серапион'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =13
SET @ListName ='Афанасия, Евдоксия, Трифена, Феодотия, Феоктиста'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =14
SET @ListName ='Анастасий, Василий, Вендимиан, Давид, Карион, Пётр, Ревокат, Сатир, Сатурнил, Секунд, Семён, Тимофей, Трифон, Феион'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =14
SET @ListName ='Перпетуя, Фелицитата, Фелиция'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =15
SET @ListName ='Агафодор, Гавриил, Иордан'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 2
--SET @DaysNumb =15
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =16
SET @ListName ='Адриан, Азарий, Влас, Гавриил, Диодор, Димитрий, Еввул, Клавдиан, Клавдий, Николай, Папий, Роман, Святослав, Семён, Симон'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =16
SET @ListName ='Анна'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =17
SET @ListName ='Авраамий, Георгий, Иадор, Иасим, Иван, Иосиф, Исидор, Кирилл, Коприй, Николай, Фалалей, Феоктист, Юрий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =17
SET @ListName ='Констанция'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =18
SET @ListName ='Антон, Евагрий, Макар, Полиевкт, Феодосий, Элладий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =18
SET @ListName ='Агафья, Василиса, Феодулия'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =19
SET @ListName ='Варсонофий, Василий, Вукол, Евласий, Иван, Ликарион, Максим, Севастьян, Фавста, Фауст, Феофил, Фотий, Юлиан'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =19
SET @ListName ='Дорофея, Мария, Марфа, Христина, Каллиста'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =20
SET @ListName ='Лука, Парфен, Пётр'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 2
--SET @DaysNumb =20
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =21
SET @ListName ='Захар, Макар, Никифор, Пергет, Поликарп, Савва, Степан, Фёдор, Филадельф'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 2
--SET @DaysNumb =21
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex


SET @MonthNumb = 2
SET @DaysNumb =22
SET @ListName ='Геннадий, Иннокентий, Маркелл, Никифор, Панкрат, Пётр, Филагрий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =22
SET @ListName ='Изабелла'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =23
SET @ListName ='Антон, Аркадий,  Ваптос, Василий, Гавриил, Геннадий, Герман, Григорий, Иван, Иоаким, Карп, Лука, Лонгин, Марк, Мартирий, Пимен, Порфирий, Прохор, Семён, Харлампий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =23
SET @ListName ='Анна, Валентина, Галина, Павла'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =24
SET @ListName ='Влас, Всеволод, Гавриил, Димитрий, Захар, Порфирий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =24
SET @ListName ='Феодора'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =25
SET @ListName ='Алексей, Антон, Вассиан, Евгений, Марин, Мелетий, Плутин, Сатурнил, Урван'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =25
SET @ListName ='Констанция, Мария'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =26
SET @ListName ='Артемий, Анисим, Евлогий, Мартин, Мартиниан, Никандр, Семён, Степан, Тимофей, Юстиниан'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =26
SET @ListName ='Зоя, Прискилла, Светлана Фотиния'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =27
SET @ListName ='Авксентий, Авраамий, Георгий, Исаакий, Кирилл, Марон, Мефодий, Михаил, Фёдор, Филимон'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 2
--SET @DaysNumb =27
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =28
SET @ListName ='Арсений, Афанасий, Анисим, Евсевий, Майор, Онисим, Пафнутий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =28
SET @ListName ='Ефросиния'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =29
SET @ListName ='Илья, Порфирий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 2
--SET @DaysNumb =29
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex


--####################################################
-- МАРТ
--####################################################
SET @MonthNumb = 3
SET @DaysNumb =1
SET @ListName ='Альбин, Валент, Даниил, Еремей, Исай, Маруф, Никон, Павел, Памфил, Самуил, Селевкий, Феодул, Флавиан, Юлиан'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 3
--SET @DaysNumb =1
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =2
SET @ListName ='Гермоген, Карл, Маркиан, Мина, Папий, Порфирий, Роман, Фёдор, Феодосий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex


SET @MonthNumb = 3
SET @DaysNumb =2
SET @ListName ='Мариамна'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =3
SET @ListName ='Агапит, Агриппа, Василий, Виктор, Дорофей, Кузьма, Лев, Паригорий, Пиулий, Феодул, Флавиан'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 3
--SET @DaysNumb =3
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =4
SET @ListName ='Архипп, Досифей, Евгений, Исихий, Казимир, Конон, Макар, Максим, Никита, Равула, Федот, Филимон'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =4
SET @ListName ='Апфия, Филофея'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =5
SET @ListName ='Агафон, Амфил, Евтропий, Исидор, Киндей, Корнилий, Лев, Плотин, Садок'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =5
SET @ListName ='Аммия'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =6
SET @ListName ='Георгий, Евстафий, Захар, Иван, Телесоф, Тимофей'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 3
--SET @DaysNumb =6
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =7
SET @ListName ='Афанасий, Вавила, Варадат, Вячеслав, Лимней, Маврикий, Разумник, Тит, Фалассий, Фёдор, Филипп, Фотий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =7
SET @ListName ='Анфиса'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =8
SET @ListName ='Александр, Антиох, Антонин, Демьян, Зевин, Иван, Климент, Кузьма, Лазарь, Моисей, Поликарп, Полихроний'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =8
SET @ListName ='Фея'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =9
SET @ListName ='Иван, Иларион, Софрон, Эразм'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =9
SET @ListName =''
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =10
SET @ListName ='Антон, Евгений, Пафнутий, Тарас, Фёдор'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 3
--SET @DaysNumb =10
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =11
SET @ListName ='Иван, Николай, Порфирий, Севастьян'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =11
SET @ListName ='Тереза'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =12
SET @ListName ='Геласий, Касьян, Макар, Маркиан, Прокопий, Степан, Тимофей, Тит, Фалалей, Юлиан, Яков'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =12
SET @ListName ='Виктория'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =13
SET @ListName ='Василий, Евагрий, Киприан, Мелетий, Нестор, Николай, Нифонт, Протерий, Аверкий, Варвар, Варсонофий, Вениамин, Иван, Касьян, Лев, Паисий, Феоктирист'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =13
SET @ListName ='Кира, Марина'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =14
SET @ListName ='Агап, Антон, Маркелл, Мартирий, Нестор, Несториан, Никифор, Сильвестр, Софрон, Тривимий, Хартий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =14
SET @ListName ='Антонина, Домнина, Евдокия, Матильда'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =15
SET @ListName ='Агафон, Арсений, Афинодор, Варсонофий, Василий, Ефросин, Иларион, Иосиф, Савва, Савватий, Троадий, Федот'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =15
SET @ListName ='Евфалия, Луиза'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =16
SET @ListName ='Василиск, Евтропий, Зенон, Зоил, Клеоник, Савин, Севастьян'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 3
--SET @DaysNumb =16
--SET @ListName = ''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =17
SET @ListName ='Акакий, Василий, Вячеслав, Георгий, Герасим, Григорий, Даниил, Иосаф, Кондратий, Павел, Стратоник, Юрий, Яков'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =17
SET @ListName ='Гертруда, Юлиания'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =18
SET @ListName ='Адриан, Архелай, Георгий, Давид, Евлампий, Евлогий, Иван, Исихий, Кирилл, Конон, Константин, Марк, Онисий, Фёдор, Фотий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =18
SET @ListName ='Ираида'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =19
SET @ListName ='Анфим, Аркадий, Аэтий, Васой, Еввул, Ефросин, Иисус, Иов, Каллист, Конон, Константин, Максим, Мелиссен, Михей, Фёдор, Феофил, Юлиан'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 3
--SET @DaysNumb =19
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =20
SET @ListName ='Агафодор, Василий, Евгений, Елпидий, Емельян, Еферий, Ефрем, Капитон, Лаврентий, Нестор, Павел'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =20
SET @ListName ='Капитолина'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =21
SET @ListName ='Афанасий, Дементий, Дион, Ерм, Лазарь, Феодорит, Феодосий, Феофилакт'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 3
--SET @DaysNumb =21
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =22
SET @ListName ='Аглаий, Акакий, Александр, Ангий, Афанасий, Аэтий, Валент, Валерий, Гай, Горгоний, Дометиан, Евноик, Евтихий, Екдит, Иван, Илиан, Илья, Ираклий, Исихий, Кандид, Кесарь, Кирилл, Кирион, Клавдий, Ксанфий, Леонтий, Лисимах, Мелитон, Николай, Приск, Сакердон, Северьян, Сисиний, Смарагд, Тарас, Урпасиан, Феодул, Феофил, Филоктимон, Флавий, Худион'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =22
SET @ListName ='Вивиан'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =23
SET @ListName ='Анект, Виктор, Викторин, Георгий, Денис, Диодор, Киприан, Клавдий, Кондратий, Крискент, Руфин, Леонид, Марк, Маркиан, Михаил, Никифор, Павел, Папий, Саторин, Серапион'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =23
SET @ListName ='Анастасия, Василиса, Галина, Ника, Нунехия, Феодора, Хариесса'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =24
SET @ListName ='Георгий, Епимах, Ефим, Иван, Лин, Македон, Патрикий, Пионий, Саторин, Софрон'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =24
SET @ListName ='Берта, Сабина'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =25
SET @ListName ='Григорий, Семён, Феофан, Финеес'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =25
SET @ListName ='Мария'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =26
SET @ListName ='Александр, Анин, Африкан, Никифор, Поплий, Савин, Терентий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =26
SET @ListName ='Христина'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =27
SET @ListName ='Венедикт, Евсхимон, Михаил, Ростислав, Феогност, Феодосий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =27
SET @ListName ='Фронтина'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =28
SET @ListName ='Агап, Александр, Денис, Еварест, Мануил, Никандр, Поплий, Ромил, Тимолай'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =28
SET @ListName ='Мария'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =29
SET @ListName ='Александр, Аристовул, Денис, Емельян, Иван, Павел, Папий, Роман, Савин, Серапион, Трофим, Фал, Юлиан'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 3
--SET @DaysNumb =29
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =30
SET @ListName ='Алексей, Макар, Марин, Павел'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 3
--SET @DaysNumb =30
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =31
SET @ListName ='Анин, Даниил, Евкарпий, Кирилл, Трофим'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =31
SET @ListName ='Корнелия'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex


--####################################################
-- АПРЕЛЬ
--####################################################

SET @MonthNumb = 4
SET @DaysNumb =1
SET @ListName ='Хрисанф, Клавдий, Иасон, Мавр, Диодор, Мариан, Иоанн, Панхарий, Иннокентий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =1
SET @ListName ='Васса, Дария, Илария, Софья'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =2
SET @ListName ='Акила, Иоанн, Сергий, Патрикий, Василий, Виктор, Иосия, Севастиан, Никита'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =2
SET @ListName ='Александра, Анатолия, Домнина, Евфрасия, Ефимия, Кириакия, Клавдия, Мария, Матрона, Прасковья, Светлана, Феодосия, Фотида, Фотина, Юлиания'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =3
SET @ListName ='Иаков, Серафим, Владимир, Кирилл, Фома'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 4
--SET @DaysNumb =3
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =4
SET @ListName ='Василий, Исаакий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =4
SET @ListName ='Аглаида, Аполлинария, Василиса, Дария, Дросида, Каллиникия, Таисия'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =5
SET @ListName ='Никон, Макарий, Василий, Стефан,  Алексий, Сергий, Филит, Македон, Феопрепий, Кронид, Амфилохий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =5
SET @ListName ='Лидия'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =6
SET @ListName ='Владимир, Иаков, Захария, Артемий, Стефан, Петр'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 4
--SET @DaysNumb =6
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =7
SET @ListName ='Лазарь, Тихон, Савва'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 4
--SET @DaysNumb =7
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =8
SET @ListName ='Гавриил, Вафусий, Верк, Арпила, Авив, Агн, Реас, Игафракс, Иской, Сила, Сигиц, Сонирил, Суимвл, Ферм, Филл, Малх, Василий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =8
SET @ListName ='Алла, Анимаиса, Анна, Гаафа, Дуклида, Лариса, Мамика, Моико'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =9
SET @ListName ='Ириней, Мануил, Феодосий, Иоанн'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =9
SET @ListName ='Матрона'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =10
SET @ListName ='Иларион, Стефан, Николай, Василий, Иоанн, Иона, Варахисий, Лазарь, Маруф, Нарса, Илия, Мар , Авив, Сивеиф, Савва, Боян, Евстратий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =10
SET @ListName ='Занифа, Наркисса'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =11
SET @ListName ='Марк, Кирилл, Михаил, Иоанн, Евстафий, Иона'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 4
--SET @DaysNumb =11
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =12
SET @ListName ='Иоанн, Софроний, Иоад, Сосфен, Аполлос, Кифа, Кесарь, Епафродит, Еввула, Зосима'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 4
--SET @DaysNumb =12
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =13
SET @ListName ='Ипатий, Иона, Иннокентий, Иоанн, Аполлоний, Авда, Вениамин'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =13
SET @ListName ='Аменония, Анна, Ида'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =14
SET @ListName ='Евфимий, Варсонофий, Сергий, Геронтий, Василид, Макарий, Авраамий, Ахаз'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =14
SET @ListName ='Мария'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =15
SET @ListName ='Тит, Амфиан, Едесий, Поликарп'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 4
--SET @DaysNumb =15
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =16
SET @ListName ='Никита, Елпидифор, Дий, Вифоний, Иллирик'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =16
SET @ListName ='Феодосия'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =17
SET @ListName ='Иосиф, Георгий, Вениамин, Никифон, Николай, Иоанн, Феона, Зосима'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =17
SET @ListName ='Мария, Фервуфа'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =18
SET @ListName ='Иов, Агафопод, Дидим, Феодул, Алексий, Николай, Пуплий, Феона, Симеон, Форвин, Марк, Платон'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 4
--SET @DaysNumb =18
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =19
SET @ListName ='Евтихий, Мефодий, Иоанн, Иаков, Севастиан, Иеремий, Архилий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =19
SET @ListName ='Платонида'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =20
SET @ListName ='Георгий, Аркадий, Каллиопий, Руфин, Даниил, Серапион'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =20
SET @ListName ='Акилина, Леонтина, Евдокия'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =21
SET @ListName ='Иродион, Агав, Асинкрит, Руф, Флегонт, Ерм, Сергий, Павслип, Келестин, Нифонт'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 4
--SET @DaysNumb =21
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =22
SET @ListName ='Евпсихий, Гавриил, Мариав, Авдиес, Вадим'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 4
--SET @DaysNumb =22
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =23
SET @ListName ='Терентий, Помпий, Африкан, Максим, Зинон, Александр, Феодор, Флегонт, Димитрий, Иаков, Азадан, Авдикий, Григорий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 4
--SET @DaysNumb =23
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =24
SET @ListName ='Антипа, Петр, Прохор, Николай, Прокесс, Мартиниан, Фармуфий, Иоанн, Григорий, Иаков, Варсонофий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 4
--SET @DaysNumb =24
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =25
SET @ListName ='Василий, Сергий, Зинон, Исаак, Мина, Давид, Иоанн'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =25
SET @ListName ='Анфиса, Афанасия, Анфуса'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =26
SET @ListName ='Артемон, Крискент'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =26
SET @ListName ='Марфа, Фомаида'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =27
SET @ListName ='Мартин, Александр, Антоний, Иоанн, Евстафий, Ардалион, Азат'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =27
SET @ListName ='Марианна'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =28
SET @ListName ='Аристарх, Пуд, Трофим, Александр, Сухий, Андрей, Анастасий, Талале, Феодорит, Евхирион, Иордан, Кондрат, Лукиан, Мимненос, Нерангиос, Полиевкт, Иаков, Фока, Виктор, Зосима, Савва'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =28
SET @ListName ='Анастасия, Василиса'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =29
SET @ListName ='Леонид , Михаил , Павел , Тимофей '
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =29
SET @ListName ='Агапия, Василиса, Галина, Ирина, Калида, Ника, Феодора, Хариесса, Хиония'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =30
SET @ListName ='Симеон, Авделай, Анания, Хусдазат, Фусик, Азат, Акакий, Зосима, Михаил, Феодор, Адриан, Агапит, Александр'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =30
SET @ListName ='Аскитрея'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex


--####################################################
-- МАЙ
--####################################################

SET @MonthNumb = 5
SET @DaysNumb =1
SET @ListName ='Иоанн, Григорий, Виссарион, Виктор, Зотик, Зинон, Акиндин, Севериан, Косма, Авксентий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =1
SET @ListName ='Тамара'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =2
SET @ListName ='Иоанн, Виктор, Феона, Христофор, Антонин, Георгий, Трифон, Пафнутий, Никифор'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =2
SET @ListName ='Матрона'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =3
SET @ListName ='Феодор, Феодосий, Григорий, Анастасий, Александр, Гавриил, Николай'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =3
SET @ListName ='Виола, Феодора'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =4
SET @ListName ='Ианнуарий, Прокул, Соссий, Фавст, Евтихий, Акутион, Феодор, Диоскор, Сократ, Дионисий, Алексий, Иоанн, Николай, Исакий, Аполлос, Кодрат, Максимиан'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =4
SET @ListName ='Моника, Филиппа, Филиппия'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =5
SET @ListName ='Феодор, Евстафий, Димитрий, Нафанаил, Лука, Климент, Виталий, Всеволод, Платон'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 5
--SET @DaysNumb =5
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =6
SET @ListName ='Авраамий, Иоанн, Анатолий, Протолеон'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =6
SET @ListName ='Александра, Тавифа,  Валерия'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =7
SET @ListName ='Савва, Сергий, Пасикрат, Валентин, Евсевий, Неон, Леонтий, Лонгин, Фома, Алексий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =7
SET @ListName ='Елизавета'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =8
SET @ListName ='Марк, Сергий, Сильвестр, Василий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =8
SET @ListName ='Ида, Ника'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =9
SET @ListName ='Василий, Стефан, Иоанн, Николай, Петр, Иоанникий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =9
SET @ListName ='Глафира'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =10
SET @ListName ='Симеон, Павел, Иоанн, Петр, Николай, Авксентий, Сергий, Иларион, Евлогий, Стефан'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =10
SET @ListName ='Анастасия, Мария'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =11
SET @ListName ='Иасон, Сосипатр, Дада, Максим, Квинтилиан, Саторний, Иакисхол, Фавстиан, Ианнуарий, Марсалий, Евфрасий, Маммий, Мурин, Зинон, Евсевий, Неон, Виталий, Кирилл'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =11
SET @ListName ='Анна, Керкира'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =12
SET @ListName ='Феогнид, Руф, Антипатр, Феостих, Артема, Магн, Феодот, Фавмасий, Филимон, Мемнон, Нектарий, Диодор, Родопиан, Василий, Амфилохий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 5
--SET @DaysNumb =12
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =13
SET @ListName ='Иаков, Никита, Игнатий, Донат, Василий, Максим'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 5
--SET @DaysNumb =13
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =14
SET @ListName ='Иеремия, Пафнутий, Вата,  Макарий, Герасим, Евфимий, Игнатий, Акакий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =14
SET @ListName ='Тамара, Нина'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =15
SET @ListName ='Афанасий, Борис, Глеб, Еспер, Кириак, Феодул, Афанасий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =15
SET @ListName ='Зоя'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =16
SET @ListName ='Тимофей, Феодосий, Николай, Петр, Феофан'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =16
SET @ListName ='Иулиания, Мавра,  Евпраксия'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =17
SET @ListName ='Иоанн, Николай, Еразм, Альвиан, Сильван, Никита, Кирилл, Никифор, Климент, Исаакий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =17
SET @ListName ='Мария, Пелагея, Пелагия'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =18
SET @ListName ='Иаков'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =18
SET @ListName ='Ирина'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =19
SET @ListName ='Иов, Варвар, Вакх, Каллимах, Дионисий, Михей'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 5
--SET @DaysNumb =19
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =20
SET @ListName ='Акакий, Иоанн, Авив, Антоний, Давид, Зенон, Фаддей, Исе, Иосиф, Исидор, Михаил, Пирр, Стефан, Шио, Нил'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =20
SET @ListName ='Каролина'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =21
SET @ListName ='Иоанн, Арсений, Никифор, Пимен'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 5
--SET @DaysNumb =21
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =22
SET @ListName ='Исаия, Христофор, Николай, Иосиф, Димитрий, Василий, Шио'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =22
SET @ListName ='Акилина'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =23
SET @ListName ='Симон, Алфий, Филадельф, Киприан, Онисим, Еразм, Исихий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =23
SET @ListName ='Рената, Исидора, Таисия'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =24
SET @ListName ='Мокий, Мефодий, Кирилл, Ростислав, Михаил, Александр, Софроний, Никодим, Иосиф'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 5
--SET @DaysNumb =24
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =25
SET @ListName ='Епифаний, Герман, Ермоген, Петр, Савин, Полувий, Дионисий, Иоанн, Симеон'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =25
SET @ListName ='Магдалина'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =26
SET @ListName ='Лаодикий, Василий, Александр, Христофор, Макарий, Павсикакий, Сергий, Георгий, Евфимий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =26
SET @ListName ='Гликерия, Ирина, Марианна'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =27
SET @ListName ='Исидор, Петр, Максим, Серапион, Никита, Леонтий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 5
--SET @DaysNumb =27
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =28
SET @ListName ='Пахомий, Исаия, Димитрий, Ахиллий, Евфросин, Серапион'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =28
SET @ListName ='Анастасия'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =29
SET @ListName ='Феодор, Ефрем, Александр, Вит, Модест, Крискентий, Георгий, Кассиан, Лаврентий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =29
SET @ListName ='Крискентия, Муза'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =30
SET @ListName ='Андроник, Солохон, Памфамир, Памфалон, Стефан'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =30
SET @ListName ='Евдокия, Ефросиния, Пальмира, Юния, Иуния'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =31
SET @ListName ='Феодот, Петр, Дионисий, Андрей, Павел, Давид, Макарий, Михаил, Василий, Симеон, Исаак, Вахтисий, Давид, Таричан, Ираклий, Павлин, Венедим'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =31
SET @ListName ='Александра, Евфрасия, Изабелла, Камилла, Клавдия, Матрона, Текуса, Фаина, Феодотия, Христина ,Иулия, Юлия'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--####################################################
-- ИЮНЬ
--####################################################

SET @MonthNumb = 6
SET @DaysNumb =1
SET @ListName ='Патрикий, Акакий, Менандр, Полиен, Корнилий, Димитрий, Виктор, Антоний, Митрофан, Александр, Михаил, Матфий, Ипполит, Николай, Василий, Максим, Павел, Георгий, Онуфрий, Валентин, Калуф, Иоанн, Сергий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =1
SET @ListName ='Анастасия, Прискилла'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =2
SET @ListName ='Фалалей, Александр, Астерий, Алексий, Аскалон, Завулон, Довмонт'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =2
SET @ListName ='Нина, Сусанна'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =3
SET @ListName ='Константин, Михаил, Феодор, Андрей, Кассиан'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =3
SET @ListName ='Елена'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =4
SET @ListName ='Василиск, Иоанн-Владимир, Иаков, Михаил'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =4
SET @ListName ='Софья, Эмма'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =5
SET @ListName ='Дидим, Михаил, Леонтий, Паисий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =5
SET @ListName ='Ефросиния, Мария'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =6
SET @ListName ='Симеон, Никита, Мелетий, Стефан, Иоанн, Серапион, Каллиник, Феодор, Фавст'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =6
SET @ListName ='Маркиана, Палладия, Певка, Сусанна'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =7
SET @ListName ='Иоанн, Таврион, Ферапонт, Иннокентий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 6
--SET @DaysNumb =7
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =8
SET @ListName ='Карп, Алфей, Георгий, Аверкий, Иоанн, Макарий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =8
SET @ListName ='Елена'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =9
SET @ListName ='Ферапонт, Нил, Иоанн,  Дидим, Киприан, Фотий, Иона'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =9
SET @ListName ='Анастасия, Феодора, Диана'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =10
SET @ListName ='Никита, Игнатий,  Макарий, Дионисий, Петр, Николай, Ираклий, Гермогена, Евтихий, Елладий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =10
SET @ListName ='Еликонида, Филофея'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =11
SET @ListName ='Иоанн, Иов, Андрей, Лука'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =11
SET @ListName ='Мария, Фаина, Феодосия'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =12
SET @ListName ='Исаакий, Василий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 6
--SET @DaysNumb =12
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =13
SET @ListName ='Ерм, Ермий, Философ, Борис, Николай'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =13
SET @ListName ='Петронилла, Христина'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =14
SET @ListName ='Иустин, Харитон, Евелпист, Иеракс, Пеон, Валериан, Дионисий, Иоанн, Василий, Агапит'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =14
SET @ListName ='Харита, Вера'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =15
SET @ListName ='Никифор, Варлаам, Иоанн'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =15
SET @ListName ='Мария, Юлиания'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =16
SET @ListName ='Лукиллиан, Клавдий, Ипатий, Павел, Дионисий, Киприан, Михаил, Лукиан, Максиан, Иулиан, Маркеллин, Сатурнин, Димитрий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =16
SET @ListName ='Иерия, Иоланта, Павла'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =17
SET @ListName ='Митрофан, Петр, Мефодий, Фронтасий, Северин, Севериан, Силан, Конкордий, Астий, Зосима, Иоанникий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =17
SET @ListName ='Мария, Марфа, Павла, Софья'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =18
SET @ListName ='Дорофей, Михаил, Николай, Маркиан, Никандр, Иперехий, Аполлон, Леонид, Арий, Селиний, Ириний, Памвон, Анувий, Феодор, Игорь, Константин, Вассиан, Иона'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 6
--SET @DaysNumb =18
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =19
SET @ListName ='Виссарион, Иларион, Рафаил, Архелая, Иона, Паисий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =19
SET @ListName ='Софья, Сусанна, Феклаб Юлиана'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =20
SET @ListName ='Феодот, Андроник, Александр, Алексий, Валентин, Вениамин, Виктор, Павел, Владимир, Игнатий, Лев, Михаил, Николай, Григорий, Афанасий, Петр, Маркеллиан, Клавдий, Кирин, Антонин, Маркелл, Сисиний, Кириак, Смарагд, Ларгий, Апрониан, Сатурнин, Папий, Мавр, Крискентиан'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =20
SET @ListName ='Артемия, Валерия, Есия, Зинаида, Калерия, Кириакия, Лукина, Мария, Прискилла, Сусанна'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =21
SET @ListName ='Феодор, Евфрем, Зосима, Василий, Константин'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =21
SET @ListName ='Афра, Мелания'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =22
SET @ListName ='Кирилл, Алексий, Александр'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =22
SET @ListName ='Магдалина, Мария, Марфа, Маримьяна, Фёкла'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =23
SET @ListName ='Тимофей, Василий, Иоанн, Николай, Павел, Александр, Феофан, Вассиан, Силуан'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =23
SET @ListName ='Антонина, Пансемна'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =24
SET @ListName ='Варфоломей, Варнава, Евфрем'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =24
SET @ListName ='Мария'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =25
SET @ListName ='Онуфрий, Петр, Иоанн, Андрей, Ираклемон, Феофил, Арсений, Авскентий, Стефан, Вассиан, Иона'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =25
SET @ListName ='Анна'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =26
SET @ListName ='Трифиллий, Александр, Димитрий, Иоанн, Андроник, Савва'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =26
SET @ListName ='Акилина, Анна, Антонина, Александра'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =27
SET @ListName ='Елисей, Мефодий, Иосиф, Николай, Александр, Павел, Мстислав'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =27
SET @ListName ='Иулитта'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =28
SET @ListName ='Амос, Иона, Вит, Модест, Дула, Иероним, Августин, Феодор, Лазарь, Евфрем, Григорий, Кассиан'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =28
SET @ListName ='Крискентия'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =29
SET @ListName ='Тихон, Моисей, Феофан, Гермоген, Евфрем, Михаил, Петр, Константин, Тигрий, Евтропий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =29
SET @ListName ='Алексина'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =30
SET @ListName ='Мануил, Савел, Исмаил, Аверкий, Никандр, Максим'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =30
SET @ListName ='Пелагия'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex


--####################################################
-- ИЮЛЬ
--####################################################
SET @MonthNumb = 7
SET @DaysNumb =1
SET @ListName ='Леонтий, Ипатий, Феодул, Никанор, Василий, Александр, Сергий '
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =1
SET @ListName ='Анастасия, Прискилла'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =2
SET @ListName ='Иуда, Иов, Иоанн, Зосима, Паисий, Иоанн, Варлаам'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =2
SET @ListName ='Нина, Сусанна'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =3
SET @ListName ='Мефодий, Глеб, Андрей, Инна, Пинна, Римма, Аристоклий, Димитриан, Афанасий, Левкий, Мина, Николай, Гурий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =3
SET @ListName ='Елена'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex


SET @MonthNumb = 7
SET @DaysNumb =4
SET @ListName ='Иулиан, Максим, Иоанн, Георгий, Алексий, Павел, Николай, Иона, Никита, Терентий, Иулий, Арчил, Луарсаб'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =4
SET @ListName ='Софья, Эмма'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =5
SET @ListName ='Евсевий, Геннадий, Феодор, Гавриил, Зинон, Зина Галактион, , Григорий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =5
SET @ListName ='Ефросиния, Мария, Иулиания'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =6
SET @ListName =' Александр, Алексий, Петр, Митрофан, Евстохий, Гаий, Провий, Лоллий, Урван, Артемий, Герман'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =6
SET @ListName ='Агриппина,Маркиана, Палладия, Певка, Сусанна'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =7
SET @ListName ='Иоанн, Орентий, Фарнакий, Ерос, Фирмос, Фирмин, Кириак, Лонгин, Антоний, Иаков'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 7
--SET @DaysNumb =7
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =8
SET @ListName ='Петр, Никон, Николай, Василий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =8
SET @ListName ='Феврония,Елена'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =9
SET @ListName ='Давид, Георгий, Иоанн, Дионисий, Тихон'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =9
SET @ListName ='Анастасия, Диана'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =10
SET @ListName ='Сампсон, Амвросий, Александр, Владимир, Петр, Севир, Георгий, Мартин, Серапион'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =10
SET @ListName ='Иоанна, Еликонида, Филофея'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =11
SET @ListName ='Кир, Иоанн, Сергий, Герман, Василий, Григорий, Ксенофонт, Павел'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =11
SET @ListName ='Мария, Фаина, Феодосия'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =12
SET @ListName ='Петр, Павел, Григорий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 7
--SET @DaysNumb =12
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =13
SET @ListName ='Петр, Андрей, Иаков, Иоанн, Филипп, Варфоломей, Фома, Матфей, Иаков, Иуда, Симон, Матфий, Тимофей, Феоген, Софроний'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =13
SET @ListName ='Петронилла, Христина'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =14
SET @ListName ='Косма, Дамиан, Аркадий, Алексий, Потит, Петр'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =14
SET @ListName ='Харита, Ангелина'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =15
SET @ListName ='Иувеналий, Фотий, Тихон, Василий, Никон, Неофит, Иона, Парфений'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =15
SET @ListName ='Мария, Юлиания'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =16
SET @ListName ='Иакинф, Филипп, Антоний, Сильвестр, Диомид, Евлампий, Асклипиодот, Мокий, Марк, Александр, Анатолий, Василий, Константин, Иоанн, Лонгин, Никодим'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =16
SET @ListName ='Голиндуха, Иерия, Иоланта, Павла'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =17
SET @ListName ='Андрей, Симеон, Николай, Алексий,  Димитрий, Феодот,  Феодор, Арсений, Евфимий, Савва, Георгий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =17
SET @ListName ='Александра, Мария, Марфа, Павла, Ольга, Татиана, Анастасия, Феодотия, Софья'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =18
SET @ListName ='Афанасий, Сергий, Агапит, Кирилл, Лампад'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =18
SET @ListName ='Анна, Елисавета, Варвара'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =19
SET @ListName ='Сисой, Евфимий, Феодор, Марин, Авдифакс, Аввакум, Кирин, Валентин, Астерий, Коинт, Исавр, Иннокентий, Филикс, Ермий, Василий, Перегрин, Руф, Руфин, Рикс, Антоний, Лукиан, Исидор, Дион, Диодор, Кутоний, Аронос, Капик, Сатур'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =19
SET @ListName ='Софья, Сусанна, Марфа, Юлиана, Лукия, Иулиания'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =20
SET @ListName ='Фома, Акакий, Павел,  Перегрин, Лукиан, Помпей, Исихий, Папий, Саторнин, Герман, Евангел, Епиктет, Астион, Герасим'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =20
SET @ListName ='Артемия, Валерия, Есия, Евдокия, Зинаида, Калерия, Кириакия, Лукина, Мария, Прискилла, Кириакия, Сусанна'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =21
SET @ListName ='Прокопий, Александр, Феодор'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =21
SET @ListName ='Афра, Мелания'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =22
SET @ListName ='Панкратий, Константин, Кирилл, Патермуфий, Коприй, Александр, Феодор'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =22
SET @ListName ='Магдалина, Мария, Марфа, Маримьяна, Фёкла'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =23
SET @ListName ='Леонтий, Маврикий, Даниил, Антоний, Александр, Ианикит, Сисиний, Менея, Вирилад, Антоний, Петр, Стефан, Георгий, Нестор, Аполлоний, Вианор, Сиулан, Евмений, Парфений'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =23
SET @ListName ='Антонина, Пансемна'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =24
SET @ListName ='Киндей'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =24
SET @ListName ='Мария, Евфимия, Ольга, '
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =25
SET @ListName ='Прокл, Иларий, Михаил, Иоанн, Гавриил, Феодор, Арсений, Симон'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =25
SET @ListName ='Анна, Голиндуха'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =26
SET @ListName ='Гавриил, Стефан, Иулиан, Серапион, Маркион'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =26
SET @ListName ='Акилина, Анна, Антонина'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =27
SET @ListName ='Акила, Константин, Николай, Иуст, Онисим, Еллий, Стефан, Никодим, Иоанн'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 7
--SET @DaysNumb =27
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =28
SET @ListName ='Кирик,  Владимир, Петр, Авудим'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =28
SET @ListName ='Иулитта'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =29
SET @ListName ='Афиноген, Иаков, Петр, Иоанн, Феодор, Ардалион, Антиох, Павел'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =29
SET @ListName ='Алексина, Матрона, Алевтина, Хиония, Иулия'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =30
SET @ListName ='Иринарх, Леонид, Лазарь '
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =30
SET @ListName ='Марина'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =31
SET @ListName ='Иакинф, Емилиан, Аполлинарий, Иоанн'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 7
--SET @DaysNumb =31
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex


--####################################################
-- АВГУСТ
--####################################################
SET @MonthNumb = 8
SET @DaysNumb =1
SET @ListName =' Дий, Серафим, Роман, Паисий, Стефан, Димитрий, Митрофан, Тихон'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =1
SET @ListName ='Макрина, Милица'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =2
SET @ListName ='Илия, Константин, Николай, Александр, Георгий, Сергий, Иоанн, Феодор, Тихон, Косма, Евфимий, Петр, Алексий, Аврамий, Афанасий '
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 8
--SET @DaysNumb =2
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =3
SET @ListName ='Иезекииль, Симеон, Иоанн, Петр, Онуфрий, Онисим'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =3
SET @ListName ='Анна'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =4
SET @ListName ='Фока, Михаил, Алексий, Корнилий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =4
SET @ListName ='Зина, Мария'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =5
SET @ListName ='Трофим, Феофил, Феодор, Михаил, Андрей, Аполлинарий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =5
SET @ListName ='Анна, Стелла'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =6
SET @ListName ='Борис, Глеб, Алфей, Николай, Иоанн, Поликарп'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =6
SET @ListName ='Христина'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =7
SET @ListName ='Александр'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =7
SET @ListName ='Анна, Бландина, Евпраксия, Олимпиада'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =8
SET @ListName ='Ермолай, Ермипп, Ермократ, Сергий, Моисей'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =8
SET @ListName ='Иерусалима, Прасковья, Параскева, Сильвия'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =9
SET @ListName ='Пантелеимон, Герман, Амвросий, Платон, Иоанн, Климент, Наум, Савва, Ангеляр, Николай, Иосаф'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =9
SET @ListName ='Анфиса'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =10
SET @ListName ='Арефа, Прохор, Никанор, Тимон, Пармен, Питирим, Николай, Василий, Иулиан, Евстафий, Акакий, Павел, Моисей'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =10
SET @ListName ='Антонина, Дросида, Ирина,  Елена, Иоанна, Мавра '
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =11
SET @ListName ='Каллиник, Серафим, Феогност, Анатолий, Алексий, Пахомий, Евстафий, Михаил, Константин, Косма'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =11
SET @ListName ='Серафима, Феодотия'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =12
SET @ListName ='Сила, Силуан, Крискент, Епенет, Андроник, Иоанн, Анатолий, Полихроний, Пармений, Елима, Хрисотель, Лука, Муко, Авдон, Сеннис, Олимпий, Максим, Валентин, Прокул, Ефив, Аполлоний, Авундий, Герман'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =12
SET @ListName ='Агния, Ангелина, Клара, Лукия'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =13
SET @ListName ='Евдоким, Вениамин, Сергий, Юрий, Иоанн, Максим, Владимир, Константин, Николай, Василий, Дионисий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =13
SET @ListName ='Анна, Елисавета, Иулитта'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =14
SET @ListName ='Авим, Антонин, Гурий, Елеазар, Евсевон, Алим, Маркелл, Елеазар, Димитрий, Леонтий, Аттий, Александр, Киндей, Минсифей, Кириак, Минеон, Катун, Евклей'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =14
SET @ListName ='Соломония, София'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =15
SET @ListName ='Стефан, Никодим, Гамалиил, Авив, Василий, Платон'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =15
SET @ListName ='Екзуперия, Люцилла'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =16
SET @ListName ='Исаакий, Фавст, Далмат, Антоний, Вячеслав, Николай, Ражден, Косма'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =16
SET @ListName ='Саломея'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =17
SET @ListName ='Максимилиан, Иамвлих, Мартиниан, Иоанн, Дионисий, Ексакустодиан, Антонин, Михаил, Симеон, Димитрий, Елевферий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =17
SET @ListName ='Дария, Евдокия, Ирина'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =18
SET @ListName ='Евсигний Симон, Иоанн, Фавий, Понтий, Иов, Кантидий, Кантидиан, Сивел'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =18
SET @ListName ='Нонна, Христина, Евдокия, Дария, Мария,'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =19
SET @ListName ='Александр, Алексей, Антон, Афанасий, Василий, Димитрий, Иван, Митрофан, Михаил, Никанор, Петр'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 8
--SET @DaysNumb =19
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =20
SET @ListName ='Митрофан, Антоний, Александр, Петр, Михаил, Иоанн, Димитрий, Алексий, Елисей, Афанасий, Василий, Марин, Астерий, Ор, Феодосий, Иерофей, Стефан, Пимен, Меркурий, '
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =20
SET @ListName ='Потамия'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =21
SET @ListName ='Емилиан, Зосима, Савватий, Герман, Иосиф, Николай, Никодим, Мирон, Григорий, Елевферий, Леонид'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 8
--SET @DaysNumb =21
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =22
SET @ListName ='Матфий, Псой, Иулиан, Маркиан, Иоанн, Иаков, Алексий, Димитрий, Фотий, Петр, Леонтий, Григорий, Антоний'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =22
SET @ListName ='Ирина, Маргарита, Мария'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =23
SET @ListName ='Лаврентий, Сикст, Феликиссим, Агапит, Роман, Вячеслав, Афанасий, Савва'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =23
SET @ListName ='Роза'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =24
SET @ListName ='Евпл, Гаий, Клавдий, Максим, Александр, Куфий, Феодор, Василий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =24
SET @ListName ='Мария, Препедигна, Сусанна'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =25
SET @ListName ='Фотий, Аникита, Варлаам, Сергий, Илия, Вячеслав, Иоасаф, Иоанн, Антоний, Михей, Виссарион, Матфей, Евфимий, Варнава, Димитрий, Савва, Гермоген, Аркадий, Маркелл, Иаков, Петр, Александр, Феодор, Алексий, Василий, Леонид, Николай, Памфил, Капитон'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 8
--SET @DaysNumb =25
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =26
SET @ListName ='Максим, Тихон, Иоанн, Иосаф, Константин, Серафим, Николай, Иаков, Алексий, Василий, Ипполит, Ириней, Авундий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =26
SET @ListName ='Евдокия, Ирина, Конкордия, Ксения'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =27
SET @ListName ='Михей, Василий, Матфей, Алексий, Владимир, Николай, Елевферий, Феодор, Александр, Маркелл, Аркадий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =27
SET @ListName ='Ева, Евдокия, Моника, Феодосия'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =28
SET @ListName ='Александр, Герасим, Степан, Яков'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =28
SET @ListName ='Анна'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =29
SET @ListName ='Диомид, Стефан, Александр, Иаков, Херимон'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =29
SET @ListName ='Анна, Сабина'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =30
SET @ListName ='Мирон, Пимен, Алексий, Димитрий, Фирс, Левкий, Коронат, Патрокл, Павел, Стратон, Филипп, Евтихиан, Киприан, Алипий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =30
SET @ListName ='Роза, Юлиания'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =31
SET @ListName ='Флор, Лавр, Григорий, Евгений, Михаил, Ерм, Серапион, Полиен, Емилиан, Иларион, Дионисий, Ермипп, Иоанн, Георгий, Макарий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =31
SET @ListName ='Иулитта, Иулиания, Юлиания'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex


--####################################################
-- СЕНТЯБРЬ
--####################################################
SET @MonthNumb = 9
SET @DaysNumb =1
SET @ListName ='Андрей, Николай, Тимофей, Агапий, Питирим'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =1
SET @ListName ='Фёкла'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =2
SET @ListName ='Самуил, Владимир, Севир, Мемнон'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =2
SET @ListName ='Аделина'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =3
SET @ListName ='Фаддей, Феогний, Агапий, Пист, Аврамий, Александр, Павел, Игнатий, Рафаил'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =3
SET @ListName ='Васса, Сабина, Марфа, Феоклита'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =4
SET @ListName ='Агафоник, Зотик, Феопрепий, Акиндин, Севериан,Исаакий, Макарий, Иоанн, Алексий, Александр, Михаил, Феодор, Иларион, Иерофей, Афанасий, Харисм, Неофит'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =4
SET @ListName ='Анфиса, Анфуса, Ариадна, Евлалия, Роза, Розалия, Феодора'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =5
SET @ListName ='Лупп, Ефрем, Иоанн, Николай, Павел, Ириней, Евтихий, Флорентий, Каллиник'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =5
SET @ListName ='Елизавета'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =6
SET @ListName ='Евтихий, Иоанн, Петр, Серафим, Татион, , Георгий, Косма, Арсений, Аристоклий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =6
SET @ListName ='Сира'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =7
SET @ListName ='Варфоломей, Тит, Моисей, Владимир, Варсис, Евлогий, Протоген, Мина'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =7
SET @ListName ='Регина, Синклитикия'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =8
SET @ListName ='Адриан, Петр, Георгий, Виктор, Димитрий, Роман'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =8
SET @ListName ='Мария,Наталия'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =9
SET @ListName ='Пимен, Михаил, Стефан, Иоанн, Мефодий, Александр, Владимир, Димитрий, Осия, Ливерий, Пимен, Кукша, Никон, Савва'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =9
SET @ListName ='Анфиса, Людина'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex



SET @MonthNumb = 9
SET @DaysNumb =10
SET @ListName ='Моисей, Савва, Иов, Сергий, Лаврентий, Серафим, Феодосий, Леонтий, Стефан, Георгий, Иларион, Иоанн, Николай, Руф, Василий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =10
SET @ListName ='Анна, Инесса, Иулитта, Сусанна, Шушаника'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =11
SET @ListName ='Иоанн, Ян'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 9
--SET @DaysNumb =11
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =12
SET @ListName ='Александр, Иоанн, Павел, Даниил, Петр, Феодор, Игнатий, Христофор, Фантин, Савва, Арсений, Евстафий, Иаков, Никодим, Иоанникий, Ефрем, Спиридон, Макарий, Гавриил, Григорий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =12
SET @ListName ='Елисавета, Виктория, Вриена'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =13
SET @ListName ='Александр, Владимир, Михаил, Мирон, Димитрий, Киприан, Геннадий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 9
--SET @DaysNumb =13
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =14
SET @ListName ='Симеон, Иисус, Аифал, Аммун, Евод, Ермоген'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =14
SET @ListName ='Каллиста, Маргарита, Татиана, Наталия, Марфа'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =15
SET @ListName ='Мамант, Феодот, Иоанн, Антоний, Феодосий, Варсонофий, Анатолий, Николай, Михаил, Филипп, Евфимий, Владимир, Виктор, Василий, Петр, Стефан, Герман, Павел'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =15
SET @ListName ='Ксения, Руфина'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =16
SET @ListName ='Анфим, Феофил, Дорофей, Мардоний, Мигдоний, Петр, Индис, Горгоний, Зинон, Евфимий, Феоктист, Иоанн, Пимен, Сергий, Василий, Филипп, Владимир, Мелетий, Парфений, Андрей, Феофан, Михаил, Николай, Роман, Алексий, Илия, Иоанникий, Аристион'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =16
SET @ListName ='Василиса, Василисса, Дасия, Фива, Домна'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =17
SET @ListName ='Моисей, Вавила, Урван, Прилидиан, Епполоний, Парфений, Иосаф, Митрофан, Григорий, Павел, Иоанн, Николай, Александр, Петр, Илия, Михаил, Стефан, Миан, Иулиан, Кион, Вавила'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =17
SET @ListName ='Евтихия, Елена, Ермиония, Христодула'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =18
SET @ListName ='Захария, Афанасий, Алексий, Евфимий, Фифаил, Иувентин, Максим, Урван, Феодор, Медимн, Авдий, Глеб, Сарвил'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =18
SET @ListName ='Вевея, Елизавета, Ираида, Раиса, Фивея'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =19
SET @ListName ='Михаил, Евдоксий, Зинон, Макарий, Димитрий, Константин, Иоанн, Всеволод, Ромил, Архипп, Кириак, Фавст, Авив, Кирилл, Давид'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =19
SET @ListName ='Амалия, Василиса, Фёкла'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =20
SET @ListName ='Созонт, Иоанн, Макарий, Петр, Михаил, Александр, Евгений, Стефан, Николай, Пахомий, Григорий, Василий, Лев, Евод, Онисифор, Евпсихий, Лука, Александр, Андрей, Серапион'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 9
--SET @DaysNumb =20
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =21
SET @ListName ='Иоанн, Георгий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =21
SET @ListName ='Мария'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =22
SET @ListName ='Иоаким, Севериан, Иосиф, Феодосий, Григорий, Александр, Захария, Василий, Сергий, Алексий, Димитрий, Андроник, Харитон, Стратор, Феофан, Никита, Онуфрий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =22
SET @ListName ='Анна, Руфь'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =23
SET @ListName ='Митродор, Исмаил, Евгений, Иоанн, Константин, Петр, Василий, Глеб, Николай, Палладий, Мелетий, Гавриил, Симеон, Уар, Апеллий, Лукий, Климент, Варипсав, Павел, Иосаф'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =23
SET @ListName ='Минодора, Митродора, Нимфодора, Татиана, Пульхерия'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =24
SET @ListName ='Сергий, Герман, Сулуан, Николай, Виктор, Карп, Димитрий, Еванфия, Димитриан, Евфросин, Диодор, Дидим'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =24
SET @ListName ='Ия,  Феодора'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =25
SET @ListName ='Автоном, Афанасий, Феодор, Иоанн, Николай, Алексий, Корнут, Иулиан, Вассиан, Симеон'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 9
--SET @DaysNumb =25
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =26
SET @ListName ='Корнилий, Стефан, Александр, Николай, Кронид, Леонтий, Серапион, Селевк, Стратоник, Макровий, Гордиан, Илия, Зотик, Лукиан, Валериан, Иулиан, Петр'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =26
SET @ListName ='Кетевана'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =27
SET @ListName ='Иоанн'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 9
--SET @DaysNumb =27
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =28
SET @ListName ='Никита, Иоанн, Андрей, Григорий, Игнатий, Димитрий, Иаков, Петр, Николай, Акакий, Максим, Феодот, Порфирий, Стефан, Иосиф, Филофей, Симеон'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =28
SET @ListName ='Асклиада, Клементина, Евдокия, Мария, Людмила, Плакилла'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =29
SET @ListName ='Ренат, Григорий, Сергий, Алексий, Виктор, Сосфен, Дорофей, Иосиф, Исаак, Киприан, Кукша'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =29
SET @ListName ='Людмила, Мелитина, Евфимия, Севастиана,'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =30
SET @ListName ='Павел, Феодосий, Серафим, Никодим, Иоанн, Пелий, Нил, Зинон, Патермуфий, Илия, Иоаким'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =30
SET @ListName ='Агафоклия, Вера, Любовь, Надежда, Софья, Ирина, Александра, Феодотия'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex


--####################################################
-- ОКТЯБРЬ
--####################################################

SET @MonthNumb = 10
SET @DaysNumb =1
SET @ListName ='Евмений, Иларион, Алексий, Петр, Амфилохий, Иоанн, Борис, Михаил, Владимир, Вениамин, Константин, Сергий, Элизбар, Кастор'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =1
SET @ListName ='Ариадна, Ефросиния, Ирина, Софья, Тереза'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =2
SET @ListName ='Трофим, Савватий, Феодор, Давид, Константин, Алексий, Николай, Нил, Зосима, Игорь'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =2
SET @ListName ='Мария'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =3
SET @ListName ='Евстафий, Агапий, Феопист, Михаил, Федор, Феоктист, Александр, Олег'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =3
SET @ListName ='Татьяна, Феопистия'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =4
SET @ListName ='Кодрат, Димитрий, Александр, Алексий, Константин, Иоанн, Маврикий, Василий, Владимир, Валентин, Андрей, Петр, Испатий, Даниил, Иосиф, Исаакий, Мелетий, Евсевий, Приск'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =4
SET @ListName ='Агния, Васса'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =5
SET @ListName ='Иона, Фока, Феофан, Феодор,  Вениамин, Петр, Макарий, Феодосий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =5
SET @ListName ='Параскева'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =6
SET @ListName ='Иннокентий, Иоанн, Андрей, Петр, Антонин'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =6
SET @ListName ='Ираида, Поликсения, Ксанфиппа, Ираида, Ревекка'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =7
SET @ListName ='Василий, Андрей, Павел, Виталий, Сергий, Спиридон, Никандр, Коприй, Стефан, Владислав, Галактион'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =7
SET @ListName ='Фёкла'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =8
SET @ListName ='Сергий, Николай, Пафнутий, Герман'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =8
SET @ListName ='Ефросиния, Лаура, Татта, Феодулия, Досифея'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =9
SET @ListName ='Иоанн, Тихон, Афанасий, Александр, Димитрий, Николай, Владимир, Гедеон, Ефрем'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =9
SET @ListName ='Кира'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =10
SET @ListName ='Каллистрат, Савватий, Петр, Димитрий, Герман, Феодор, Михаил, Марк, Аристарх, Игнатий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =10
SET @ListName ='Акилина, Гаиания, Епихария, Дорофея, Епихария, Зина, Феврония'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =11
SET @ListName ='Харитон, Кирилл, Сергий, Иларион, Варух, Александр, Алфей, Зосима, Марк, Никон, Неон, Илиодор, Вячеслав, Иродион'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =11
SET @ListName ='Анна, Мария, Юлиания, Михаила, Татиана'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =12
SET @ListName ='Кириак, Иоанн, Феофан'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =12
SET @ListName ='Петрония, Каздоя'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =13
SET @ListName ='Григорий, Михаил, Прокопий, Петр, Вячеслав, Симеон, Василий, Александр, Серафим, Алексий, Матфей, Леонид'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =13
SET @ListName ='Александра, Аполлинария, Гаиания, Мария, Рипсимия'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =14
SET @ListName ='Анания, Роман, Савва, Алексий, Михаил, Александр, Георгий, Николай, Иоанн, Феодор'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =14
SET @ListName ='Вера, Сатурнина, Фавстина'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =15
SET @ListName ='Киприан, Феоктист, Андрей, Феодор, Давид, Константин, Кассиан'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =15
SET @ListName ='Анна, Александра, Аврелия, Анна, Тереза, Юстина, Иустина'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =16
SET @ListName ='Дионисий, Рустик, Елевферий, Агафангел, Иоанн, Исихий, Дионисий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =16
SET @ListName ='Феодосия, Ядвига'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =17
SET @ListName ='Иерофей, Гурий, Варсонофий, Димитрий, Николай, Михаил, Иаков, Тихон, Василий, Гаий, Фавст, Евсевий, Херимон, Петр, Давикт, Аммон, Павел, Владимир, Елладий, Онисим, Стефан'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =17
SET @ListName ='Виринея, Домнина, Каллисфения, Просдока, Проскудия, Хиония'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =18
SET @ListName ='Петр, Алексий, Иона, Макарий, Филипп, Иов, Ермоген, Тихон, Филарет, Иннокентий, Гавриил, Дионисий, Григорий, Дамиан, Иеремия, Матфей'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =18
SET @ListName ='Харитина, Мамелхва'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =19
SET @ListName ='Фома, Иоанн'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =19
SET @ListName ='Еротиида, Лаура'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =20
SET @ListName ='Сергий, Вакх, Николай, Иулиан, Кесарий, Полихроний, Мартиниан, Иона'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =20
SET @ListName ='Аделина, Алина, Пелагия'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =21
SET @ListName ='Димитрий, Иоанн, Амвросий, Пахомий, Николай,  Иона, Серафим, Петр, Василий, Павел, Владимир, Виктор,  Варлаам, Досифей, Трифон'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =21
SET @ListName ='Пелагия, Татиана, Мария, Надежда, Елисавета, Петрония, Таисия, Урсула'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =22
SET @ListName ='Иаков, Андроник, Константин, Петр, Авраам, Лот, Еввентий, Максим'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =22
SET @ListName ='Афанасия, Поплия'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =23
SET @ListName ='Евлампий, Амвросий, Иннокентий, Феотекн, Вассиан, Феофил, Амфилохий, Андрей'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =23
SET @ListName ='Евлампия'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =24
SET @ListName ='Филипп, Феофан, Лев, Макарий, Моисей, Антоний, Иларион, Амвросий, Анатолий, Исаакий, Иосиф, Варсонофий, Нектарий, Никон, Филарет, Александр, Иувеналий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =24
SET @ListName ='Зинаида, Филонилла'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =25
SET @ListName ='Пров, Тарах, Андроник, Косма, Иоанн, Лаврентий, Александр, Николай, Мартин, Амфилохий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =25
SET @ListName ='Анфия, Домна'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =26
SET @ListName ='Карп, Папила, Агафодор, Иннокентий, Николай, Флорентий, Вениамин, Никита, Мелетий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =26
SET @ListName ='Агафоника, Злата, Хрисия, Хриса'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =27
SET @ListName ='Назарий, Гервасий, Протасий, Келсий,  Михаил, Петр, Максимилиан, Сильван, Никола'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =27
SET @ListName ='Параскева, Прасковья'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =28
SET @ListName ='Евфимий, Лукиан, Симеон, Димитрий, Афанасий, Сарвил, Савин, Иоанн '
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =28
SET @ListName ='Вевея'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =29
SET @ListName ='Лонгин, Георгий, Евгений, Алексий, Иоанн '
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =29
SET @ListName ='Виола, Евпраксия, Ефросиния'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =30
SET @ListName ='Осия, Андрей, Неофит, Анатолий, Иакинф, Каллист, Александр, Косма, Дамиан, Леонтий, Анфим, Евтропий, Лазарь, Антоний'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 10
--SET @DaysNumb =30
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =31
SET @ListName ='Лука, Иосиф, Андрей, Сергий, Николай, Марин, Иулиан'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =31
SET @ListName ='Хриса'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--####################################################
-- НОЯБРЬ
--####################################################

SET @MonthNumb = 11
SET @DaysNumb =1
SET @ListName ='Иоиль, Уар, Иоанн, Сергий, Садок'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =1
SET @ListName ='Клеопатра'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =2
SET @ListName ='Артемий, Николай, Герман, Зосима, Леонид, Александр, Михаил, Петр, Павел'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =2
SET @ListName ='Матрона'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =3
SET @ListName ='Иларион, Павлин, Аркадий, Анатолий, Никандр, Киприан, Дамиан, Константин, Сергий, Василий, Феодор, Владимир, Николай, Иоанн, Александр, Димитрий, Алексий, Софроний, Неофит, Пелагий, Дассий, Гаий, Зотик, Феофил, Иаков'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =3
SET @ListName ='Аза, Сильвия'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =4
SET @ListName ='Аверкий, Максимилиан, Иамвлих, Мартиниан, Дионисий, Антонин, Константин, Иоанн, Серафим, Владимир, Александр, Василий, Герман, Мина, Николай, Григорий, Ираклий, '
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =4
SET @ListName ='Анна, Анфиса, Гликерия, Елизавета, Елисавета, Руфь, Феодотия'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =5
SET @ListName ='Иаков, Николай, Владимир, Александр, Емилиан, Созонт, Игнатий, Елисей'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =5
SET @ListName ='Евфросиния'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =6
SET @ListName ='Арефа, Зосима, Лаврентий, Алексий, Иоанн, Николай, Петр, Елезвой, Сисой, Феофил, Афанасий, Георгий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =6
SET @ListName ='Синклитикия'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =7
SET @ListName ='Маркиан, Мартирий, Анастасий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =7
SET @ListName ='Тавифа, Матрона'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =8
SET @ListName ='Димитрий, Лупп, Афанасий, Феофил'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =8
SET @ListName ='Лептина'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =9
SET @ListName ='Нестор, Сергий, Андрей, Марк'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =9
SET @ListName ='Еротиида, Капитолина, Леокадия'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =10
SET @ListName ='Терентий, Сарвил, Фот, Феодул, Иеракс, Нит, Вил, Стефан, Арсений, Иов, Димитрий, Иоанн, Африкан, Максим, Помпий, Кириак, Неофит, Феофил'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =10
SET @ListName ='Анна, Валентина, Неонилла, Прасковья, Параскева, Евникия'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =11
SET @ListName ='Аврамий, Николай, Косма, Виктор, Наум, Филипп, Иоанн, Павел, Андрей, Василий, Алексий, Евгений, Леонид, Клавдий, Астерий, Неон'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =11
SET @ListName ='Агафия, Анастасия, Анна, Мария, Мелитина, Феонилла'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =12
SET @ListName ='Зиновий, Леонид, Матфей, Тертий, Марк, Иуст, Артема, Маркиан, Стефан'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =12
SET @ListName ='Анастасия, Евтропия, Елена, Зиновия'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =13
SET @ListName ='Стахий, Амплий, Урван, Наркисс, Апеллий, Аристовул, Епимах, Иоанн, Леонид, Всеволод, Александр, Сергий, Алексий, Василий, Петр, Анатолий, Евфросин, Иаков, Иннокентий, Спиридон, Никодим'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =13
SET @ListName ='Мавра'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =14
SET @ListName ='Косма, Дамиан, Александр, Феодор, Димитрий, Петр, Иоанн, Иаков, Ерминингельд, Кесарий, Дассий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =14
SET @ListName ='Елисавета, Иулиания, Кириена, Феодотия, Юлиания'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =15
SET @ListName ='Акиндин, Пигасий, Аффоний, Елпидифор, Анемподист, Константин, Анания, Маркиан'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =15
SET @ListName ='Домна, Домнина'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =16
SET @ListName ='Акепсим, Иосиф, Аифал, Василий, Петр, Александр, Владимир, Сергий, Николай, Викентий, Иоанн, Павел, Косма, Симеон,  Аттик, Агапий, Евдоксий, Катерий, Истукарий, Пактовий, Никтополион'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =16
SET @ListName ='Анна, Евдокия, Гертруда, Перпетуя, Светлана, Снандулия, Феодотия'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =17
SET @ListName ='Иоанникий, Никандр, Ермей, Николай, Александр, Исмаил, Меркурий, Симон'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =17
SET @ListName ='Евгения, Клементина'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =18
SET @ListName ='Галактион, Иона, Тихон, Гавриил, Патров, Ерм, Лин, Гаий, Филолог, Григорий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =18
SET @ListName ='Епистимия'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =19
SET @ListName ='Павел, Варлаам, Никита, Анатолий, Арсений, Николай, Константин, Гавриил,  Василий,  Лука, Герман'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =19
SET @ListName ='Александра, Афанасия, Ефросиния, Клавдия, Матрона, Полактия, Серафима, Нина, Текуса'  
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =20
SET @ListName ='Иерон, Исихий, Никандр, Афанасий, Мамант, Варахий, Каллиник, Феаген, Никон, Лонгин, Феодор, Валерий, Ксанф, Феодул, Каллимах, Евгений, Феодох, Острихий, Епифаний, Максимиан, Дукитий, Клавдиан, Феофил, Дорофей, Феодот, Кастрикий, Аникита, Фемелий, Евтихий, Иларион, Амонит, Лазарь, Кирилл, Михаил, Александр, Николай, Алексий, Павел, Василий, Павлин, Иоанн, Вениамин, Сергий, Георгий, Меласипп,  Антонин, Зосима, Авкт, Таврион'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =20
SET @ListName ='Фессалоникия, Касиния, Елисавета' 
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =21
SET @ListName ='Гавриил, Рафаил, Уриил, Селафиил, Иегудиил, Варахиил, Иеремиил, Павел'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 11
--SET @DaysNumb =21
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =22
SET @ListName ='Онисифор, Порфирий, Парфений, Константин, Димитрий, Нестор, Феодор, Виктор, Илия, Иосиф, Алексий, Александр, Антоний, Иоанн, Нектарий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =22
SET @ListName ='Матрона, Сосипатра, Феоктиста, Евстолия'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =23
SET @ListName ='Ераст, Олимп, Родион, Сосипатр, Куарт, Тертий, Нифонт, Александр, Прокопий, Дионисий, Иоанн, Петр, Августин, Иоанникий, Серафим, Алексий, Аполлон, Михаил, Николай,  Борис, Орест, Милий, Константин, Феостирикт'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =23
SET @ListName ='Лукреция, Ольга, Феоктиста, Анна'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =24
SET @ListName ='Мина, Виктор, Стефанида, Викентий, Феодор, Максим, Евгений, Стефан, Мартирий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =24
SET @ListName ='Степанида, Флора'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =25
SET @ListName ='Иоанн, Нил, Константин, Владимир, Александр, Матфей, Димитрий, Борис, Ахия'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =25
SET @ListName ='Карина'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =26
SET @ListName ='Иоанн, Антонин, Никифор, Герман'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =26
SET @ListName ='Манефа'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =27
SET @ListName =' Филипп, Димитрий, Александр, Виктор, Алексий, Михаил, Феодор, Петр, Сергий, Николай, Василий, Порфирий, Георгий, Аристарх, Гавриил, Иустиниан, Григорий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =27
SET @ListName ='Анна, Феодора'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =28
SET @ListName ='Гурий, Самон, Авив, Паисий, Николай, Петр, Григорий, Никита, Димитрий, Елпидий, Маркелл, Евстохий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 11
--SET @DaysNumb =28
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex


SET @MonthNumb = 11
SET @DaysNumb =29
SET @ListName ='Матфей, Феодор, Анания, Михаил, Иоанн, Николай, Виктор, Василий, Макарий, Пантелеимон, Димитрий, Фулвиан, Филумен'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 11
--SET @DaysNumb =29
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =30
SET @ListName ='Григорий, Никон, Сергий, Лазарь'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =30
SET @ListName ='Виктория'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex


--####################################################
-- ДЕКАБРЬ
--####################################################

SET @MonthNumb = 12
SET @DaysNumb =1
SET @ListName ='Платон, Роман, Варул, Николай, Закхей, Алфей'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 12
--SET @DaysNumb =1
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =2
SET @ListName ='Акиндин, Авдий, Варлаам, Иоасаф, Авенир, Филарет, Порфирий, Сергий, Михаилй, Иоанн, Константин, Александр, Игнатий, Симеон, Димитрий, Иаковй, Геннадий, Петр, Григорий, Вениамин, Герасим, Валентин, Леонид, Тимофей, Илиодор,  Иларион, Адриан'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =2
SET @ListName ='Аза, Ефимия'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =3
SET @ListName ='Григорий, Прокл, Макарий, Алексий, Александр, Владимир, Иоанн, Василий, Николай, Арсений, Евтихий, Иларион, Иоанникия, Дассий, Евстафий, Феспесий, Анатолий, Нирса, Иосиф, Саверий, Исакий, Ипатий, Азат, Сасоний, Дамиан'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =3
SET @ListName ='Анна, Нина, Татиана, Фёкла'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =4
SET @ListName ='Александр'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =4
SET @ListName ='Ада, Гликерия, Мария'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =5
SET @ListName ='Филимон, Архипп,  Михаил, Владимир, Иоасаф, Иоанн, Василий, Павел, Иаков, Феодор, Илия, Алексий, Афанасий, Герасим, Евтихий, Авенир, Савва, Марк, Борис, Валериан, Тивуртий, Максим, Менигн, Прокопий, Агавва, Ярополк'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =5
SET @ListName ='Апфия, Кикилия, Параскева, Цецилия'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =6
SET @ListName ='Амфилохий, Григорий, Александр, Митрофан, Серафим, Иоанн, Борис, Елеазар, Сисиний, Феодор'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =6
SET @ListName ='Елен'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =7
SET @ListName ='Меркурий, Евграф, Евгений, Михаил, Александр, Алексий, Иоанн, Корнилий, Митрофан, Порфирий, Симон'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =7
SET @ListName ='Августа, Екатерина, Мастридия, Филотея'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =8
SET @ListName ='Климент, Петр, Серафим, Григорий, Иоанн, Василий, Косма, Симеон, Иларион, Ярослав, Александр, Виктор, Андрей, Варлаам, Павел, Николай'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =8
SET @ListName ='Магдалина'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =9
SET @ListName ='Алипий, Иннокентий, Николай, Иоанн, Георгий, Назарий, Василий, Илия, Даниил, Михаил, Тихон, Петр, Иаков'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 12
--SET @DaysNumb =9
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =10
SET @ListName ='Иаков, Палладий, Всеволод, Андрей, Николай, Василий, Борис, Феодор, Алексий, Иоанн, Сергий, Димитрий, Владимир, Иоасаф, Кронид, Ксенофонт, Аполлос, Серафим, Никон, Роман'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =10
SET @ListName ='Фёкла'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =11
SET @ListName ='Стефан, Иринарх, Серафим, Петр, Алексий, Василий, Рафаил, Викентий, Николай, Григорий, Иоанн, Феодор'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =11
SET @ListName ='Параскева, Анисия, Анна'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =12
SET @ListName ='Парамон, Филумен, Акакий, Сергий, Авив, Нектарий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 12
--SET @DaysNumb =12
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =13
SET @ListName ='Андрей, Иоанн, Фрументий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 12
--SET @DaysNumb =13
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =14
SET @ListName ='Наум, Филарет, Анания'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =14
SET @ListName ='Каллиникия'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =15
SET @ListName ='Аввакум, Иоанн, Матфей, Димитрий, Константин, Николай, Сергий, Владимир, Феодор, Павел, Данакт, Косма,  Борис,  Ираклемон, Андрей, Феофил, Исе, Афанасий, Стефан'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =15
SET @ListName ='Миропия, Маргарита, Феврония, Тамара, Антонина, Мария, Матрона, Вера' 
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =16
SET @ListName ='Софония, Савва, Андрей, Николай, Георгий, Феодул, Феодор'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =16
SET @ListName ='Аделаида, Алиса, Гликерия'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =17
SET @ListName ='Иоанн, Алексий, Иоанн, Александр, Николай, Василий, Димитрий, Геннадий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =17
SET @ListName ='Варвара, Юлиания, Иулиания, Анастасия, Екатерина, Кира'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =18
SET @ListName ='Савва, Илия, Геннадий, Сергий, Карион, Захария, Гурий, Анастасий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 12
--SET @DaysNumb =18
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =19
SET @ListName ='Николай'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 12
--SET @DaysNumb =19
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =20
SET @ListName ='Амвросий, Антоний, Нил, Сергий, Антоний, Андроник, Михаил, Никифор, Галактион, Гурий, Иоанн, Петр, Василий, Афинодор, Павел'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =20
SET @ListName ='Нимферуса, Стратия, Филофея'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =21
SET @ListName ='Патапий, Сергий, Сосфен, Аполлос, Кифа, Тихик, Епафродит, Кесарь, Онисифор, Кирилл'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =21
SET @ListName ='Анфиса'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =22
SET @ListName ='Владимир, Василий, Александр, Самуил, Софроний, Стефан'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =22
SET @ListName ='Анна, Евфросиния'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =23
SET @ListName ='Мина, Ермоген, Евграф, Иоасаф, Иаков, Александр, Михаил, Анатолий, Евгений, Константин, Николай, Петр, Евсевий, Дорофей, Лаврентий, Григорий,  Сергий,  Алексий, Гемелл, Фома, Иоанн, Стефан'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =23
SET @ListName ='Анна, Ангелина, Виктория, Евлалия, Фекла, Евдокия, Татиана, Александра'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =24
SET @ListName ='Даниил, Феофан, Николай, Иоанн, Миракс, Лука, Никон, Акепсий, Аифал'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 12
--SET @DaysNumb =24
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =25
SET @ListName ='Спиридон, Александр, Разумник, Ферапонт'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 12
--SET @DaysNumb =25
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =26
SET @ListName ='Евстратий, Авксентий, Евгений, Мардарий, Орест, Александр, Иоанн, Владимир, Иаков, Алексий, Григорий, Николай, Емилиан, Василий, Арсений, Аркадий, Мардарий'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =26
SET @ListName ='Аза, Анастасия, Элеонора, Лукия'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =27
SET @ListName ='Фирс, Левкий, Каллиник, Филимон, Аполлоний, Ариан, Феотих, Николай, Вассиан'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 12
--SET @DaysNumb =27
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =28
SET @ListName ='Елевферий, Корив, Павел, Стефан, Иларион, Александр, Василий, Викторин, Елевферий, Пард, Трифон'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =28
SET @ListName ='Анфия, Иванна, Сусанна'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =29
SET @ListName ='Аггей, Владимир, Аркадий, Илия, Павел, Феодосий, Александр, Макарий, Петр, Марин'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =29
SET @ListName ='Соломония, Софья, Феофания'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =30
SET @ListName ='Даниил, Анания, Азарий, Мисаил, Александр, Николай, Сергий, Петр, Иоанн'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 12
--SET @DaysNumb =30
--SET @ListName =''
--SET @Sex = 'Ж'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =31
SET @ListName ='Севастиан, Никокострат, Касторий, Транквиллин, Маркеллин, Марк, Клавдий, Симфориан, Викторин, Тивуртий, Кастул, Виктор, Фаддей, Николай, Илия, Иоанн, Владимир, Николай, Сергий, Модест, Флор, Михаил, Симеон'
SET @Sex = 'М' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =31
SET @ListName ='Елизавета, Зоя, Софья'
SET @Sex = 'Ж'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex
