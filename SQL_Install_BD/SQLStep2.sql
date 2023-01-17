USE [NamesCatalog]
GO

--ÏÐÎÈÑÕÎÆÄÅÍÈÅ ãðå÷. ãðå÷åñêîå
CREATE TABLE DBO.Origin(OriginId BIGINT NOT NULL PRIMARY KEY IDENTITY(1,1),
             NameOrigin NVARCHAR(50),
			 FullNameOrigin NVARCHAR(100),
			 UNIQUE(NameOrigin))
INSERT INTO DBO.Origin(NameOrigin, FullNameOrigin) VALUES('íåèçâåñòíî','íåèçâåñòíî')
--FullNameOrigin çàïîëíèòñÿ UODATE - îì

--ÎÐËÈÍÀß ÎÐÅË   AbstractNamå ÏÎÊÀ ÍÅ ÇÀÏÎËÍßÅÌ, ÅÑËÈ ÂÐÅÌß ÁÓÄÅÒ
CREATE TABLE DBO.Denotation(DenotationId BIGINT NOT NULL PRIMARY KEY IDENTITY(1,1),
                   DetailName NVARCHAR(500), 
				   AbstractNamå NVARCHAR(250),
				   UNIQUE(DetailName))
INSERT INTO DBO.Denotation(DetailName, AbstractNamå) VALUES('íåèçâåñòíî','íåèçâåñòíî')

--ññûëêà ãäå â íåòå åñòü èíôà
CREATE TABLE DBO.UrlReference(UrlReferenceId BIGINT NOT NULL PRIMARY KEY IDENTITY(1,1),
                     NamesId BIGINT NOT NULL, 
                     ReferenceUrl NVARCHAR(4000))

--Ó ÎÄÍÎÃÎ ÈÌÅÍÈ ÌÎÆÅÒ ÁÛÒÜ ÍÅÑÊÎËÜÊÎ ÇÍÀ×ÅÍÈÉ È ÍÅÑÊÎËÜÊÎ ÑÑÛËÎÊ
CREATE TABLE DBO.NamesAdditionalInfo(NamesAdditionalInfoId BIGINT NOT NULL PRIMARY KEY IDENTITY(1,1),
                     NamesId BIGINT NOT NULL, 
				     OriginId BIGINT NOT NULL,
				     DenotationId BIGINT NOT NULL,
				     UNIQUE(NamesId, OriginId,  DenotationId))

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE DBO.AdditionalFullInfoNames
     @Name NVARCHAR(150),
	   @NameOrigin NVARCHAR(50),
     @DetailName NVARCHAR(500)
AS
BEGIN

  SET NOCOUNT ON;

  SET @Name = LTRIM(RTRIM(ISNULL(@Name,'')))
  SET @NameOrigin = LTRIM(RTRIM(ISNULL(@NameOrigin,'')))
  SET @DetailName = LTRIM(RTRIM(ISNULL(@DetailName,'')))


  IF LEN(@Name)>0
   BEGIN --LEN(@Name)>0
     DECLARE @NamesId BIGINT
	 SET @NamesId = (SELECT [NamesId] FROM [NamesCatalog].[dbo].[Names] WHERE UPPER([Name]) = UPPER(@Name))
	 IF @NamesId IS NOT NULL
	  BEGIN --@NamesId IS NOT NULL

	     --ÏÐÎÈÑÕÎÆÄÅÍÈÅ
	     DECLARE @OriginId BIGINT
	     IF LEN(@NameOrigin) = 0 SET @OriginId = 1
		 ELSE BEGIN --000
		   SET @OriginId = (SELECT OriginId FROM [NamesCatalog].DBO.Origin WHERE UPPER(NameOrigin) = UPPER(@NameOrigin))
		   IF @OriginId IS NULL
		    BEGIN--001
			  INSERT INTO [NamesCatalog].dbo.Origin(NameOrigin, FullNameOrigin) VALUES (@NameOrigin, @NameOrigin)
			  SET @OriginId = (SELECT @@IDENTITY)
			END --001
		      END --000

		  --ÇÍÀ×ÅÍÈÅ
		  DECLARE @DenotationId BIGINT
	     IF LEN(@DetailName) = 0 SET @DenotationId = 1
		 ELSE BEGIN--100
		   SET @DenotationId = (SELECT DenotationId FROM [NamesCatalog].dbo.Denotation WHERE UPPER(DetailName) = UPPER(@DetailName))
		   IF @DenotationId IS NULL
		    BEGIN --101
			  INSERT INTO [NamesCatalog].DBO.Denotation(DetailName, AbstractNamå) VALUES (@DetailName, @DetailName)
			  SET @DenotationId = (SELECT @@IDENTITY)
			END --101
		      END --100

	   DECLARE @CountId SMALLINT
	   SET @CountId = (SELECT COUNT(*) FROM [NamesCatalog].[dbo].[NamesAdditionalInfo]
	                     WHERE NamesId = @NamesId AND OriginId = @OriginId AND DenotationId = @DenotationId)


	   IF @CountId = 0
       INSERT INTO [NamesCatalog].[dbo].[NamesAdditionalInfo]([NamesId], [OriginId], [DenotationId]) 
	        VALUES(@NamesId, @OriginId, @DenotationId)

        END --@NamesId IS NOT NULL
      END  --LEN(@Name)>0	  
END  

GO


CREATE PROCEDURE DBO.AddUrlReference
     @Name NVARCHAR(150),
     @ReferenceUrl NVARCHAR(4000)
AS
BEGIN
   SET NOCOUNT ON;
   SET @Name = LTRIM(RTRIM(ISNULL(@Name,'')))

   IF LEN(@Name)>0
   BEGIN --LEN(@Name)>0
     DECLARE @NamesId BIGINT
	 SET @NamesId = (SELECT [NamesId] FROM [NamesCatalog].[dbo].[Names] WHERE UPPER([Name]) = UPPER(@Name))
	 IF @NamesId IS NOT NULL
	  BEGIN --@NamesId IS NOT NULL
	    SET @ReferenceUrl = LTRIM(RTRIM(ISNULL(@ReferenceUrl,'')))
		IF LEN(@ReferenceUrl) > 0
		INSERT INTO [dbo].[UrlReference]([NamesId], [ReferenceUrl])
		  VALUES( @NamesId, @ReferenceUrl)
	  END --@NamesId IS NOT NULL
	END --LEN(@Name)>0

END
GO

