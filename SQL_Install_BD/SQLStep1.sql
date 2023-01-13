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
-- Description:	������� ��������� ����� �� ���� ������
-- �� ������������ �������
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
	 
    --����������� ���� ������
    DECLARE @IdDay INT
    DECLARE @CountData SMALLINT
    SET @CountData = (SELECT COUNT(*) from[dbo].[DaysOfYears]  where NumbOfMonth = @MonthNumb and NumbOfDay = @DaysNumb)
    IF @CountData = 0
     BEGIN
       INSERT INTO [dbo].[DaysOfYears](NumboFMonth, NumbOfDay) VALUES(@MonthNumb, @DaysNumb)
       SET @IdDay = (SELECT @@IDENTITY) 
     END
     ELSE SET @IdDay = (SELECT [DaysOfYearsId] FROM [dbo].[DaysOfYears] WHERE NumbOfMonth = @MonthNumb AND NumbOfDay = @DaysNumb)
     
     --���
     DECLARE @NamesId INT
     DECLARE @CountName SMALLINT
     SET @CountName = (SELECT COUNT(*) FROM dbo.Names WHERE UPPER(Name) = UPPER(@Name) AND UPPER(Sex) = UPPER(@Sex))
     IF @CountName = 0
      BEGIN
       INSERT INTO dbo.Names(Name, Sex) VALUES(@Name, @Sex)
       SET @NamesId = (SELECT @@IDENTITY)
      END
      ELSE SET @NamesId = (SELECT NamesId FROM dbo.Names WHERE UPPER(Name) = UPPER(@Name) AND UPPER(Sex) = UPPER(@Sex))
     
     --������� ������������
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
-- Description:	��������� �������. ����������� ","
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
DECLARE @ListName VARCHAR(1500) --����������� ","
DECLARE @Sex char(1)

--####################################################
-- ������
--####################################################

SET @MonthNumb = 1
SET @DaysNumb =1
SET @ListName ='����, ���������, ��������, �������, ����, ��������, ����, �������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =1
SET @ListName ='�������, ������������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =2
SET @ListName ='������, ������, ����, �������, ���������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =2
SET @ListName ='�������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =3
SET @ListName ='�������, ϸ��, ��������, ���������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =3
SET @ListName ='���������, ��������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =4
SET @ListName ='����, ��������, ����, ��������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =4
SET @ListName ='���������, ��������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =5
SET @ListName ='��������, �������, �������, �����, �������, ��������, �����, �����, ����, ������, �����, ������, ��������, ������, ��������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 1
--SET @DaysNumb =5
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =6
SET @ListName ='������, �����, �������, �������, ������, �������, ����, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =6
SET @ListName ='������, �������, �������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 1
--SET @DaysNumb =7
--SET @ListName =''
--SET @Sex = '�' 
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 1
--SET @DaysNumb =7
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =8
SET @ListName ='�������, ����, ����������, ����������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 1
--SET @DaysNumb =8
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =9
SET @ListName ='����, ������, Ը���, ��������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 1
--SET @DaysNumb =9
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =10
SET @ListName ='��������, ��������, �������, ����, �����, �������, �����, ��������, ��������, �������, ���������, ϸ��, ������, �����, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =10
SET @ListName ='������, �����, �������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =11
SET @ListName ='��������, ��������, �������, ����, ����, �������, ������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 1
--SET @DaysNumb =11
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =12
SET @ListName ='�����, �����, ���, �����, ���, �����, �����, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =12
SET @ListName ='�����, �������, ��������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =13
SET @ListName ='���, �������, ������, ����������, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =13
SET @ListName ='�������, ����, �����������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =14
SET @ListName ='�������, ��������, ϸ��, �����, ��������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =14
SET @ListName ='������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =15
SET @ListName ='������, ������, ����, ������, ϸ��, �������, ������, ���������, ������, �������, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =15
SET @ListName ='��������, �������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =16
SET @ListName ='������, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =16
SET @ListName ='�����, �����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =17
SET @ListName ='����, ���������, �����, ������, ������, ��������, ������, �������, �������, ��������, ���������, �������, ������, ��������, ��������, �����, �������, ���, �����, ����, ��������, �������, ���������, ������, �����, ���, �����, ����, ������, �����, �������, ����, �����, ������, ����, �������, ������, ���������, ��������, �����, ���, ����, �����, ����, �������, �������, �����, ��������, �������, ������, ������, ���, ������, ������, ���, ����, ����, �������, ��������, ������, ������, ������, ������, �����, �������, ���, �����, ������, ��������, �����, ������, ��������, �������, ������, �������, �������, ��������, �������, ���, ����, ����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =17
SET @ListName ='������, ����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =18
SET @ListName ='��������, ������, ����, �����, �����, ����, �����, �����, �������, ����, ��������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =18
SET @ListName ='�����������, �����������, �������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 1
--SET @DaysNumb =19
--SET @ListName =''
--SET @Sex = '�' 
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 1
--SET @DaysNumb =19
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =20
SET @ListName ='��������, ����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 1
--SET @DaysNumb =20
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =21
SET @ListName ='���������, �����, �����, �������, ��������, �������, �������, �����, ����, ������, ��������, �������, ���, ������, ��������, ������, �������, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =21
SET @ListName ='��������, �����, ������, ����������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =22
SET @ListName ='�������, �����, �������, �����������, ϸ��, ��������, �����, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =22
SET @ListName ='��������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =23
SET @ListName ='�������, ��������, ��������, �����, �������, �����, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =23
SET @ListName ='������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =24
SET @ListName ='����, �����, ������, �����, ������, ��������, Ը���, ��������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =24
SET @ListName ='���������, �������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =25
SET @ListName ='���������, ������, �����, ���������, ������, ϸ��, �����, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =25
SET @ListName ='���������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =26
SET @ListName ='��������, ����������, ������, �����, �������, ����, ����, ����, ������, �������, �������, �������, �����, ϸ��, ���������, ����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 1
--SET @DaysNumb =26
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =27
SET @ListName ='����, ������, ��������, ��������, �������, �����, �������, ������, ����, �����, ������, �������, ����, �����, ����, �������, ������, �����, �����, ��������, �����, �����, ������, ������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =27
SET @ListName ='�����, ����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =28
SET @ListName ='�������, �������, �������, ����, ����, �����, ��������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =28
SET @ListName ='�����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =29
SET @ListName ='����������, ������, �����, ��������, ������, ���������, ����, ϸ��, ��������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =29
SET @ListName ='�������, ��������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =30
SET @ListName ='�����, �����, �������, ����, ��������, ��������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =30
SET @ListName ='��������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =31
SET @ListName ='��������, ��������, �������, �����, �������, ������, ������, ������, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 1
SET @DaysNumb =31
SET @ListName ='������, ��������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--####################################################
-- �������
--####################################################
SET @MonthNumb = 2
SET @DaysNumb =1
SET @ListName ='�������, ��������, �����, ����, �������, �����, Ը���, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =1
SET @ListName ='��������, �����, ��������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =2
SET @ListName ='�������, ����, �������, �������, ����, �����, ���������, ���, �����, ����, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 2
--SET @DaysNumb =2
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =3
SET @ListName ='���������, ��������, �������, ����, ������, ������, ������, ��������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =3
SET @ListName ='�����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =4
SET @ListName ='������, ������, ���������, �������, �������, ����, �����, �����, �������, �����, ������, �����, ϸ��, ������, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 2
--SET @DaysNumb =4
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =5
SET @ListName ='���������, ��������, �������, �������, �������, ������, �������, Ը���, ��������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 2
--SET @DaysNumb =5
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =6
SET @ListName ='����, ���������, ������, �������, �����, ������, ����, �������, �����, ��������, �������, ���������, ��������, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =6
SET @ListName ='������, ����������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =7
SET @ListName ='���������, ���������, �������, �������, ��������, ��������, ���, �������, �������, ������, ������, �������, ������, ������, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =7
SET @ListName ='��������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =8
SET @ListName ='�������, ������, �������, �������, �����, ����, �����, �������, ���������, ϸ��, ����, Ը���'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =8
SET @ListName ='�����, ����, �����, �����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =9
SET @ListName ='��������, ��������, ����, ϸ��, ����������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 2
--SET @DaysNumb =9
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =10
SET @ListName ='�������, �����, �������, ��������, ��������, ��������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =10
SET @ListName ='�����, ��������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =11
SET @ListName ='����, ������, �������, ��������, �������, ����, ��������, ���������, ����, �����, ���������, �������, �����, �������, ������, �������, �����, ����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =11
SET @ListName ='������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =12
SET @ListName ='�������, �������, �������, ��������, �������, ���, �����, ����, �������, ��������, ����, �����, �������, ������, ����, ������, ����, ��������, �������, ϸ��, ������, �����, ��������, ������, Ը���, ������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 2
--SET @DaysNumb =12
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =13
SET @ListName ='��������, ������, ��������, ������, ����, ����, ���, �������, ������, �������, �����, ��������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =13
SET @ListName ='��������, ��������, �������, ��������, ���������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =14
SET @ListName ='���������, �������, ���������, �����, ������, ϸ��, �������, �����, ��������, ������, ����, �������, ������, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =14
SET @ListName ='��������, ����������, �������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =15
SET @ListName ='��������, �������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 2
--SET @DaysNumb =15
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =16
SET @ListName ='������, ������, ����, �������, ������, ��������, �����, ��������, �������, �������, �����, �����, ���������, ����, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =16
SET @ListName ='����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =17
SET @ListName ='��������, �������, �����, �����, ����, �����, ������, ������, ������, �������, �������, ��������, ����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =17
SET @ListName ='����������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =18
SET @ListName ='�����, �������, �����, ��������, ��������, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =18
SET @ListName ='������, ��������, ��������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =19
SET @ListName ='����������, �������, �����, �������, ����, ��������, ������, ���������, ������, �����, ������, �����, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =19
SET @ListName ='�������, �����, �����, ��������, ��������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =20
SET @ListName ='����, ������, ϸ��'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 2
--SET @DaysNumb =20
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =21
SET @ListName ='�����, �����, �������, ������, ��������, �����, ������, Ը���, ���������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 2
--SET @DaysNumb =21
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex


