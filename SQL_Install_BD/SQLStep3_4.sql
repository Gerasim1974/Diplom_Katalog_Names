DECLARE @Name NVARCHAR(50)
DECLARE @NameOrigin NVARCHAR(50)
DECLARE @DetailName NVARCHAR(500)

DECLARE @Url NVARCHAR(4000)

--#############################################################
SET @Name = 'Гаафа'
SET @NameOrigin = ''
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Гавриил'
SET @NameOrigin = 'рус.'
SET @DetailName = 'сила Божия'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%93%D0%B0%D0%B2%D1%80%D0%B8%D0%B8%D0%BB#:~:text=%D0%93%D0%B0%D0%B2%D1%80%D0%B8%D0%B8%CC%81%D0%BB%20(%D0%BD%D0%B0%D1%80%D0%BE%D0%B4%D0%BD%D0%BE%D0%B5%20%D0%93%D0%B0%D0%B2%D1%80%D0%B8%CC%81%D0%BB%D0%B0%2C%20%D0%93%D0%B0%D0%B2%D1%80%D0%B8%CC%81%D0%BB),%E2%80%8F%D7%90%D7%9C%E2%80%8F%E2%80%8E%20%E2%80%94%20%D0%91%D0%BE%D0%B3.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Гаиания'
SET @NameOrigin = ''
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%93%D0%B0%D0%B8%D0%B0%D0%BD%D0%B8%D1%8F#:~:text=%D0%93%D0%B0%D0%B8%D0%B0%D0%BD%D0%B8%CC%81%D1%8F%2C%20%D0%B8%D0%BB%D0%B8%20%D0%93%D0%B0%D1%8F%D0%BD%D0%B8%CC%81%D1%8F%2C%20%D0%B8%D0%BB%D0%B8%20%D0%93%D0%B0%D1%8F%D0%BD%D0%B5%CC%81,%D0%B2%20%D0%B3%D0%BE%D0%BD%D0%B5%D0%BD%D0%B8%D0%B5%20%D0%B0%D1%80%D0%BC%D1%8F%D0%BD%D1%81%D0%BA%D0%BE%D0%B3%D0%BE%20%D1%86%D0%B0%D1%80%D1%8F%20%D0%A2%D0%B8%D1%80%D0%B8%D0%B4%D0%B0%D1%82%D0%B0.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Гаий'
SET @NameOrigin = 'греч.'
SET @DetailName = 'земной'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Гай'
SET @NameOrigin = 'греч.'
SET @DetailName = 'земной'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%93%D0%B0%D0%B9_(%D1%80%D0%B8%D0%BC%D1%81%D0%BA%D0%BE%D0%B5_%D0%B8%D0%BC%D1%8F)'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Галактион'
SET @NameOrigin = 'греч.'
SET @DetailName = 'молоко'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%93%D0%B0%D0%BB%D0%B0%D0%BA%D1%82%D0%B8%D0%BE%D0%BD'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Галина'
SET @NameOrigin = 'греч.'
SET @DetailName = 'спокойствие'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%93%D0%B0%D0%BB%D0%B8%D0%BD%D0%B0#:~:text=%D0%93%D0%B0%D0%BB%D0%B8%CC%81%D0%BD%D0%B0%20(%D0%BE%D1%82%20%D0%B4%D1%80.,%D0%BD%D0%B5%D1%80%D0%B5%D0%B8%D0%B4%D1%8B%2C%20%D0%BA%D0%BE%D1%82%D0%BE%D1%80%D0%B0%D1%8F%20%D0%BF%D0%BE%D0%BA%D1%80%D0%BE%D0%B2%D0%B8%D1%82%D0%B5%D0%BB%D1%8C%D1%81%D1%82%D0%B2%D0%BE%D0%B2%D0%B0%D0%BB%D0%B0%20%D1%81%D0%BF%D0%BE%D0%BA%D0%BE%D0%B9%D0%BD%D0%BE%D0%BC%D1%83%20%D0%BC%D0%BE%D1%80%D1%8E.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Гамалиил'
SET @NameOrigin = 'евр.'
SET @DetailName = 'сотворенный Богом'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%93%D0%B0%D0%BC%D0%BB%D0%B8%D1%8D%D0%BB%D1%8C#:~:text=%D0%93%D0%B0%D0%BC%D0%BB%D0%B8%D1%8D%D0%BB%D1%8C%20(%D0%93%D0%B0%D0%BC%D0%BB%D0%B8%D0%B8%D0%BB%3B%20%D0%93%D0%B0%D0%BC%D0%B0%D0%BB%D0%B8%D0%B8%D0%BB)%20%E2%80%94%20%D1%82%D0%B5%D1%80%D0%BC%D0%B8%D0%BD%20%D0%B5%D0%B2%D1%80%D0%B5%D0%B9%D1%81%D0%BA%D0%BE%D0%B3%D0%BE%20%D0%BF%D1%80%D0%BE%D0%B8%D1%81%D1%85%D0%BE%D0%B6%D0%B4%D0%B5%D0%BD%D0%B8%D1%8F.&text=%D0%93%D0%B0%D0%BC%D0%BB%D0%B8%D1%8D%D0%BB%D1%8C%20I%20(I%20%D0%B2%D0%B5%D0%BA)%20%E2%80%94,%D0%A3%D1%87%D0%B8%D1%82%D0%B5%D0%BB%D1%8C%20%D0%B0%D0%BF%D0%BE%D1%81%D1%82%D0%BE%D0%BB%D0%B0%20%D0%9F%D0%B0%D0%B2%D0%BB%D0%B0.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Гаспар'
SET @NameOrigin = 'перс.'
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%93%D0%B0%D1%81%D0%BF%D0%B0%D1%80#:~:text=%D0%93%D0%B0%D1%81%D0%BF%D0%B0%D1%80%20%E2%80%94%20%D0%B8%D0%BC%D1%8F%20%D0%B8%20%D0%BE%D0%B1%D1%80%D0%B0%D0%B7%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%B0%D1%8F%20%D0%BE%D1%82,%D0%BE%D0%B4%D0%BD%D0%BE%D0%B3%D0%BE%20%D0%B8%D0%B7%20%D1%82%D1%80%D0%B5%D1%85%20%D0%BD%D0%BE%D0%B2%D0%BE%D0%B7%D0%B0%D0%B2%D0%B5%D1%82%D0%BD%D1%8B%D1%85%20%D0%B2%D0%BE%D0%BB%D1%85%D0%B2%D0%BE%D0%B2.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Гедеон'
SET @NameOrigin = 'евр.'
SET @DetailName = 'великий воин'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%93%D0%B5%D0%B4%D0%B5%D0%BE%D0%BD'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Геласий'
SET @NameOrigin = 'греч.'
SET @DetailName = 'веселый'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%93%D0%B5%D0%BB%D0%B0%D1%81%D0%B8%D0%B9#:~:text=%D0%93%D0%B5%D0%BB%D0%B0%CC%81%D1%81%D0%B8%D0%B9%20%E2%80%94%20%D0%BC%D1%83%D0%B6%D1%81%D0%BA%D0%BE%D0%B5%20%D1%80%D1%83%D1%81%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BB%D0%B8%D1%87%D0%BD%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F,%C2%BB)%20%E2%80%94%20%C2%AB%D1%81%D0%BC%D0%B5%D1%8E%D1%81%D1%8C%C2%BB.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Гемелл'
SET @NameOrigin = 'лат.'
SET @DetailName = 'близнец'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Геннадий'
SET @NameOrigin = 'греч.'
SET @DetailName = 'благородный'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%93%D0%B5%D0%BD%D0%BD%D0%B0%D0%B4%D0%B8%D0%B9'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Георгий'
SET @NameOrigin = 'греч.'
SET @DetailName = 'земледелец'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%93%D0%B5%D0%BE%D1%80%D0%B3%D0%B8%D0%B9'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Герасим'
SET @NameOrigin = 'греч.'
SET @DetailName = 'почтенный' 
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%93%D0%B5%D1%80%D0%B0%D1%81%D0%B8%D0%BC#:~:text=%D0%93%D0%B5%D1%80%D0%B0%D1%81%D0%B8%D0%BC%20(%D0%B3%D1%80%D0%B5%D1%87.,%D0%B3%D0%B5%D1%80%D1%83%D1%81%D0%B8%D1%8F).'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Герман'
SET @NameOrigin = 'лат.'
SET @DetailName = 'родной' 
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%93%D0%B5%D1%80%D0%BC%D0%B0%D0%BD'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Гермоген'
SET @NameOrigin = 'греч.'
SET @DetailName = 'род Гермеса'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%93%D0%B5%D1%80%D0%BC%D0%BE%D0%B3%D0%B5%D0%BD'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Гермогена'
SET @NameOrigin = 'греч.'
SET @DetailName = 'род Гермеса'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Геронтий'
SET @NameOrigin = 'греч.'
SET @DetailName = 'престарелый' 
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%93%D0%B5%D1%80%D0%BE%D0%BD%D1%82%D0%B8%D0%B9#:~:text=%D0%93%D0%B5%D1%80%D0%BE%CC%81%D0%BD%D1%82%D0%B8%D0%B9%20(%D0%B3%D1%80%D0%B5%D1%87.,)%20%E2%80%94%20%D0%BC%D1%83%D0%B6%D1%81%D0%BA%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F%20%D0%B3%D1%80%D0%B5%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B3%D0%BE%20%D0%BF%D1%80%D0%BE%D0%B8%D1%81%D1%85%D0%BE%D0%B6%D0%B4%D0%B5%D0%BD%D0%B8%D1%8F.&text=%D0%98%D0%B7%D0%B2%D0%B5%D1%81%D1%82%D0%BD%D1%8B%D0%B5%20%D0%BD%D0%BE%D1%81%D0%B8%D1%82%D0%B5%D0%BB%D0%B8%3A,(%D0%B2%D0%BE%D0%B5%D0%BD%D0%BD%D1%8B%D0%B9%20%D0%BC%D0%B0%D0%B3%D0%B8%D1%81%D1%82%D1%80)%20(%D1%83%D0%BC.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Гертруда'
SET @NameOrigin = 'герм.'
SET @DetailName = 'Сила копья'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%93%D0%B5%D1%80%D1%82%D1%80%D1%83%D0%B4%D0%B0#:~:text=%D0%93%D0%B5%D1%80%D1%82%D1%80%D1%83%CC%81%D0%B4%D0%B0%20(%D0%BD%D0%B5%D0%BC.,%D0%B8%D1%81%D0%BF%D0%BE%D0%BB%D1%8C%D0%B7%D0%BE%D0%B2%D0%B0%D0%BB%D1%81%D1%8F%20%D0%BC%D1%83%D0%B6%D1%81%D0%BA%D0%BE%D0%B9%20%D0%B2%D0%B0%D1%80%D0%B8%D0%B0%D0%BD%D1%82%20%D0%B8%D0%BC%D0%B5%D0%BD%D0%B8%20%E2%80%94%20%D0%93%D0%B5%D1%80%D1%82%D1%80%D1%83%D0%B4.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Глафира'
SET @NameOrigin = 'греч.'
SET @DetailName = 'гладкая'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%93%D0%BB%D0%B0%D1%84%D0%B8%D1%80%D0%B0'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Глеб'
SET @NameOrigin = 'скан.'
SET @DetailName = 'наследник бога'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%93%D0%BB%D0%B5%D0%B1'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Гликерий'
SET @NameOrigin = 'греч.'
SET @DetailName = 'сладкий'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%93%D0%BB%D0%B8%D0%BA%D0%B5%D1%80%D0%B8%D0%B9#:~:text=%D0%93%D0%BB%D0%B8%D0%BA%D0%B5%D1%80%D0%B8%D0%B9%20%E2%80%94%20%D0%B8%D0%BC%D1%8F%2C%20%D0%BA%D0%BE%D1%82%D0%BE%D1%80%D0%BE%D0%B5%20%D0%BD%D0%BE%D1%81%D0%B8%D0%BB%D0%B8%20%D0%BD%D0%B5%D0%BA%D0%BE%D1%82%D0%BE%D1%80%D1%8B%D0%B5,436%20%D0%B3%D0%BE%D0%B4%D0%B0%2C%20%D0%BF%D0%B0%D0%BC%D1%8F%D1%82%D1%8C%2014%20%D1%8F%D0%BD%D0%B2%D0%B0%D1%80%D1%8F.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Гликерия'
SET @NameOrigin = 'греч.'
SET @DetailName = 'сладкая'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%93%D0%BB%D0%B8%D0%BA%D0%B5%D1%80%D0%B8%D1%8F#:~:text=%D0%93%D0%BB%D0%B8%D0%BA%D0%B5%CC%81%D1%80%D0%B8%D1%8F%20(%D0%B3%D1%80%D0%B5%D1%87.,)%20%E2%80%94%20%D0%B6%D0%B5%D0%BD%D1%81%D0%BA%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F%20%D0%B3%D1%80%D0%B5%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B3%D0%BE%20%D0%BF%D1%80%D0%BE%D0%B8%D1%81%D1%85%D0%BE%D0%B6%D0%B4%D0%B5%D0%BD%D0%B8%D1%8F.&text=%D0%9F%D1%80%D0%BE%D1%81%D1%82%D0%BE%D0%BD%D0%B0%D1%80%D0%BE%D0%B4%D0%BD%D0%B0%D1%8F%20%D1%84%D0%BE%D1%80%D0%BC%D0%B0%20%E2%80%94%20%D0%9B%D1%83%D0%BA%D0%B5%D1%80%D1%8C%D1%8F.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Горгоний '
SET @NameOrigin = ''
SET @DetailName = 'мужское воплощение Горгоны' 
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://wiki5.ru/wiki/Gorgonius'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Гордей'
SET @NameOrigin = 'греч.'
SET @DetailName = 'Царь завязавший гордеев узел'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%93%D0%BE%D1%80%D0%B4%D0%B5%D0%B9#:~:text=%D0%93%D0%BE%D1%80%D0%B4%D0%B5%CC%81%D0%B9%2C%20%D0%93%D0%BE%D1%80%D0%B4%D0%B8%CC%81%D0%B9%20%E2%80%94%20%D0%BC%D1%83%D0%B6%D1%81%D0%BA%D0%BE%D0%B5%20%D1%80%D1%83%D1%81%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BB%D0%B8%D1%87%D0%BD%D0%BE%D0%B5,%D0%BE%D1%82%D0%BA%D1%80%D1%8B%D1%82%D0%BE%20%D0%B2%D1%8B%D1%81%D1%82%D1%83%D0%BF%D0%B8%D0%BB%20%D0%B2%20%D0%B7%D0%B0%D1%89%D0%B8%D1%82%D1%83%20%D1%85%D1%80%D0%B8%D1%81%D1%82%D0%B8%D0%B0%D0%BD.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Голиндуха'
SET @NameOrigin = 'перс.'
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Гордиан'
SET @NameOrigin = 'греч.'
SET @DetailName = 'житель Гордиены (области в южной части Большой Армении)'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%93%D0%BE%D1%80%D0%B4%D0%B8%D0%B0%D0%BD'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Григорий'
SET @NameOrigin = 'греч.'
SET @DetailName = 'бодрствующий'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%93%D1%80%D0%B8%D0%B3%D0%BE%D1%80%D0%B8%D0%B9'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Гурий'
SET @NameOrigin = 'евр.'
SET @DetailName = 'львёнок'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%93%D1%83%D1%80%D0%B8%D0%B9#:~:text=%D1%82%D0%B0%D0%BA%D0%B6%D0%B5-,%D0%98%D0%BC%D1%8F,)%20%E2%80%94%20%D0%BC%D1%83%D0%B6%D1%81%D0%BA%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F%20%D0%B1%D0%B8%D0%B1%D0%BB%D0%B5%D0%B9%D1%81%D0%BA%D0%BE%D0%B3%D0%BE%20%D0%BF%D1%80%D0%BE%D0%B8%D1%81%D1%85%D0%BE%D0%B6%D0%B4%D0%B5%D0%BD%D0%B8%D1%8F.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