SET @MonthNumb = 2
SET @DaysNumb =22
SET @ListName ='��������, ����������, �������, �������, �������, ϸ��, ��������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =22
SET @ListName ='��������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =23
SET @ListName ='�����, �������,  ������, �������, �������, ��������, ������, ��������, ����, ������, ����, ����, ������, ����, ��������, �����, ��������, ������, ����, ���������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =23
SET @ListName ='����, ���������, ������, �����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =24
SET @ListName ='����, ��������, �������, ��������, �����, ��������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =24
SET @ListName ='�������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =25
SET @ListName ='�������, �����, �������, �������, �����, �������, ������, ��������, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =25
SET @ListName ='����������, �����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =26
SET @ListName ='�������, ������, �������, ������, ���������, �������, ����, ������, �������, ��������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =26
SET @ListName ='���, ���������, �������� �������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =27
SET @ListName ='���������, ��������, �������, �������, ������, �����, �������, ������, Ը���, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 2
--SET @DaysNumb =27
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =28
SET @ListName ='�������, ��������, ������, �������, �����, ������, ��������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =28
SET @ListName ='���������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 2
SET @DaysNumb =29
SET @ListName ='����, ��������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 2
--SET @DaysNumb =29
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex


--####################################################
-- ����
--####################################################
SET @MonthNumb = 3
SET @DaysNumb =1
SET @ListName ='������, ������, ������, ������, ����, �����, �����, �����, ������, ������, ��������, ������, �������, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 3
--SET @DaysNumb =1
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =2
SET @ListName ='��������, ����, �������, ����, �����, ��������, �����, Ը���, ��������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex


SET @MonthNumb = 3
SET @DaysNumb =2
SET @ListName ='��������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =3
SET @ListName ='������, �������, �������, ������, �������, ������, ���, ���������, ������, ������, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 3
--SET @DaysNumb =3
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =4
SET @ListName ='������, �������, �������, ������, �������, �����, �����, ������, ������, ������, �����, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =4
SET @ListName ='�����, �������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =5
SET @ListName ='������, �����, ��������, ������, ������, ��������, ���, ������, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =5
SET @ListName ='�����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =6
SET @ListName ='�������, ��������, �����, ����, �������, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 3
--SET @DaysNumb =6
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =7
SET @ListName ='��������, ������, �������, ��������, ������, ��������, ��������, ���, ��������, Ը���, ������, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =7
SET @ListName ='������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =8
SET @ListName ='���������, ������, �������, ������, �����, ����, �������, ������, ������, ������, ��������, ����������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =8
SET @ListName ='���'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =9
SET @ListName ='����, �������, ������, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =9
SET @ListName =''
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =10
SET @ListName ='�����, �������, ��������, �����, Ը���'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 3
--SET @DaysNumb =10
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =11
SET @ListName ='����, �������, ��������, ���������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =11
SET @ListName ='������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =12
SET @ListName ='�������, ������, �����, �������, ��������, ������, �������, ���, �������, �����, ����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =12
SET @ListName ='��������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =13
SET @ListName ='�������, �������, �������, �������, ������, �������, ������, ��������, �������, ������, ����������, ��������, ����, ������, ���, ������, ����������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =13
SET @ListName ='����, ������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =14
SET @ListName ='����, �����, �������, ��������, ������, ���������, �������, ���������, ������, ��������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =14
SET @ListName ='��������, �������, �������, ��������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =15
SET @ListName ='������, �������, ��������, ����������, �������, �������, �������, �����, �����, ��������, �������, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =15
SET @ListName ='�������, �����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =16
SET @ListName ='��������, ��������, �����, ����, �������, �����, ���������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 3
--SET @DaysNumb =16
--SET @ListName = ''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =17
SET @ListName ='������, �������, ��������, �������, �������, ��������, ������, �����, ���������, �����, ���������, ����, ����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =17
SET @ListName ='��������, �������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =18
SET @ListName ='������, �������, �������, �����, ��������, �������, ����, ������, ������, �����, ����������, ����, ������, Ը���, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =18
SET @ListName ='������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =19
SET @ListName ='�����, �������, �����, �����, �����, �������, �����, ���, �������, �����, ����������, ������, ��������, �����, Ը���, ������, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 3
--SET @DaysNumb =19
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =20
SET @ListName ='��������, �������, �������, �������, �������, ������, �����, �������, ���������, ������, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =20
SET @ListName ='����������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =21
SET @ListName ='��������, ��������, ����, ���, ������, ��������, ��������, ���������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 3
--SET @DaysNumb =21
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =22
SET @ListName ='������, ������, ���������, �����, ��������, �����, ������, �������, ���, ��������, ��������, ������, �������, �����, ����, �����, ����, �������, ������, ������, ������, ������, ������, �������, �������, �������, �������, �������, �������, �����, ��������, ��������, �������, �������, �����, ��������, ������, ������, ����������, ������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =22
SET @ListName ='������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =23
SET @ListName ='�����, ������, ��������, �������, �����, ������, �������, �������, ���������, ��������, �����, ������, ����, �������, ������, �������, �����, �����, �������, ��������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =23
SET @ListName ='���������, ��������, ������, ����, �������, �������, ��������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =24
SET @ListName ='�������, ������, ����, ����, ���, �������, ��������, ������, �������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =24
SET @ListName ='�����, ������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =25
SET @ListName ='��������, ����, ������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =25
SET @ListName ='�����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =26
SET @ListName ='���������, ����, �������, �������, ������, �����, ��������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =26
SET @ListName ='��������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =27
SET @ListName ='��������, ��������, ������, ���������, ��������, ��������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =27
SET @ListName ='��������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =28
SET @ListName ='����, ���������, �����, �������, ������, �������, ������, �����, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =28
SET @ListName ='�����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =29
SET @ListName ='���������, ���������, �����, �������, ����, �����, �����, �����, �����, ��������, ������, ���, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 3
--SET @DaysNumb =29
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =30
SET @ListName ='�������, �����, �����, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 3
--SET @DaysNumb =30
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =31
SET @ListName ='����, ������, ��������, ������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 3
SET @DaysNumb =31
SET @ListName ='��������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex


--####################################################
-- ������
--####################################################

SET @MonthNumb = 4
SET @DaysNumb =1
SET @ListName ='�������, �������, �����, ����, ������, ������, �����, ��������, ����������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =1
SET @ListName ='�����, �����, ������, �����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =2
SET @ListName ='�����, �����, ������, ��������, �������, ������, �����, ���������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =2
SET @ListName ='����������, ��������, �������, ��������, ������, ��������, �������, �����, �������, ���������, ��������, ��������, ������, ������, �������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =3
SET @ListName ='�����, �������, ��������, ������, ����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 4
--SET @DaysNumb =3
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =4
SET @ListName ='�������, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =4
SET @ListName ='�������, �����������, ��������, �����, �������, ����������, ������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =5
SET @ListName ='�����, �������, �������, ������,  �������, ������, �����, �������, ���������, ������, ���������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =5
SET @ListName ='�����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =6
SET @ListName ='��������, �����, �������, �������, ������, ����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 4
--SET @DaysNumb =6
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =7
SET @ListName ='������, �����, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 4
--SET @DaysNumb =7
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =8
SET @ListName ='�������, �������, ����, ������, ����, ���, ����, ��������, �����, ����, �����, �������, ������, ����, ����, ����, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =8
SET @ListName ='����, ��������, ����, �����, �������, ������, ������, �����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =9
SET @ListName ='������, ������, ��������, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =9
SET @ListName ='�������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =10
SET @ListName ='�������, ������, �������, �������, �����, ����, ���������, ������, �����, �����, ����, ��� , ����, ������, �����, ����, ���������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =10
SET @ListName ='������, ��������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =11
SET @ListName ='����, ������, ������, �����, ��������, ����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 4
--SET @DaysNumb =11
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =12
SET @ListName ='�����, ��������, ����, ������, �������, ����, ������, ���������, ������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 4
--SET @DaysNumb =12
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =13
SET @ListName ='������, ����, ����������, �����, ���������, ����, ��������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =13
SET @ListName ='��������, ����, ���'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =14
SET @ListName ='�������, ����������, ������, ��������, �������, �������, ��������, ����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =14
SET @ListName ='�����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =15
SET @ListName ='���, ������, ������, ��������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 4
--SET @DaysNumb =15
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =16
SET @ListName ='������, ���������, ���, �������, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =16
SET @ListName ='��������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =17
SET @ListName ='�����, �������, ��������, �������, �������, �����, �����, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =17
SET @ListName ='�����, �������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =18
SET @ListName ='���, ��������, �����, ������, �������, �������, ������, �����, ������, ������, ����, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 4
--SET @DaysNumb =18
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =19
SET @ListName ='�������, �������, �����, �����, ���������, �������, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =19
SET @ListName ='���������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =20
SET @ListName ='�������, �������, ���������, �����, ������, ��������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =20
SET @ListName ='�������, ��������, �������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =21
SET @ListName ='�������, ����, ��������, ���, �������, ���, ������, �������, ��������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 4
--SET @DaysNumb =21
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =22
SET @ListName ='��������, �������, ������, ������, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 4
--SET @DaysNumb =22
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =23
SET @ListName ='��������, ������, �������, ������, �����, ���������, ������, �������, ��������, �����, ������, �������, ��������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 4
--SET @DaysNumb =23
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =24
SET @ListName ='������, ����, ������, �������, �������, ���������, ��������, �����, ��������, �����, ����������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 4
--SET @DaysNumb =24
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =25
SET @ListName ='�������, ������, �����, �����, ����, �����, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =25
SET @ListName ='������, ��������, ������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =26
SET @ListName ='�������, ��������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =26
SET @ListName ='�����, �������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =27
SET @ListName ='������, ���������, �������, �����, ��������, ��������, ����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =27
SET @ListName ='��������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =28
SET @ListName ='��������, ���, ������, ���������, �����, ������, ���������, ������, ��������, ��������, ������, �������, ������, ��������, ���������, ��������, �����, ����, ������, ������, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =28
SET @ListName ='���������, ��������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =29
SET @ListName ='������ , ������ , ����� , ������� '
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =29
SET @ListName ='������, ��������, ������, �����, ������, ����, �������, ��������, ������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =30
SET @ListName ='������, �������, ������, ��������, �����, ����, ������, ������, ������, ������, ������, ������, ���������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 4
SET @DaysNumb =30
SET @ListName ='��������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex


--####################################################
-- ���
--####################################################

SET @MonthNumb = 5
SET @DaysNumb =1
SET @ListName ='�����, ��������, ���������, ������, �����, �����, �������, ��������, �����, ���������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =1
SET @ListName ='������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =2
SET @ListName ='�����, ������, �����, ���������, �������, �������, ������, ��������, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =2
SET @ListName ='�������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =3
SET @ListName ='������, ��������, ��������, ���������, ���������, �������, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =3
SET @ListName ='�����, �������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =4
SET @ListName ='���������, ������, ������, �����, �������, �������, ������, �������, ������, ��������, �������, �����, �������, ������, �������, ������, ���������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =4
SET @ListName ='������, �������, ��������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =5
SET @ListName ='������, ��������, ��������, ��������, ����, �������, �������, ��������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 5
--SET @DaysNumb =5
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =6
SET @ListName ='��������, �����, ��������, ���������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =6
SET @ListName ='����������, ������,  �������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =7
SET @ListName ='�����, ������, ��������, ��������, �������, ����, �������, ������, ����, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =7
SET @ListName ='���������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =8
SET @ListName ='����, ������, ���������, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =8
SET @ListName ='���, ����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =9
SET @ListName ='�������, ������, �����, �������, ����, ���������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =9
SET @ListName ='�������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =10
SET @ListName ='������, �����, �����, ����, �������, ���������, ������, �������, �������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =10
SET @ListName ='���������, �����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =11
SET @ListName ='�����, ��������, ����, ������, ����������, ��������, ��������, ��������, ���������, ��������, ��������, ������, �����, �����, �������, ����, �������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =11
SET @ListName ='����, �������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =12
SET @ListName ='�������, ���, ��������, �������, ������, ����, ������, ��������, �������, ������, ��������, ������, ��������, �������, ���������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 5
--SET @DaysNumb =12
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =13
SET @ListName ='�����, ������, �������, �����, �������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 5
--SET @DaysNumb =13
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =14
SET @ListName ='�������, ��������, ����,  �������, �������, �������, �������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =14
SET @ListName ='������, ����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =15
SET @ListName ='��������, �����, ����, �����, ������, ������, ��������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =15
SET @ListName ='���'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =16
SET @ListName ='�������, ��������, �������, ����, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =16
SET @ListName ='��������, �����,  ���������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =17
SET @ListName ='�����, �������, �����, �������, �������, ������, ������, �������, �������, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =17
SET @ListName ='�����, �������, �������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =18
SET @ListName ='�����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =18
SET @ListName ='�����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =19
SET @ListName ='���, ������, ����, ��������, ��������, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 5
--SET @DaysNumb =19
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =20
SET @ListName ='������, �����, ����, �������, �����, �����, ������, ���, �����, ������, ������, ����, ������, ���, ���'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =20
SET @ListName ='��������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =21
SET @ListName ='�����, �������, �������, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 5
--SET @DaysNumb =21
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =22
SET @ListName ='�����, ���������, �������, �����, ��������, �������, ���'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =22
SET @ListName ='�������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =23
SET @ListName ='�����, �����, ���������, �������, ������, �����, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =23
SET @ListName ='������, �������, ������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =24
SET @ListName ='�����, �������, ������, ���������, ������, ���������, ��������, �������, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 5
--SET @DaysNumb =24
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =25
SET @ListName ='��������, ������, �������, ����, �����, �������, ��������, �����, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =25
SET @ListName ='���������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =26
SET @ListName ='��������, �������, ���������, ���������, �������, ����������, ������, �������, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =26
SET @ListName ='��������, �����, ��������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =27
SET @ListName ='������, ����, ������, ��������, ������, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 5
--SET @DaysNumb =27
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =28
SET @ListName ='�������, �����, ��������, �������, ��������, ��������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =28
SET @ListName ='���������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =29
SET @ListName ='������, �����, ���������, ���, ������, ����������, �������, �������, ���������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =29
SET @ListName ='����������, ����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =30
SET @ListName ='��������, �������, ��������, ��������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =30
SET @ListName ='�������, ���������, ��������, ����, �����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =31
SET @ListName ='������, ����, ��������, ������, �����, �����, �������, ������, �������, ������, �����, ��������, �����, �������, �������, ������, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 5
SET @DaysNumb =31
SET @ListName ='����������, ��������, ��������, �������, �������, �������, ������, �����, ��������, �������� ,�����, ����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--####################################################
-- ����
--####################################################

SET @MonthNumb = 6
SET @DaysNumb =1
SET @ListName ='��������, ������, �������, ������, ��������, ��������, ������, �������, ��������, ���������, ������, ������, �������, �������, �������, ������, �����, �������, �������, ��������, �����, �����, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =1
SET @ListName ='���������, ���������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =2
SET @ListName ='�������, ���������, �������, �������, �������, �������, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =2
SET @ListName ='����, �������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =3
SET @ListName ='����������, ������, ������, ������, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =3
SET @ListName ='�����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =4
SET @ListName ='��������, �����-��������, �����, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =4
SET @ListName ='�����, ����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =5
SET @ListName ='�����, ������, �������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =5
SET @ListName ='���������, �����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =6
SET @ListName ='������, ������, �������, ������, �����, ��������, ��������, ������, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =6
SET @ListName ='��������, ��������, �����, �������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =7
SET @ListName ='�����, �������, ��������, ����������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 6
--SET @DaysNumb =7
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =8
SET @ListName ='����, �����, �������, �������, �����, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =8
SET @ListName ='�����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =9
SET @ListName ='��������, ���, �����,  �����, �������, �����, ����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =9
SET @ListName ='���������, �������, �����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =10
SET @ListName ='������, �������,  �������, ��������, ����, �������, �������, ���������, �������, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =10
SET @ListName ='���������, �������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =11
SET @ListName ='�����, ���, ������, ����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =11
SET @ListName ='�����, �����, ��������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =12
SET @ListName ='�������, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 6
--SET @DaysNumb =12
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =13
SET @ListName ='���, �����, �������, �����, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =13
SET @ListName ='����������, ��������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =14
SET @ListName ='������, �������, ��������, ������, ����, ��������, ��������, �����, �������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =14
SET @ListName ='������, ����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =15
SET @ListName ='�������, �������, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =15
SET @ListName ='�����, �������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =16
SET @ListName ='���������, �������, ������, �����, ��������, �������, ������, ������, �������, ������, ���������, ��������, ��������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =16
SET @ListName ='�����, �������, �����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =17
SET @ListName ='��������, ����, �������, ���������, �������, ��������, �����, ���������, �����, ������, ���������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =17
SET @ListName ='�����, �����, �����, �����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =18
SET @ListName ='�������, ������, �������, �������, �������, ��������, �������, ������, ����, �������, ������, ������, ������, ������, �����, ����������, �������, ����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 6
--SET @DaysNumb =18
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =19
SET @ListName ='���������, �������, ������, �������, ����, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =19
SET @ListName ='�����, �������, ������ ������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =20
SET @ListName ='������, ��������, ���������, �������, ��������, ��������, ������, �����, ��������, �������, ���, ������, �������, ��������, ��������, ����, ����������, �������, �����, �������, �������, �������, ������, �������, ������, ��������, ��������, �����, ����, �����������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =20
SET @ListName ='�������, �������, ����, �������, �������, ��������, ������, �����, ���������, �������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =21
SET @ListName ='������, ������, ������, �������, ����������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =21
SET @ListName ='����, �������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =22
SET @ListName ='������, �������, ���������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =22
SET @ListName ='���������, �����, �����, ���������, Ը���'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =23
SET @ListName ='�������, �������, �����, �������, �����, ���������, ������, �������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =23
SET @ListName ='��������, ��������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =24
SET @ListName ='����������, �������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =24
SET @ListName ='�����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =25
SET @ListName ='�������, ����, �����, ������, ���������, ������, �������, ���������, ������, �������, ����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =25
SET @ListName ='����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =26
SET @ListName ='���������, ���������, ��������, �����, ��������, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =26
SET @ListName ='�������, ����, ��������, ����������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =27
SET @ListName ='������, �������, �����, �������, ���������, �����, ��������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =27
SET @ListName ='�������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =28
SET @ListName ='����, ����, ���, ������, ����, �������, ��������, ������, ������, ������, ��������, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =28
SET @ListName ='����������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =29
SET @ListName ='�����, ������, ������, ��������, ������, ������, ����, ����������, ������, ��������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =29
SET @ListName ='��������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =30
SET @ListName ='������, �����, ������, �������, �������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 6
SET @DaysNumb =30
SET @ListName ='�������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex


--####################################################
-- ����
--####################################################
SET @MonthNumb = 7
SET @DaysNumb =1
SET @ListName ='�������, ������, ������, �������, �������, ���������, ������ '
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =1
SET @ListName ='���������, ���������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =2
SET @ListName ='����, ���, �����, ������, ������, �����, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =2
SET @ListName ='����, �������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =3
SET @ListName ='�������, ����, ������, ����, �����, �����, ����������, ���������, ��������, ������, ����, �������, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =3
SET @ListName ='�����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex


SET @MonthNumb = 7
SET @DaysNumb =4
SET @ListName ='������, ������, �����, �������, �������, �����, �������, ����, ������, ��������, �����, �����, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =4
SET @ListName ='�����, ����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =5
SET @ListName ='�������, ��������, ������, �������, �����, ���� ���������, , ��������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =5
SET @ListName ='���������, �����, ��������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =6
SET @ListName =' ���������, �������, ����, ��������, ��������, ����, ������, ������, �����, �������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =6
SET @ListName ='���������,��������, ��������, �����, �������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =7
SET @ListName ='�����, �������, ��������, ����, ������, ������, ������, ������, �������, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 7
--SET @DaysNumb =7
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =8
SET @ListName ='����, �����, �������, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =8
SET @ListName ='��������,�����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =9
SET @ListName ='�����, �������, �����, ��������, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =9
SET @ListName ='���������, �����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =10
SET @ListName ='�������, ��������, ���������, ��������, ����, �����, �������, ������, ��������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =10
SET @ListName ='������, ���������, �������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =11
SET @ListName ='���, �����, ������, ������, �������, ��������, ���������, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =11
SET @ListName ='�����, �����, ��������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =12
SET @ListName ='����, �����, ��������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 7
--SET @DaysNumb =12
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =13
SET @ListName ='����, ������, �����, �����, ������, ����������, ����, ������, �����, ����, �����, ������, �������, ������, ��������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =13
SET @ListName ='����������, ��������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =14
SET @ListName ='�����, ������, �������, �������, �����, ����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =14
SET @ListName ='������, ��������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =15
SET @ListName ='���������, �����, �����, �������, �����, ������, ����, ��������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =15
SET @ListName ='�����, �������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =16
SET @ListName ='������, ������, �������, ���������, ������, ��������, �����������, �����, ����, ���������, ��������, �������, ����������, �����, ������, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =16
SET @ListName ='���������, �����, �������, �����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =17
SET @ListName ='������, ������, �������, �������,  ��������, ������,  ������, �������, �������, �����, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =17
SET @ListName ='����������, �����, �����, �����, �����, �������, ���������, ��������, �����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =18
SET @ListName ='��������, ������, ������, ������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =18
SET @ListName ='����, ���������, �������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =19
SET @ListName ='�����, �������, ������, �����, ��������, �������, �����, ��������, �������, �����, �����, ����������, ������, �����, �������, ��������, ���, �����, ����, �������, ������, ������, ����, ������, �������, ������, �����, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =19
SET @ListName ='�����, �������, �����, ������, �����, ��������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =20
SET @ListName ='����, ������, �����,  ��������, ������, ������, ������, �����, ��������, ������, �������, �������, ������, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =20
SET @ListName ='�������, �������, ����, �������, �������, �������, ��������, ������, �����, ���������, ��������, �������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =21
SET @ListName ='��������, ���������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =21
SET @ListName ='����, �������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =22
SET @ListName ='���������, ����������, ������, ����������, ������, ���������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =22
SET @ListName ='���������, �����, �����, ���������, Ը���'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =23
SET @ListName ='�������, ��������, ������, �������, ���������, �������, �������, �����, �������, �������, ����, ������, �������, ������, ���������, ������, ������, �������, ��������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =23
SET @ListName ='��������, ��������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =24
SET @ListName ='������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =24
SET @ListName ='�����, �������, �����, '
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =25
SET @ListName ='�����, ������, ������, �����, �������, ������, �������, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =25
SET @ListName ='����, ���������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =26
SET @ListName ='�������, ������, ������, ��������, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =26
SET @ListName ='�������, ����, ��������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =27
SET @ListName ='�����, ����������, �������, ����, ������, �����, ������, �������, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 7
--SET @DaysNumb =27
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =28
SET @ListName ='�����,  ��������, ����, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =28
SET @ListName ='�������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =29
SET @ListName ='��������, �����, ����, �����, ������, ��������, ������, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =29
SET @ListName ='��������, �������, ��������, ������, �����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =30
SET @ListName ='�������, ������, ������ '
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =30
SET @ListName ='������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 7
SET @DaysNumb =31
SET @ListName ='������, �������, �����������, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 7
--SET @DaysNumb =31
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex


--####################################################
-- ������
--####################################################
SET @MonthNumb = 8
SET @DaysNumb =1
SET @ListName =' ���, �������, �����, ������, ������, ��������, ��������, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =1
SET @ListName ='�������, ������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =2
SET @ListName ='����, ����������, �������, ���������, �������, ������, �����, ������, �����, �����, �������, ����, �������, �������, �������� '
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 8
--SET @DaysNumb =2
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =3
SET @ListName ='���������, ������, �����, ����, �������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =3
SET @ListName ='����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =4
SET @ListName ='����, ������, �������, ��������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =4
SET @ListName ='����, �����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =5
SET @ListName ='������, ������, ������, ������, ������, �����������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =5
SET @ListName ='����, ������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =6
SET @ListName ='�����, ����, �����, �������, �����, ��������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =6
SET @ListName ='��������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =7
SET @ListName ='���������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =7
SET @ListName ='����, ��������, ���������, ���������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =8
SET @ListName ='�������, ������, ��������, ������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =8
SET @ListName ='����������, ���������, ���������, �������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =9
SET @ListName ='�����������, ������, ��������, ������, �����, �������, ����, �����, �������, �������, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =9
SET @ListName ='������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =10
SET @ListName ='�����, ������, �������, �����, ������, �������, �������, �������, ������, ��������, ������, �����, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =10
SET @ListName ='��������, �������, �����,  �����, ������, ����� '
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =11
SET @ListName ='��������, �������, ��������, ��������, �������, �������, ��������, ������, ����������, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =11
SET @ListName ='��������, ��������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =12
SET @ListName ='����, ������, ��������, ������, ��������, �����, ��������, ����������, ��������, �����, ���������, ����, ����, �����, ������, �������, ������, ��������, ������, ����, ���������, �������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =12
SET @ListName ='�����, ��������, �����, �����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =13
SET @ListName ='�������, ��������, ������, ����, �����, ������, ��������, ����������, �������, �������, ��������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =13
SET @ListName ='����, ���������, �������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =14
SET @ListName ='����, �������, �����, �������, �������, ����, �������, �������, ��������, �������, �����, ���������, ������, ��������, ������, ������, �����, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =14
SET @ListName ='���������, �����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =15
SET @ListName ='������, �������, ��������, ����, �������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =15
SET @ListName ='���������, �������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =16
SET @ListName ='�������, �����, ������, �������, ��������, �������, ������, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =16
SET @ListName ='�������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =17
SET @ListName ='�����������, �������, ���������, �����, ��������, �������������, �������, ������, ������, ��������, ���������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =17
SET @ListName ='�����, �������, �����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =18
SET @ListName ='�������� �����, �����, �����, ������, ���, ��������, ���������, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =18
SET @ListName ='�����, ��������, �������, �����, �����,'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =19
SET @ListName ='���������, �������, �����, ��������, �������, ��������, ����, ��������, ������, �������, ����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 8
--SET @DaysNumb =19
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =20
SET @ListName ='��������, �������, ���������, ����, ������, �����, ��������, �������, ������, ��������, �������, �����, �������, ��, ��������, �������, ������, �����, ��������, '
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =20
SET @ListName ='�������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =21
SET @ListName ='�������, ������, ��������, ������, �����, �������, �������, �����, ��������, ���������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 8
--SET @DaysNumb =21
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =22
SET @ListName ='������, ����, ������, �������, �����, �����, �������, ��������, �����, ����, �������, ��������, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =22
SET @ListName ='�����, ���������, �����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =23
SET @ListName ='���������, �����, ����������, ������, �����, ��������, ��������, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =23
SET @ListName ='����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =24
SET @ListName ='����, ����, �������, ������, ���������, �����, ������, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =24
SET @ListName ='�����, ����������, �������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =25
SET @ListName ='�����, �������, �������, ������, ����, ��������, ������, �����, �������, �����, ���������, ������, �������, �������, ��������, �����, ��������, �������, �������, �����, ����, ���������, ������, �������, �������, ������, �������, ������, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 8
--SET @DaysNumb =25
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =26
SET @ListName ='������, �����, �����, �����, ����������, �������, �������, �����, �������, �������, �������, ������, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =26
SET @ListName ='�������, �����, ���������, ������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =27
SET @ListName ='�����, �������, ������, �������, ��������, �������, ���������, ������, ���������, �������, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =27
SET @ListName ='���, �������, ������, ��������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =28
SET @ListName ='���������, �������, ������, ����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =28
SET @ListName ='����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =29
SET @ListName ='������, ������, ���������, �����, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =29
SET @ListName ='����, ������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =30
SET @ListName ='�����, �����, �������, ��������, ����, ������, �������, �������, �����, �������, ������, ��������, �������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =30
SET @ListName ='����, �������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =31
SET @ListName ='����, ����, ��������, �������, ������, ���, ��������, ������, �������, �������, ��������, ������, �����, �������, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 8
SET @DaysNumb =31
SET @ListName ='�������, ��������, �������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex


--####################################################
-- ��������
--####################################################
SET @MonthNumb = 9
SET @DaysNumb =1
SET @ListName ='������, �������, �������, ������, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =1
SET @ListName ='Ը���'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =2
SET @ListName ='������, ��������, �����, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =2
SET @ListName ='�������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =3
SET @ListName ='������, �������, ������, ����, �������, ���������, �����, �������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =3
SET @ListName ='�����, ������, �����, ��������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =4
SET @ListName ='��������, �����, ���������, �������, ��������,�������, �������, �����, �������, ���������, ������, ������, �������, �������, ��������, ������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =4
SET @ListName ='������, ������, �������, �������, ����, �������, �������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =5
SET @ListName ='����, �����, �����, �������, �����, ������, �������, ���������, ��������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =5
SET @ListName ='���������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =6
SET @ListName ='�������, �����, ����, �������, ������, , �������, �����, �������, ����������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =6
SET @ListName ='����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =7
SET @ListName ='����������, ���, ������, ��������, ������, �������, ��������, ����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =7
SET @ListName ='������, �����������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =8
SET @ListName ='������, ����, �������, ������, ��������, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =8
SET @ListName ='�����,�������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =9
SET @ListName ='�����, ������, ������, �����, �������, ���������, ��������, ��������, ����, �������, �����, �����, �����, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =9
SET @ListName ='������, ������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex



SET @MonthNumb = 9
SET @DaysNumb =10
SET @ListName ='������, �����, ���, ������, ���������, �������, ��������, �������, ������, �������, �������, �����, �������, ���, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =10
SET @ListName ='����, ������, �������, �������, ��������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =11
SET @ListName ='�����, ��'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 9
--SET @DaysNumb =11
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =12
SET @ListName ='���������, �����, �����, ������, ����, ������, �������, ���������, ������, �����, �������, ��������, �����, �������, ���������, �����, ��������, �������, �������, ��������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =12
SET @ListName ='���������, ��������, ������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =13
SET @ListName ='���������, ��������, ������, �����, ��������, �������, ��������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 9
--SET @DaysNumb =13
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =14
SET @ListName ='������, �����, �����, �����, ����, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =14
SET @ListName ='��������, ���������, �������, �������, �����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =15
SET @ListName ='������, ������, �����, �������, ��������, ����������, ��������, �������, ������, ������, �������, ��������, ������, �������, ����, ������, ������, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =15
SET @ListName ='������, ������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =16
SET @ListName ='�����, ������, �������, ��������, ��������, ����, �����, ��������, �����, �������, ��������, �����, �����, ������, �������, ������, ��������, �������, ��������, ������, ������, ������, �������, �����, �������, ����, ���������, ��������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =16
SET @ListName ='��������, ���������, �����, ����, �����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =17
SET @ListName ='������, ������, �����, ���������, ���������, ��������, �����, ��������, ��������, �����, �����, �������, ���������, ����, ����, ������, ������, ����, ������, ����, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =17
SET @ListName ='�������, �����, ��������, ����������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =18
SET @ListName ='�������, ��������, �������, �������, ������, ��������, ������, �����, ������, ������, �����, ����, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =18
SET @ListName ='�����, ���������, ������, �����, �����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =19
SET @ListName ='������, ��������, �����, �������, ��������, ����������, �����, ��������, �����, ������, ������, �����, ����, ������, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =19
SET @ListName ='������, ��������, Ը���'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =20
SET @ListName ='������, �����, �������, ����, ������, ���������, �������, ������, �������, �������, ��������, �������, ���, ����, ��������, ��������, ����, ���������, ������, ��������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 9
--SET @DaysNumb =20
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =21
SET @ListName ='�����, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =21
SET @ListName ='�����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =22
SET @ListName ='������, ��������, �����, ��������, ��������, ���������, �������, �������, ������, �������, ��������, ��������, �������, �������, ������, ������, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =22
SET @ListName ='����, ����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =23
SET @ListName ='��������, ������, �������, �����, ����������, ����, �������, ����, �������, ��������, �������, �������, ������, ���, �������, �����, �������, ��������, �����, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =23
SET @ListName ='��������, ���������, ���������, �������, ���������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =24
SET @ListName ='������, ������, ������, �������, ������, ����, ��������, �������, ���������, ��������, ������, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =24
SET @ListName ='��,  �������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =25
SET @ListName ='�������, ��������, ������, �����, �������, �������, ������, ������, �������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 9
--SET @DaysNumb =25
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =26
SET @ListName ='��������, ������, ���������, �������, ������, �������, ��������, ������, ���������, ��������, �������, ����, �����, ������, ��������, ������, ����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =26
SET @ListName ='��������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =27
SET @ListName ='�����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 9
--SET @DaysNumb =27
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =28
SET @ListName ='������, �����, ������, ��������, �������, ��������, �����, ����, �������, ������, ������, ������, ��������, ������, �����, �������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =28
SET @ListName ='��������, ����������, �������, �����, �������, ��������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =29
SET @ListName ='�����, ��������, ������, �������, ������, ������, �������, �����, �����, �������, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =29
SET @ListName ='�������, ��������, �������, ����������,'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =30
SET @ListName ='�����, ��������, �������, �������, �����, �����, ���, �����, ����������, ����, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 9
SET @DaysNumb =30
SET @ListName ='���������, ����, ������, �������, �����, �����, ����������, ��������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex


--####################################################
-- �������
--####################################################

SET @MonthNumb = 10
SET @DaysNumb =1
SET @ListName ='�������, �������, �������, ����, ���������, �����, �����, ������, ��������, ��������, ����������, ������, �������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =1
SET @ListName ='�������, ���������, �����, �����, ������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =2
SET @ListName ='������, ��������, ������, �����, ����������, �������, �������, ���, ������, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =2
SET @ListName ='�����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =3
SET @ListName ='��������, ������, �������, ������, �����, ��������, ���������, ����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =3
SET @ListName ='�������, ���������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =4
SET @ListName ='������, ��������, ���������, �������, ����������, �����, ��������, �������, ��������, ��������, ������, ����, �������, ������, �����, �������, �������, �������, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =4
SET @ListName ='�����, �����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =5
SET @ListName ='����, ����, ������, ������,  ��������, ����, �������, ��������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =5
SET @ListName ='���������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =6
SET @ListName ='����������, �����, ������, ����, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =6
SET @ListName ='������, ����������, ���������, ������, �������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =7
SET @ListName ='�������, ������, �����, �������, ������, ��������, �������, ������, ������, ���������, ���������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =7
SET @ListName ='Ը���'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =8
SET @ListName ='������, �������, ��������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =8
SET @ListName ='���������, �����, �����, ��������, �������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =9
SET @ListName ='�����, �����, ��������, ���������, ��������, �������, ��������, ������, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =9
SET @ListName ='����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =10
SET @ListName ='����������, ��������, ����, ��������, ������, ������, ������, ����, ��������, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =10
SET @ListName ='�������, �������, ��������, �������, ��������, ����, ��������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =11
SET @ListName ='�������, ������, ������, �������, �����, ���������, �����, ������, ����, �����, ����, �������, ��������, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =11
SET @ListName ='����, �����, �������, �������, �������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =12
SET @ListName ='������, �����, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =12
SET @ListName ='��������, ������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =13
SET @ListName ='��������, ������, ��������, ����, ��������, ������, �������, ���������, �������, �������, ������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =13
SET @ListName ='����������, �����������, �������, �����, ��������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =14
SET @ListName ='������, �����, �����, �������, ������, ���������, �������, �������, �����, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =14
SET @ListName ='����, ���������, ��������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =15
SET @ListName ='�������, ��������, ������, ������, �����, ����������, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =15
SET @ListName ='����, ����������, �������, ����, ������, ������, �������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =16
SET @ListName ='��������, ������, ���������, ���������, �����, ������, ��������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =16
SET @ListName ='��������, ������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =17
SET @ListName ='�������, �����, ����������, ��������, �������, ������, �����, �����, �������, ����, �����, �������, �������, ����, ������, �����, �����, ��������, �������, ������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =17
SET @ListName ='�������, �������, �����������, ��������, ���������, ������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =18
SET @ListName ='����, �������, ����, �������, ������, ���, �������, �����, �������, ����������, �������, ��������, ��������, ������, �������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =18
SET @ListName ='��������, ��������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =19
SET @ListName ='����, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =19
SET @ListName ='��������, �����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =20
SET @ListName ='������, ����, �������, ������, �������, ����������, ���������, ����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =20
SET @ListName ='�������, �����, �������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =21
SET @ListName ='��������, �����, ��������, �������, �������,  ����, �������, ����, �������, �����, ��������, ������,  �������, �������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =21
SET @ListName ='�������, �������, �����, �������, ���������, ��������, ������, ������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =22
SET @ListName ='�����, ��������, ����������, ����, ������, ���, ��������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =22
SET @ListName ='��������, ������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =23
SET @ListName ='��������, ��������, ����������, �������, �������, ������, ���������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =23
SET @ListName ='��������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =24
SET @ListName ='������, ������, ���, �������, ������, �������, �������, ��������, ��������, �������, �����, ����������, ��������, �����, �������, ���������, ���������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =24
SET @ListName ='�������, ���������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =25
SET @ListName ='����, �����, ��������, �����, �����, ���������, ���������, �������, ������, ���������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =25
SET @ListName ='�����, �����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =26
SET @ListName ='����, ������, ��������, ����������, �������, ���������, ��������, ������, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =26
SET @ListName ='���������, �����, ������, �����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =27
SET @ListName ='�������, ��������, ��������, ������,  ������, ����, �����������, �������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =27
SET @ListName ='���������, ���������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =28
SET @ListName ='�������, ������, ������, ��������, ��������, ������, �����, ����� '
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =28
SET @ListName ='�����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =29
SET @ListName ='������, �������, �������, �������, ����� '
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =29
SET @ListName ='�����, ���������, ���������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =30
SET @ListName ='����, ������, ������, ��������, ������, �������, ���������, �����, ������, �������, �����, ��������, ������, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 10
--SET @DaysNumb =30
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =31
SET @ListName ='����, �����, ������, ������, �������, �����, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 10
SET @DaysNumb =31
SET @ListName ='�����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--####################################################
-- ������
--####################################################

SET @MonthNumb = 11
SET @DaysNumb =1
SET @ListName ='�����, ���, �����, ������, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =1
SET @ListName ='���������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =2
SET @ListName ='�������, �������, ������, ������, ������, ���������, ������, ����, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =2
SET @ListName ='�������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =3
SET @ListName ='�������, ������, �������, ��������, �������, �������, ������, ����������, ������, �������, ������, ��������, �������, �����, ���������, ��������, �������, ��������, ������, �������, ������, ����, �����, ������, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =3
SET @ListName ='���, �������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =4
SET @ListName ='�������, �����������, �������, ���������, ��������, �������, ����������, �����, �������, ��������, ���������, �������, ������, ����, �������, ��������, �������, '
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =4
SET @ListName ='����, ������, ��������, ���������, ���������, ����, ��������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =5
SET @ListName ='�����, �������, ��������, ���������, �������, ������, �������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =5
SET @ListName ='����������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =6
SET @ListName ='�����, ������, ���������, �������, �����, �������, ����, �������, �����, ������, ��������, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =6
SET @ListName ='�����������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =7
SET @ListName ='�������, ��������, ���������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =7
SET @ListName ='������, �������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =8
SET @ListName ='��������, ����, ��������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =8
SET @ListName ='�������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =9
SET @ListName ='������, ������, ������, ����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =9
SET @ListName ='��������, ����������, ��������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =10
SET @ListName ='��������, ������, ���, ������, ������, ���, ���, ������, �������, ���, ��������, �����, �������, ������, ������, ������, ������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =10
SET @ListName ='����, ���������, ��������, ���������, ���������, �������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =11
SET @ListName ='�������, �������, �����, ������, ����, ������, �����, �����, ������, �������, �������, �������, ������, �������, �������, ����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =11
SET @ListName ='������, ���������, ����, �����, ��������, ��������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =12
SET @ListName ='�������, ������, ������, ������, ����, ����, ������, �������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =12
SET @ListName ='���������, ��������, �����, �������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =13
SET @ListName ='������, ������, �����, �������, �������, ���������, ������, �����, ������, ��������, ���������, ������, �������, �������, ����, ��������, ��������, �����, ����������, ��������, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =13
SET @ListName ='�����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =14
SET @ListName ='�����, ������, ���������, ������, ��������, ����, �����, �����, ������������, �������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =14
SET @ListName ='���������, ��������, �������, ��������, �������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =15
SET @ListName ='�������, �������, �������, ���������, ����������, ����������, ������, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =15
SET @ListName ='�����, �������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =16
SET @ListName ='�������, �����, �����, �������, ����, ���������, ��������, ������, �������, ��������, �����, �����, �����, ������,  �����, ������, ��������, �������, ���������, ��������, �����������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =16
SET @ListName ='����, �������, ��������, ��������, ��������, ���������, ��������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =17
SET @ListName ='���������, �������, �����, �������, ���������, ������, ��������, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =17
SET @ListName ='�������, ����������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =18
SET @ListName ='���������, ����, �����, �������, ������, ���, ���, ����, �������, ��������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =18
SET @ListName ='���������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =19
SET @ListName ='�����, �������, ������, ��������, �������, �������, ����������, �������,  �������,  ����, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =19
SET @ListName ='����������, ��������, ���������, �������, �������, ��������, ��������, ����, ������'  
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =20
SET @ListName ='�����, ������, �������, ��������, ������, �������, ��������, ������, �����, ������, ������, �������, �����, ������, ��������, �������, ������, ��������, ��������, ���������, �������, ��������, ������, �������, ������, ���������, �������, �������, �������, �������, ������, ������, ������, ������, ���������, �������, �������, �����, �������, ������, �����, ��������, ������, �������, ��������,  �������, ������, ����, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =20
SET @ListName ='������������, �������, ���������' 
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =21
SET @ListName ='�������, ������, �����, ��������, ��������, ��������, ��������, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 11
--SET @DaysNumb =21
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =22
SET @ListName ='��������, ��������, ��������, ����������, ��������, ������, ������, ������, ����, �����, �������, ���������, �������, �����, ��������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =22
SET @ListName ='�������, ���������, ���������, ��������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =23
SET @ListName ='�����, �����, ������, ��������, �����, ������, ������, ���������, ��������, ��������, �����, ����, ��������, ���������, �������, �������, �������, ������, �������,  �����, �����, �����, ����������, ����������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =23
SET @ListName ='��������, �����, ���������, ����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =24
SET @ListName ='����, ������, ���������, ��������, ������, ������, �������, ������, ��������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =24
SET @ListName ='���������, �����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =25
SET @ListName ='�����, ���, ����������, ��������, ���������, ������, ��������, �����, ����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =25
SET @ListName ='������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =26
SET @ListName ='�����, �������, �������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =26
SET @ListName ='������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =27
SET @ListName =' ������, ��������, ���������, ������, �������, ������, ������, ����, ������, �������, �������, ��������, �������, ��������, �������, ���������, ��������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =27
SET @ListName ='����, �������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =28
SET @ListName ='�����, �����, ����, ������, �������, ����, ��������, ������, ��������, �������, �������, ��������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 11
--SET @DaysNumb =28
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex


SET @MonthNumb = 11
SET @DaysNumb =29
SET @ListName ='������, ������, ������, ������, �����, �������, ������, �������, �������, �����������, ��������, �������, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 11
--SET @DaysNumb =29
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =30
SET @ListName ='��������, �����, ������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 11
SET @DaysNumb =30
SET @ListName ='��������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex


--####################################################
-- �������
--####################################################

SET @MonthNumb = 12
SET @DaysNumb =1
SET @ListName ='������, �����, �����, �������, ������, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 12
--SET @DaysNumb =1
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =2
SET @ListName ='�������, �����, �������, ������, ������, �������, ��������, ������, �������, �����, ����������, ���������, �������, ������, ��������, ������, ��������, ����, ��������, ��������, �������, ��������, ������, �������, �������,  �������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =2
SET @ListName ='���, ������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =3
SET @ListName ='��������, �����, �������, �������, ���������, ��������, �����, �������, �������, �������, �������, �������, ���������, ������, ��������, ��������, ��������, �����, �����, �������, ������, ������, ����, �������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =3
SET @ListName ='����, ����, �������, Ը���'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =4
SET @ListName ='���������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =4
SET @ListName ='���, ��������, �����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =5
SET @ListName ='�������, ������,  ������, ��������, ������, �����, �������, �����, �����, ������, ����, �������, ��������, �������, �������, ������, �����, ����, �����, ��������, ��������, ������, ������, ��������, ������, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =5
SET @ListName ='�����, �������, ���������, �������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =6
SET @ListName ='���������, ��������, ���������, ��������, �������, �����, �����, �������, �������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =6
SET @ListName ='����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =7
SET @ListName ='��������, ������, �������, ������, ���������, �������, �����, ��������, ��������, ��������, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =7
SET @ListName ='�������, ���������, ���������, �������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =8
SET @ListName ='�������, ����, �������, ��������, �����, �������, �����, ������, �������, �������, ���������, ������, ������, �������, �����, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =8
SET @ListName ='���������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =9
SET @ListName ='������, ����������, �������, �����, �������, �������, �������, ����, ������, ������, �����, ����, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 12
--SET @DaysNumb =9
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =10
SET @ListName ='�����, ��������, ��������, ������, �������, �������, �����, ������, �������, �����, ������, ��������, ��������, ������, ������, ���������, �������, �������, �����, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =10
SET @ListName ='Ը���'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =11
SET @ListName ='������, �������, �������, ����, �������, �������, ������, ��������, �������, ��������, �����, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =11
SET @ListName ='���������, ������, ����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =12
SET @ListName ='�������, �������, ������, ������, ����, ��������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 12
--SET @DaysNumb =12
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =13
SET @ListName ='������, �����, ���������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 12
--SET @DaysNumb =13
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =14
SET @ListName ='����, �������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =14
SET @ListName ='����������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =15
SET @ListName ='�������, �����, ������, ��������, ����������, �������, ������, ��������, ������, �����, ������, �����,  �����,  ���������, ������, ������, ���, ��������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =15
SET @ListName ='�������, ���������, ��������, ������, ��������, �����, �������, ����' 
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =16
SET @ListName ='�������, �����, ������, �������, �������, ������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =16
SET @ListName ='��������, �����, ��������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =17
SET @ListName ='�����, �������, �����, ���������, �������, �������, ��������, ��������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =17
SET @ListName ='�������, �������, ��������, ���������, ���������, ����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =18
SET @ListName ='�����, ����, ��������, ������, ������, �������, �����, ���������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 12
--SET @DaysNumb =18
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =19
SET @ListName ='�������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 12
--SET @DaysNumb =19
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =20
SET @ListName ='��������, �������, ���, ������, �������, ��������, ������, �������, ���������, �����, �����, ����, �������, ��������, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =20
SET @ListName ='���������, �������, �������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =21
SET @ListName ='�������, ������, ������, �������, ����, �����, ���������, ������, ��������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =21
SET @ListName ='������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =22
SET @ListName ='��������, �������, ���������, ������, ��������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =22
SET @ListName ='����, ����������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =23
SET @ListName ='����, �������, ������, ������, �����, ���������, ������, ��������, �������, ����������, �������, ����, �������, �������, ���������, ��������,  ������,  �������, ������, ����, �����, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =23
SET @ListName ='����, ��������, ��������, �������, �����, �������, �������, ����������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =24
SET @ListName ='������, ������, �������, �����, ������, ����, �����, �������, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 12
--SET @DaysNumb =24
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =25
SET @ListName ='��������, ���������, ��������, ��������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 12
--SET @DaysNumb =25
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =26
SET @ListName ='���������, ���������, �������, ��������, �����, ���������, �����, ��������, �����, �������, ��������, �������, �������, �������, �������, �������, ��������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =26
SET @ListName ='���, ���������, ��������, �����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =27
SET @ListName ='����, ������, ��������, �������, ���������, �����, ������, �������, �������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 12
--SET @DaysNumb =27
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =28
SET @ListName ='���������, �����, �����, ������, �������, ���������, �������, ��������, ���������, ����, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =28
SET @ListName ='�����, ������, �������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =29
SET @ListName ='�����, ��������, �������, ����, �����, ��������, ���������, �������, ����, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =29
SET @ListName ='���������, �����, ��������'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =30
SET @ListName ='������, ������, ������, ������, ���������, �������, ������, ����, �����'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

--SET @MonthNumb = 12
--SET @DaysNumb =30
--SET @ListName =''
--SET @Sex = '�'
--EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =31
SET @ListName ='���������, �����������, ��������, �����������, ���������, ����, �������, ���������, ��������, ��������, ������, ������, ������, �������, ����, �����, ��������, �������, ������, ������, ����, ������, ������'
SET @Sex = '�' 
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex

SET @MonthNumb = 12
SET @DaysNumb =31
SET @ListName ='���������, ���, �����'
SET @Sex = '�'
EXEC NamesCatalog.dbo.AddListToOrtodoxChristiansCatalogBase @MonthNumb, @DaysNumb, @ListName, @Sex
