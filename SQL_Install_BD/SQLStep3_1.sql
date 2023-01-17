DECLARE @Name NVARCHAR(50)
DECLARE @NameOrigin NVARCHAR(50)
DECLARE @DetailName NVARCHAR(500)

DECLARE @Url NVARCHAR(4000)

--#############################################################
SET @Name = 'Аввакум'
SET @NameOrigin = 'евр.'
SET @DetailName = 'любовь Божия'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%B2%D0%B2%D0%B0%D0%BA%D1%83%D0%BC#:~:text=%E2%80%8F%D7%97%D7%91%D7%A7%D7%95%D7%A7%E2%80%8F%E2%80%8E%2C%20%D0%A5%D0%B0%D0%B2%D0%B2%D0%B0%D0%BA%D1%83%CC%81%D0%BA,%D0%B2%D1%82%D0%BE%D1%80%D1%83%D1%8E%20%C2%AB%D0%B0%C2%BB%3A%20%D0%90%D0%B2%D0%B2%D0%B0%CC%81%D0%BA%D1%83%D0%BC.&text=%D0%90%D0%B2%D0%B2%D0%B0%D0%BA%D1%83%D0%BC%20%D0%9F%D0%B5%D1%82%D1%80%D0%BE%D0%B2%20(1620%20%D0%B8%D0%BB%D0%B8%201621,1801%E2%80%941866)%20%E2%80%94%20%D0%BE%D1%80%D0%B8%D0%B5%D0%BD%D1%82%D0%B0%D0%BB%D0%B8%D1%81%D1%82.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Августа'
SET @NameOrigin = 'лат.'
SET @DetailName = 'священная '
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wiktionary.org/wiki/%D0%90%D0%B2%D0%B3%D1%83%D1%81%D1%82%D0%B0'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Августин'
SET @NameOrigin = ''
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%B2%D0%B3%D1%83%D1%81%D1%82%D0%B8%D0%BD_(%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D1%8F)'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Авда'
SET @NameOrigin = 'халд.'
SET @DetailName = 'слуга' 
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'http://xn----7sbpabhjc0bdcg5j.xn--p1ai/%D0%B0%D0%B2%D0%B4%D0%B0'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Авделай'
SET @NameOrigin = 'перс.'
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://dic.academic.ru/dic.nsf/personal_names/21/%D0%90%D0%B2%D0%B4%D0%B5%D0%BB%D0%B0%D0%B9'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Авдиес'
SET @NameOrigin = 'евр.'
SET @DetailName = 'слуга Иисуса'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://dic.academic.ru/dic.nsf/personal_names/22/%D0%90%D0%B2%D0%B4%D0%B8%D0%B5%D1%81'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Авдий'
SET @NameOrigin = 'евр.'
SET @DetailName = 'слуга Бога'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%B2%D0%B4%D0%B5%D0%B9#:~:text=%E2%80%8F%D7%A2%D6%B9%D7%91%D6%B7%D7%93%D6%B0%D7%99%D6%B8%D7%94%E2%80%8F%E2%80%8E%2C%20%C2%AB%D1%81%D0%BB%D1%83%D0%B3%D0%B0,%D1%80%D1%83%D1%81%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BB%D0%B8%D1%87%D0%BD%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F%20%D0%B5%D0%B2%D1%80%D0%B5%D0%B9%D1%81%D0%BA%D0%BE%D0%B3%D0%BE%20%D0%BF%D1%80%D0%BE%D0%B8%D1%81%D1%85%D0%BE%D0%B6%D0%B4%D0%B5%D0%BD%D0%B8%D1%8F.&text=%D0%A1%D1%83%D1%89%D0%B5%D1%81%D1%82%D0%B2%D1%83%D0%B5%D1%82%20%D0%B4%D0%B2%D0%B0%20%D0%B2%D0%BE%D0%B7%D0%BC%D0%BE%D0%B6%D0%BD%D1%8B%D1%85%20%D0%BF%D1%80%D0%BE%D0%B8%D1%81%D1%85%D0%BE%D0%B6%D0%B4%D0%B5%D0%BD%D0%B8%D1%8F%20%D0%B8%D0%BC%D0%B5%D0%BD%D0%B8,aud%C4%93is%2C%20%D0%BE%D0%B7%D0%BD%D0%B0%D1%87%D0%B0%D1%8E%D1%89%D0%B5%D0%B3%D0%BE%20%D0%B1%D0%BB%D0%B0%D0%B3%D0%BE%D0%B7%D0%B2%D1%83%D1%87%D0%BD%D1%8B%D0%B9%2C%20%D0%B3%D0%BE%D0%B2%D0%BE%D1%80%D1%8F%D1%89%D0%B8%D0%B9.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Авдикий'
SET @NameOrigin = 'перс.'
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Авдифакс'
SET @NameOrigin = 'перс.'
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Авдон'
SET @NameOrigin = 'евр.'
SET @DetailName = 'слуга Бога' 
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://wiki5.ru/wiki/Avdon_(given_name)'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Авенир'
SET @NameOrigin = 'евр.'
SET @DetailName = 'отец'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%B2%D0%B5%D0%BD%D0%B8%D1%80#:~:text=%D0%90%D0%B2%D0%B5%D0%BD%D0%B8%CC%81%D1%80%20(%D0%90%D0%B1%D0%B8%D0%BD%D0%B5%CC%81%D1%80%2C%20%D0%90%D0%B2%D0%BD%D0%B5%CC%81%D1%80%2C%20%D0%90%D0%B2%D0%B8%D0%BD%D0%B5%CC%81%D1%80,%D0%A1%D0%B0%D1%83%D0%BB%D0%B0%20%D0%B8%20%D0%B5%D0%B3%D0%BE%20%D0%B2%D0%BE%D0%B5%D0%BD%D0%B0%D1%87%D0%B0%D0%BB%D1%8C%D0%BD%D0%B8%D0%BA%20(1%D0%A6%D0%B0%D1%80.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Аверкий'
SET @NameOrigin = 'лат.'
SET @DetailName = 'удерживающий, удаляющий '
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%B2%D0%B5%D1%80%D0%BA%D0%B8%D0%B9#:~:text=%D0%90%D0%B2%D0%B5%CC%81%D1%80%D0%BA%D0%B8%D0%B9%20(%D0%BB%D0%B0%D1%82.,)%20%E2%80%94%20%D1%80%D0%BE%D1%81%D1%82%D0%BE%D0%B2%D1%81%D0%BA%D0%B8%D0%B9%20%D0%B1%D0%BE%D1%8F%D1%80%D0%B8%D0%BD%20%D0%B8%20%D1%82%D1%8B%D1%81%D1%8F%D1%86%D0%BA%D0%B8%D0%B9.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Авив'
SET @NameOrigin = 'евр.'
SET @DetailName = 'колос' 
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%B2%D0%B8%D0%B2#:~:text=%D0%90%D0%B2%D0%B8%D0%B2%20%E2%80%94%20%D0%BC%D1%83%D0%B6%D1%81%D0%BA%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F%3A,6%20%D1%81%D0%B5%D0%BD%D1%82%D1%8F%D0%B1%D1%80%D1%8F%20(19%20%D1%81%D0%B5%D0%BD%D1%82%D1%8F%D0%B1%D1%80%D1%8F).'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Авим'
SET @NameOrigin = ''
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%B2%D0%B8%D0%B2#:~:text=%D0%90%D0%B2%D0%B8%D0%B2%20%E2%80%94%20%D0%BC%D1%83%D0%B6%D1%81%D0%BA%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F%3A,6%20%D1%81%D0%B5%D0%BD%D1%82%D1%8F%D0%B1%D1%80%D1%8F%20(19%20%D1%81%D0%B5%D0%BD%D1%82%D1%8F%D0%B1%D1%80%D1%8F).'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Авксентий'
SET @NameOrigin = 'греч.'
SET @DetailName = 'приумножение' 
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%B2%D0%BA%D1%81%D0%B5%D0%BD%D1%82%D0%B8%D0%B9#:~:text=%CE%91%E1%BD%90%CE%BE%CE%AD%CE%BD%CF%84%CE%B9%CE%BF%CF%82)%20%E2%80%94%20%D0%BC%D1%83%D0%B6%D1%81%D0%BA%D0%BE%D0%B5%20%D1%80%D1%83%D1%81%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BB%D0%B8%D1%87%D0%BD%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F,%D0%B1%D1%83%D0%BA%D0%B2%D0%B0%D0%BB%D1%8C%D0%BD%D0%BE%20%E2%80%94%20%C2%AB%D0%BF%D1%80%D0%B8%D1%83%D0%BC%D0%BD%D0%BE%D0%B6%D0%B8%D1%82%D0%B5%D0%BB%D1%8C%D0%BD%D0%B8%D1%86%D0%B0%C2%BB).'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Авкт'
SET @NameOrigin = 'греч.'
SET @DetailName = 'умноженный' 
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Авраам'
SET @NameOrigin = 'евр.'
SET @DetailName = 'отец множества'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%B2%D1%80%D0%B0%D0%B0%D0%BC_(%D0%B8%D0%BC%D1%8F)#:~:text=%D0%90%D0%B2%D1%80%D0%B0%D0%B0%CC%81%D0%BC%20%D0%B8%D0%BB%D0%B8%20%D0%90%D0%B1%D1%80%D0%B0%CC%81%D0%BC%20(%D0%B8%D0%B2%D1%80.,%D0%BC%D0%BD%D0%BE%D0%B3%D0%B8%D1%85%20%D1%85%D1%80%D0%B8%D1%81%D1%82%D0%B8%D0%B0%D0%BD%D1%81%D0%BA%D0%B8%D1%85%20%D0%B8%20%D0%BC%D1%83%D1%81%D1%83%D0%BB%D1%8C%D0%BC%D0%B0%D0%BD%D1%81%D0%BA%D0%B8%D1%85%20%D0%BD%D0%B0%D1%80%D0%BE%D0%B4%D0%BE%D0%B2.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Авраамий'
SET @NameOrigin = ''
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%B2%D1%80%D0%B0%D0%B0%D0%BC%D0%B8%D0%B9#:~:text=%D0%90%D0%B2%D1%80%D0%B0%D0%B0%CC%81%D0%BC%D0%B8%D0%B9%20%E2%80%94%20%D0%BC%D1%83%D0%B6%D1%81%D0%BA%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F%20%D0%B5%D0%B2%D1%80%D0%B5%D0%B9%D1%81%D0%BA%D0%BE%D0%B3%D0%BE%20%D0%BF%D1%80%D0%BE%D0%B8%D1%81%D1%85%D0%BE%D0%B6%D0%B4%D0%B5%D0%BD%D0%B8%D1%8F,%2C%20%D0%B5%D0%BF%D0%B8%D1%81%D0%BA%D0%BE%D0%BF%20%D0%B3%D0%BE%D1%80%D0%BE%D0%B4%D0%B0%20%D0%9A%D0%B0%D1%80%D1%80%D0%B0%2C%20%D0%BF%D1%80%D0%B5%D0%BF%D0%BE%D0%B4%D0%BE%D0%B1%D0%BD%D1%8B%D0%B9.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Аврамий'
SET @NameOrigin = ''
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%B2%D1%80%D0%B0%D0%B0%D0%BC%D0%B8%D0%B9#:~:text=%D0%90%D0%B2%D1%80%D0%B0%D0%B0%CC%81%D0%BC%D0%B8%D0%B9%20%E2%80%94%20%D0%BC%D1%83%D0%B6%D1%81%D0%BA%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F%20%D0%B5%D0%B2%D1%80%D0%B5%D0%B9%D1%81%D0%BA%D0%BE%D0%B3%D0%BE%20%D0%BF%D1%80%D0%BE%D0%B8%D1%81%D1%85%D0%BE%D0%B6%D0%B4%D0%B5%D0%BD%D0%B8%D1%8F,%2C%20%D0%B5%D0%BF%D0%B8%D1%81%D0%BA%D0%BE%D0%BF%20%D0%B3%D0%BE%D1%80%D0%BE%D0%B4%D0%B0%20%D0%9A%D0%B0%D1%80%D1%80%D0%B0%2C%20%D0%BF%D1%80%D0%B5%D0%BF%D0%BE%D0%B4%D0%BE%D0%B1%D0%BD%D1%8B%D0%B9.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Аврелия'
SET @NameOrigin = 'лат.'
SET @DetailName = 'золотая'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%B2%D1%80%D0%B5%D0%BB%D0%B8%D1%8F#:~:text=%D0%90%D0%B2%D1%80%D0%B5%CC%81%D0%BB%D0%B8%D1%8F%2F%D0%90%D1%83%D1%80%D0%B5%CC%81%D0%BB%D0%B8%D1%8F%20(%D0%B0%D0%BD%D0%B3%D0%BB.,%D0%A2%D0%B0%D0%BA%D0%B6%D0%B5%20%D1%82%D0%BE%D0%BF%D0%BE%D0%BD%D0%B8%D0%BC.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Авскентий'
SET @NameOrigin = 'греч.'
SET @DetailName = 'приумножающий'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%B2%D0%BA%D1%81%D0%B5%D0%BD%D1%82%D0%B8%D0%B9'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Автоном'
SET @NameOrigin = 'греч.'
SET @DetailName = 'самостоятельный'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%B2%D1%82%D0%BE%D0%BD%D0%BE%D0%BC_(%D0%B8%D0%BC%D1%8F)#:~:text=%D0%90%D0%B2%D1%82%D0%BE%D0%BD%D0%BE%CC%81%D0%BC%20(%D0%B4%D1%80.,%2D%D0%B3%D1%80%D0%B5%D1%87.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Авудим'
SET @NameOrigin = ''
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Авундий'
SET @NameOrigin = 'лат.'
SET @DetailName = 'изобильный' 
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%B2%D1%83%D0%BD%D0%B4%D0%B8%D0%B9'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Агав'
SET @NameOrigin = ''
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Агап'
SET @NameOrigin = ''
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Агапий'
SET @NameOrigin = 'греч.'
SET @DetailName = 'любовь'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%B3%D0%B0%D0%BF%D0%B8%D0%B9#:~:text=%D0%90%D0%B3%D0%B0%CC%81%D0%BF%D0%B8%D0%B9%20(%D0%B3%D1%80%D0%B5%D1%87.,%D0%96%D0%B5%D0%BD%D1%81%D0%BA%D0%B8%D0%B9%20%D0%B2%D0%B0%D1%80%D0%B8%D0%B0%D0%BD%D1%82%20%E2%80%94%20%D0%90%D0%B3%D0%B0%D0%BF%D0%B8%D1%8F.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Агапит'
SET @NameOrigin = 'греч.'
SET @DetailName = 'возлюбленный' 
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%B3%D0%B0%D0%BF%D0%B8%D1%82#:~:text=%D0%90%D0%B3%D0%B0%D0%BF%D0%B8%CC%81%D1%82%20(%D0%B4%D1%80.,)%20%E2%80%94%20%D0%BC%D1%83%D0%B6%D1%81%D0%BA%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F%20%D0%B3%D1%80%D0%B5%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B3%D0%BE%20%D0%BF%D1%80%D0%BE%D0%B8%D1%81%D1%85%D0%BE%D0%B6%D0%B4%D0%B5%D0%BD%D0%B8%D1%8F.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Агапия'
SET @NameOrigin = 'греч.'
SET @DetailName = 'любовь'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Агафангел'
SET @NameOrigin = 'греч.'
SET @DetailName = 'добрый вестник' 
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%B3%D0%B0%D1%84%D0%B0%D0%BD%D0%B3%D0%B5%D0%BB#:~:text=%E1%BC%8D%CE%B3%CE%B1%CE%B8%CE%AC%CE%B3%CE%B3%CE%B5%CE%BB%CE%BF%CF%82%20%E2%80%94%20%C2%AB%D0%B4%D0%BE%D0%B1%D1%80%D1%8B%D0%B9%20%D0%B2%D0%B5%D1%81%D1%82%D0%BD%D0%B8%D0%BA%C2%BB%20%D0%BE%D1%82,%D0%92%20%D0%A0%D0%BE%D1%81%D1%81%D0%B8%D0%B8%20%D0%BF%D1%80%D0%B5%D0%B8%D0%BC%D1%83%D1%89%D0%B5%D1%81%D1%82%D0%B2%D0%B5%D0%BD%D0%BD%D0%BE%20%D0%BC%D0%BE%D0%BD%D0%B0%D1%88%D0%B5%D1%81%D0%BA%D0%BE%D0%B5.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Агафия'
SET @NameOrigin = 'греч.'
SET @DetailName = 'добрая'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'http://wp.wiki-wiki.ru/wp/index.php/%D0%90%D0%B3%D0%B0%D1%84%D1%8C%D1%8F'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Агафодор'
SET @NameOrigin = 'греч.'
SET @DetailName = 'благой дар' 
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%B3%D0%B0%D1%84%D0%BE%D0%B4%D0%BE%D1%80#:~:text=%D0%90%D0%B3%D0%B0%D1%84%D0%BE%D0%B4%D0%BE%D1%80%20(%D0%B3%D1%80%D0%B5%D1%87.,)%20%E2%80%94%20%D0%BC%D1%83%D0%B6%D1%81%D0%BA%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F%20%D0%B3%D1%80%D0%B5%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B3%D0%BE%20%D0%BF%D1%80%D0%BE%D0%B8%D1%81%D1%85%D0%BE%D0%B6%D0%B4%D0%B5%D0%BD%D0%B8%D1%8F.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Агафоклия'
SET @NameOrigin = 'греч.'
SET @DetailName = 'благославная'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%B3%D0%B0%D1%84%D0%BE%D0%BA%D0%BB%D0%B5%D1%8F_(%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D1%8F)'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Агафон'
SET @NameOrigin = 'греч.'
SET @DetailName = 'добрый' 
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%B3%D0%B0%D1%84%D0%BE%D0%BD#:~:text=%D0%90%D0%B3%D0%B0%D1%B3%D1%A1%CC%81%D0%BD%D1%8A)%E2%80%94%20%D0%BC%D1%83%D0%B6%D1%81%D0%BA%D0%BE%D0%B5%20%D1%80%D1%83%D1%81%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BB%D0%B8%D1%87%D0%BD%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F,%2C%20%D0%B1%D0%BE%D0%BB%D0%B5%D0%B5%20%D0%BF%D0%BE%D0%B7%D0%B4%D0%BD%D0%B5%D0%B5%3A%20%D0%90%D0%B3%D0%B0%D1%82%D0%B0).'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Агафоник'
SET @NameOrigin = 'греч.'
SET @DetailName = 'благопобедитель' 
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%B3%D0%B0%D1%84%D0%BE%D0%BD%D0%B8%D0%BA_(%D0%A4%D0%B8%D0%BB%D0%B8%D0%BF%D0%BF%D0%BE%D1%82%D0%B8%D1%81)'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Агафоника'
SET @NameOrigin = 'греч.'
SET @DetailName = 'благопобедная' 
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://www.google.com/search?q=%D0%B8%D0%BC%D1%8F+%D0%90%D0%B3%D0%B0%D1%84%D0%BE%D0%BD%D0%B8%D0%BA%D0%B0+%D0%B2%D0%B8%D0%BA%D0%B8%D0%BF%D0%B5%D0%B4%D0%B8%D1%8F&sxsrf=ALiCzsbSrO_g4ViDa7Gvlj-AJg6Sq71PVw%3A1670358463829&ei=v6WPY7KSMpDbkgWDz7L4Cw&ved=0ahUKEwjy7YiX6uX7AhWQraQKHYOnDL8Q4dUDCA8&uact=5&oq=%D0%B8%D0%BC%D1%8F+%D0%90%D0%B3%D0%B0%D1%84%D0%BE%D0%BD%D0%B8%D0%BA%D0%B0+%D0%B2%D0%B8%D0%BA%D0%B8%D0%BF%D0%B5%D0%B4%D0%B8%D1%8F&gs_lcp=Cgxnd3Mtd2l6LXNlcnAQAzIFCAAQogQyBQgAEKIEMgUIABCiBDoICAAQogQQsANKBAhBGAFKBAhGGABQ0AdY0Adg8gtoAXAAeACAAV-IAV-SAQExmAEAoAECoAEByAEEwAEB&sclient=gws-wiz-serp'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Агафопод'
SET @NameOrigin = 'греч.'
SET @DetailName = 'доброногий' 
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://www.google.com/search?q=%D0%B8%D0%BC%D1%8F+%D0%90%D0%B3%D0%B0%D1%84%D0%BE%D0%BF%D0%BE%D0%B4+%D0%B2%D0%B8%D0%BA%D0%B8%D0%BF%D0%B5%D0%B4%D0%B8%D1%8F&sxsrf=ALiCzsZAJQ8Mog8yurn1yHThIQ3CN7RvfA%3A1670358538396&ei=CqaPY9DnF4HckgWrhI7gDQ&ved=0ahUKEwjQlNC66uX7AhUBrqQKHSuCA9wQ4dUDCA8&uact=5&oq=%D0%B8%D0%BC%D1%8F+%D0%90%D0%B3%D0%B0%D1%84%D0%BE%D0%BF%D0%BE%D0%B4+%D0%B2%D0%B8%D0%BA%D0%B8%D0%BF%D0%B5%D0%B4%D0%B8%D1%8F&gs_lcp=Cgxnd3Mtd2l6LXNlcnAQAzIFCAAQogQyBQgAEKIEOggIABCiBBCwA0oECEEYAUoECEYYAFDspwVY7KcFYJHFBWgCcAB4AIABaIgBaJIBAzAuMZgBAKABAqABAcgBA8ABAQ&sclient=gws-wiz-serp'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Агафопус'
SET @NameOrigin = 'греч.'
SET @DetailName = 'доброногий' 
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Агафья'
SET @NameOrigin = 'рус.'
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%B3%D0%B0%D1%84%D1%8C%D1%8F_(%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D1%8F)'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Аггей'
SET @NameOrigin = 'евр.'
SET @DetailName = 'торжественный, праздничный' 
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%B3%D0%B3%D0%B5%D0%B9_(%D0%BF%D1%80%D0%BE%D1%80%D0%BE%D0%BA)#:~:text=%D0%90%D0%B3%D0%B3%D0%B5%CC%81%D0%B9%20(%D0%B8%D0%B2%D1%80.,%D0%94%D0%B0%D1%80%D0%B8%D1%8F%20%D0%93%D0%B8%D1%81%D1%82%D0%B0%D1%81%D0%BF%D0%B0%20(520%20%D0%B4%D0%BE%20%D0%BD.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Аглаида'
SET @NameOrigin = ''
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wiktionary.org/wiki/%D0%90%D0%B3%D0%BB%D0%B0%D0%B8%D0%B4%D0%B0'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Аглаий'
SET @NameOrigin = 'греч.'
SET @DetailName = 'блестящий, блистающий'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Агн'
SET @NameOrigin = 'лат.'
SET @DetailName = 'агнец' 
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Агния'
SET @NameOrigin = 'греч.'
SET @DetailName = 'непорочная' 
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%B3%D0%BD%D0%B8%D1%8F#:~:text=%2D%D0%B3%D1%80%D0%B5%D1%87.,)%20%E2%80%94%20%D0%B8%D0%B3%D1%83%D0%BC%D0%B5%D0%BD%D1%8C%D1%8F%20%D0%9E%D1%81%D1%82%D0%B0%D1%88%D0%BA%D0%BE%D0%B2%D1%81%D0%BA%D0%BE%D0%B3%D0%BE%20%D0%97%D0%BD%D0%B0%D0%BC%D0%B5%D0%BD%D1%81%D0%BA%D0%BE%D0%B3%D0%BE%20%D0%BC%D0%BE%D0%BD%D0%B0%D1%81%D1%82%D1%8B%D1%80%D1%8F.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Агриппа'
SET @NameOrigin = ''
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%B3%D1%80%D0%B8%D0%BF%D0%BF%D0%B0_(%D0%B8%D0%BC%D1%8F)#:~:text=%D0%90%D0%B3%D1%80%D0%B8%CC%81%D0%BF%D0%BF%D0%B0%20%E2%80%94%20%D0%BC%D1%83%D0%B6%D1%81%D0%BA%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F%20%D0%BB%D0%B0%D1%82%D0%B8%D0%BD%D1%81%D0%BA%D0%BE%D0%B3%D0%BE%20%D0%BF%D1%80%D0%BE%D0%B8%D1%81%D1%85%D0%BE%D0%B6%D0%B4%D0%B5%D0%BD%D0%B8%D1%8F,%D0%9E%D1%82%D1%87%D0%B5%D1%81%D1%82%D0%B2%D0%B0%3A%20%D0%90%D0%B3%D1%80%D0%B8%D0%BF%D0%BF%D0%B8%D1%87%2C%20%D0%90%D0%B3%D1%80%D0%B8%D0%BF%D0%BF%D0%B8%D1%87%D0%BD%D0%B0.&text=%D0%9F%D1%80%D0%BE%D0%B8%D1%81%D1%85%D0%BE%D0%B4%D0%B8%D1%82%20%D0%BE%D1%82%20%D1%80%D0%B8%D0%BC%D1%81%D0%BA%D0%BE%D0%B3%D0%BE%20%D0%B8%D0%BC%D0%B5%D0%BD%D0%B8%20(%D0%BF%D1%80%D0%B5%D0%BD%D0%BE%D0%BC%D0%B5%D0%BD%D0%B0)%20Agrippa.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Агриппина'
SET @NameOrigin = ''
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%B3%D1%80%D0%B8%D0%BF%D0%BF%D0%B8%D0%BD%D0%B0#:~:text=%D0%90%D0%B3%D1%80%D0%B8%D0%BF%D0%BF%D0%B8%CC%81%D0%BD%D0%B0%20%E2%80%94%20%D0%B6%D0%B5%D0%BD%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BB%D0%B8%D1%87%D0%BD%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F%20%D0%BB%D0%B0%D1%82%D0%B8%D0%BD%D1%81%D0%BA%D0%BE%D0%B3%D0%BE%20%D0%BF%D1%80%D0%BE%D0%B8%D1%81%D1%85%D0%BE%D0%B6%D0%B4%D0%B5%D0%BD%D0%B8%D1%8F.&text=%D0%A4%D0%BE%D1%80%D0%BC%D0%B0%20%D0%BC%D1%83%D0%B6%D1%81%D0%BA%D0%BE%D0%B3%D0%BE%20%D1%84%D0%B0%D0%BC%D0%B8%D0%BB%D1%8C%D0%BD%D0%BE%D0%B3%D0%BE%20%D0%B8%D0%BC%D0%B5%D0%BD%D0%B8%20(%D0%BF%D1%80%D0%B5%D0%BD%D0%BE%D0%BC%D0%B5%D0%BD%D0%B0,%D0%BE%D0%B1%D0%BE%D0%B7%D0%BD%D0%B0%D1%87%D0%B0%D0%BB%D0%BE%20%D0%B4%D0%B5%D1%82%D0%B5%D0%B9%2C%20%D1%80%D0%BE%D0%B4%D0%B8%D0%B2%D1%88%D0%B8%D1%85%D1%81%D1%8F%20%D0%B2%D0%BF%D0%B5%D1%80%D0%B5%D0%B4%20%D0%BD%D0%BE%D0%B3%D0%B0%D0%BC%D0%B8.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Ада'
SET @NameOrigin = 'евр.'
SET @DetailName = 'украшающая жизнь'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%B4%D0%B0#:~:text=%D0%90%CC%81%D0%B4%D0%B0%20%E2%80%94%20%D0%B6%D0%B5%D0%BD%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BB%D0%B8%D1%87%D0%BD%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F%20%D0%B5%D0%B2%D1%80%D0%B5%D0%B9%D1%81%D0%BA%D0%BE%D0%B3%D0%BE,%2C%20%D1%83%D0%BA%D1%80%D0%B0%D1%88%D0%B0%D1%82%D1%8C%20%D1%81%D0%B5%D0%B1%D1%8F%3B%20%D1%83%D0%BA%D1%80%D0%B0%D1%88%D0%B0%D1%8E%D1%89%D0%B0%D1%8F%20%D0%B6%D0%B8%D0%B7%D0%BD%D1%8C.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Адам'
SET @NameOrigin = 'евр.'
SET @DetailName = 'красный человек, земля (почва)'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%B4%D0%B0%D0%BC_(%D0%B8%D0%BC%D1%8F)#:~:text=%D0%90%D0%B4%D0%B0%CC%81%D0%BC%20(%D0%BE%D1%82%20%D0%B8%D0%B2%D1%80.,%D1%80%D0%B0%D0%B7%D0%B3%D0%BE%D0%B2%D0%BE%D1%80%D0%BD%D0%BE%D0%B5%20%E2%80%94%20%D0%90%D0%B4%D0%B0%D0%BC%D1%8B%D1%87)%2C%20%D0%90%D0%B4%D0%B0%D0%BC%D0%BE%D0%B2%D0%BD%D0%B0.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Аделаида'
SET @NameOrigin = 'герм.'
SET @DetailName = 'благородная'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%B4%D0%B5%D0%BB%D0%B0%D0%B8%D0%B4%D0%B0_(%D0%B8%D0%BC%D1%8F)#:~:text=%D0%90%D0%B4%D0%B5%D0%BB%D0%B0%D0%B8%CC%81%D0%B4%D0%B0%20%E2%80%94%20%D0%B6%D0%B5%D0%BD%D1%81%D0%BA%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F%20Adelaide%20(%D1%84%D1%80,%D0%B2%D0%B8%D0%B4%2C%20%D1%80%D0%BE%D0%B4%2C%20%D0%BE%D0%B1%D1%80%D0%B0%D0%B7).'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Аделина'
SET @NameOrigin = 'герм.'
SET @DetailName = 'благородная'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%B4%D0%B5%D0%BB%D0%B8%D0%BD%D0%B0#:~:text=%D0%90%D0%B4%D0%B5%D0%BB%D0%B8%CC%81%D0%BD%D0%B0%20%E2%80%94%20%D0%B6%D0%B5%D0%BD%D1%81%D0%BA%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F%20%D0%B3%D0%B5%D1%80%D0%BC%D0%B0%D0%BD%D1%81%D0%BA%D0%BE%D0%B3%D0%BE%20%D0%BF%D1%80%D0%BE%D0%B8%D1%81%D1%85%D0%BE%D0%B6%D0%B4%D0%B5%D0%BD%D0%B8%D1%8F,%D0%98%D0%BC%D0%B5%D0%B5%D1%82%20%D0%BC%D1%83%D0%B6%D1%81%D0%BA%D0%BE%D0%B9%20%D0%B2%D0%B0%D1%80%D0%B8%D0%B0%D0%BD%D1%82%20%D0%90%D0%B4%D0%B5%D0%BB%D0%B8%D0%BD%20(%D0%BB%D0%B0%D1%82.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Адриан'
SET @NameOrigin = 'лат.'
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%B4%D1%80%D0%B8%D0%B0%D0%BD_(%D0%B8%D0%BC%D1%8F)#:~:text=%D0%90%D0%B4%D1%80%D0%B8%D0%B0%CC%81%D0%BD%20%E2%80%94%20%D0%BB%D0%B0%D1%82%D0%B8%D0%BD%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BC%D1%83%D0%B6%D1%81%D0%BA%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F%2C%20%D0%BF%D1%80%D0%BE%D0%B8%D0%B7%D0%BE%D1%88%D0%B5%D0%B4%D1%88%D0%B5%D0%B5,%D0%98%D0%BC%D0%B5%D0%B5%D1%82%20%D0%B6%D0%B5%D0%BD%D1%81%D0%BA%D1%83%D1%8E%20%D1%84%D0%BE%D1%80%D0%BC%D1%83%20%E2%80%94%20%D0%90%D0%B4%D1%80%D0%B8%D0%B0%D0%BD%D0%B0.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Аза'
SET @NameOrigin = ''
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%B7%D0%B0_(%D0%B8%D0%BC%D1%8F)#:~:text=%D0%90%D0%B7%D0%B0%20%E2%80%94%20%D0%B8%D0%BC%D1%8F%2C%20%D0%B2%D1%8B%D1%81%D1%82%D1%83%D0%BF%D0%B0%D0%B5%D1%82%20%D0%B2%20%D0%BA%D0%B0%D1%87%D0%B5%D1%81%D1%82%D0%B2%D0%B5,%D1%81%D0%BE%20%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%D0%BC%20%C2%AB%D1%83%D1%82%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D0%B5%C2%BB).&text=%D0%92%20%D1%85%D1%80%D0%B8%D1%81%D1%82%D0%B8%D0%B0%D0%BD%D1%81%D0%BA%D0%BE%D0%BC%20%D0%B8%D0%BC%D0%B5%D0%BD%D0%BE%D1%81%D0%BB%D0%BE%D0%B2%D0%B5%20%D0%B8%D0%BC%D1%8F%20%D0%90%D0%B7%D0%B0%20%D1%81%D0%BE%D0%BE%D1%82%D0%BD%D0%BE%D1%81%D0%B8%D1%82%D1%81%D1%8F%20%D1%81%D0%BE%20%D1%81%D0%B2%D1%8F%D1%82%D0%BE%D0%B9%20%D0%BC%D1%83%D1%87%D0%B5%D0%BD%D0%B8%D1%86%D0%B5%D0%B9%20%D0%90%D0%B7%D0%BE%D0%B9.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Азадан'
SET @NameOrigin = 'перс.'
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://www.google.com/search?q=%D0%B8%D0%BC%D1%8F+%D0%90%D0%B7%D0%B0%D0%B4%D0%B0%D0%BD+%D0%B2%D0%B8%D0%BA%D0%B8%D0%BF%D0%B5%D0%B4%D0%B8%D1%8F&sxsrf=ALiCzsbx8UDJxFSQ1etHfyRanxMKCA6Fiw%3A1670360985102&ei=ma-PY57xBY_3kgWwgp3oAg&ved=0ahUKEwjeoafJ8-X7AhWPu6QKHTBBBy0Q4dUDCA8&uact=5&oq=%D0%B8%D0%BC%D1%8F+%D0%90%D0%B7%D0%B0%D0%B4%D0%B0%D0%BD+%D0%B2%D0%B8%D0%BA%D0%B8%D0%BF%D0%B5%D0%B4%D0%B8%D1%8F&gs_lcp=Cgxnd3Mtd2l6LXNlcnAQAzIICAAQCBAeEA06CggAEEcQ1gQQsANKBAhBGABKBAhGGABQsRNYsRNgnRxoAnABeACAAW6IAW6SAQMwLjGYAQCgAQKgAQHIAQjAAQE&sclient=gws-wiz-serp'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Азарий'
SET @NameOrigin = 'евр.'
SET @DetailName = 'помощь Божья'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%B7%D0%B0%D1%80%D0%B8%D1%8F#:~:text=%D0%90%D0%B7%D0%B0%D1%80%D0%B8%D0%B9%20(%D0%BD%D0%B0%D1%81%D1%82%D0%BE%D1%8F%D1%89%D0%B5%D0%B5%20%D0%B8%D0%BC%D1%8F%20%D0%97%D0%B0%D1%85%D0%B0%D1%80%D0%B8%D1%8F%20%D0%9A%D0%BE%D0%BF%D1%8B%D1%81%D1%82%D0%B5%D0%BD%D1%81%D0%BA%D0%B8%D0%B9,%D0%9F%D0%B5%D1%87%D0%B5%D1%80%D1%81%D0%BA%D0%BE%D0%B9%20%D0%BB%D0%B0%D0%B2%D1%80%D1%8B%20%D1%81%201624%20%D0%B3%D0%BE%D0%B4%D0%B0.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Азат'
SET @NameOrigin = 'перс.'
SET @DetailName = 'дворянин'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%B7%D0%B0%D1%82#:~:text=%D0%90%D0%B7%D0%B0%CC%81%D1%82%2C%20%D0%90%D0%B7%D0%B0%CC%81%D0%B4%20%E2%80%94%20%D0%BC%D1%83%D0%B6%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BB%D0%B8%D1%87%D0%BD%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F,%D0%B8%20%D0%BF%D0%B5%D1%80%D0%B5%D0%B2%D0%BE%D0%B4%D0%B8%D1%82%D1%81%D1%8F%20%D0%BA%D0%B0%D0%BA%20%C2%AB%D1%81%D0%B2%D0%BE%D0%B1%D0%BE%D0%B4%D0%BD%D1%8B%D0%B9%C2%BB.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Аифал'
SET @NameOrigin = 'перс.'
SET @DetailName = 'принес Богу'

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%BA%D0%B5%D0%BF%D1%81%D0%B8%D0%B9_%D0%B8_%D0%90%D0%B8%D1%84%D0%B0%D0%BB'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Акакий'
SET @NameOrigin = 'греч.'
SET @DetailName = 'незлобивый'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%BA%D0%B0%D0%BA%D0%B8%D0%B9#:~:text=%2D%D0%B3%D1%80%D0%B5%D1%87.,%C2%AB%D0%B1%D0%B5%D0%B7%2D%C2%BB%20%2B%20%D0%B4%D1%80.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Акепсий'
SET @NameOrigin = ''
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%BA%D0%B5%D0%BF%D1%81%D0%B8%D0%B9_%D0%B8_%D0%90%D0%B8%D1%84%D0%B0%D0%BB#:~:text=%D0%90%D0%BA%D0%B5%D0%BF%D1%81%D0%B8%D0%B9%20(%D0%B3%D1%80%D0%B5%D1%87.,%D0%B4%D0%B5%D0%BA%D0%B0%D0%B1%D1%80%D1%8F%20(%D0%BF%D0%BE%20%D1%8E%D0%BB%D0%B8%D0%B0%D0%BD%D1%81%D0%BA%D0%BE%D0%BC%D1%83%20%D0%BA%D0%B0%D0%BB%D0%B5%D0%BD%D0%B4%D0%B0%D1%80%D1%8E).'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Акепсим'
SET @NameOrigin = 'перс.'
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%BA%D0%B5%D0%BF%D1%81%D0%B8%D0%BC%D0%B0#:~:text=%D0%90%D0%BA%D0%B5%D0%BF%D1%81%D0%B8%CC%81%D0%BC%D0%B0%20%D0%B8%D0%BB%D0%B8%20%D0%90%D0%BA%D0%B5%D0%BF%D1%81%D0%B8%CC%81%D0%BC%20(%D0%B4%D1%80.,%D0%BE%D1%82%D0%B4%D0%B5%D0%BB%D1%8C%D0%BD%D0%BE%20%D0%B5%D0%B3%D0%BE%20%D0%BF%D0%B0%D0%BC%D1%8F%D1%82%D1%8C%20%E2%80%94%2029%20%D1%8F%D0%BD%D0%B2%D0%B0%D1%80%D1%8F.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Акила'
SET @NameOrigin = 'лат.'
SET @DetailName = 'орел'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%BA%D0%B8%D0%BB%D0%B0#:~:text=%D0%90%D0%BA%D0%B8%D0%BB%D0%B0%20(%D0%B0%D0%BF%D0%BE%D1%81%D1%82%D0%BE%D0%BB%20%D0%BE%D1%82%2070)%20%E2%80%94,%D0%90%D0%BA%D0%B8%D0%BB%D0%B0%20%D0%9F%D0%B5%D1%87%D0%B5%D1%80%D1%81%D0%BA%D0%B8%D0%B9%20%E2%80%94%20%D0%BF%D1%80%D0%B0%D0%B2%D0%BE%D1%81%D0%BB%D0%B0%D0%B2%D0%BD%D1%8B%D0%B9%20%D0%B4%D0%B8%D0%B0%D0%BA%D0%BE%D0%BD.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Акилина'
SET @NameOrigin = 'греч.'
SET @DetailName = 'орлица'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%BA%D0%B8%D0%BB%D0%B8%D0%BD%D0%B0#:~:text=%D0%90%D0%BA%D0%B8%D0%BB%D0%B8%CC%81%D0%BD%D0%B0%20%D0%B8%D0%BD%D0%B0%D1%87%D0%B5%20%D0%90%D0%BA%D0%B2%D0%B8%D0%BB%D0%B8%CC%81%D0%BD%D0%B0%20(%D0%BB%D0%B0%D1%82.,%D0%BD%D0%B0%20%D0%A0%D1%83%D1%81%D0%B8%20%D0%BF%D1%80%D0%B8%D0%BD%D1%8F%D0%B2%D1%88%D0%B5%D0%B5%20%D1%84%D0%BE%D1%80%D0%BC%D1%83%20%D0%90%D0%BA%D1%83%D0%BB%D0%B8%D0%BD%D0%B0.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Акиндин'
SET @NameOrigin = 'греч.'
SET @DetailName = 'безопасный'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%BA%D0%B8%D0%BD%D0%B4%D0%B8%D0%BD#:~:text=%D0%90%D0%BA%D0%B8%D0%BD%D0%B4%D0%B8%D0%BD%20%E2%80%94%20%D0%BC%D1%83%D0%B6%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BB%D0%B8%D1%87%D0%BD%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F%20%D0%B3%D1%80%D0%B5%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B3%D0%BE,%CE%B1%CE%BA%CE%AF%CE%BD%CE%B4%CF%85%CE%BD%CE%BF%CF%82%20%E2%80%94%20%C2%AB%D0%B1%D0%B5%D0%B7%D0%BE%D0%BF%D0%B0%D1%81%D0%BD%D1%8B%D0%B9%C2%BB).&text=%D0%9D%D0%B0%20%D0%A0%D1%83%D1%81%D1%8C%20%D0%BF%D1%80%D0%B8%D1%88%D0%BB%D0%BE%20%D0%B8%D0%B7%20%D0%92%D0%B8%D0%B7%D0%B0%D0%BD%D1%82%D0%B8%D0%B8,%D1%81%D1%82%D0%B0%D1%82%D0%B8%D1%81%D1%82%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%B8%D1%85%20%D0%BF%D0%BE%D0%B4%D1%81%D1%87%D1%91%D1%82%D0%B0%D1%85%20%D0%B8%D0%BC%D1%91%D0%BD%20%D0%BD%D0%BE%D0%B2%D0%BE%D1%80%D0%BE%D0%B6%D0%B4%D1%91%D0%BD%D0%BD%D1%8B%D1%85%20%D0%92.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Акутион'
SET @NameOrigin = 'лат.'
SET @DetailName = 'острый'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Алевтина'
SET @NameOrigin = 'лат.'
SET @DetailName = 'сильная'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%BB%D0%B5%D0%B2%D1%82%D0%B8%D0%BD%D0%B0#:~:text=%D0%90%D0%BB%D0%B5%D0%B2%D1%82%D0%B8%CC%81%D0%BD%D0%B0%20%E2%80%94%20%D0%B6%D0%B5%D0%BD%D1%81%D0%BA%D0%BE%D0%B5%20%D1%80%D1%83%D1%81%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BB%D0%B8%D1%87%D0%BD%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F,%D1%86%D0%B5%D1%80%D0%BA%D0%BE%D0%B2%D0%BD%D0%BE%D0%B3%D0%BE%20%D0%B8%D0%BC%D0%B5%D0%BD%D0%B8%20%D0%A3%D0%B0%D0%BB%D0%B5%D0%BD%D1%82%D0%B8%D0%BD%D0%B0%20(%D0%92%D0%B0%D0%BB%D0%B5%D0%BD%D1%82%D0%B8%D0%BD%D0%B0).&text=%D0%9D%D0%B0%20%D0%A0%D1%83%D1%81%D1%8C%20%D0%BF%D0%BE%D0%BF%D0%B0%D0%BB%D0%BE%20%D1%81%20%D1%85%D1%80%D0%B8%D1%81%D1%82%D0%B8%D0%B0%D0%BD%D1%81%D1%82%D0%B2%D0%BE%D0%BC%20%D0%B8%D0%B7%20%D0%92%D0%B8%D0%B7%D0%B0%D0%BD%D1%82%D0%B8%D0%B8.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Александр'
SET @NameOrigin = 'греч.'
SET @DetailName = 'защитник людей'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%BB%D0%B5%D0%BA%D1%81%D0%B0%D0%BD%D0%B4%D1%80'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Александра'
SET @NameOrigin = 'греч.'
SET @DetailName = 'мужественная'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%BB%D0%B5%D0%BA%D1%81%D0%B0%D0%BD%D0%B4%D1%80%D0%B0'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Алексей'
SET @NameOrigin = 'греч.'
SET @DetailName = 'защитник'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%BB%D0%B5%D0%BA%D1%81%D0%B5%D0%B9'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Алексий'
SET @NameOrigin = 'греч.'
SET @DetailName = 'защитник'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%BB%D0%B5%D0%BA%D1%81%D0%B5%D0%B9#:~:text=%D0%BE%D0%B1%D1%80%D0%B0%D0%B7%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B3%D0%BE%20%D0%BE%D1%82%20%D0%B4%D1%80.-,%2D%D0%B3%D1%80%D0%B5%D1%87.,%D0%BE%D1%82%D1%80%D0%B0%D0%B6%D0%B0%D1%82%D1%8C%C2%BB%2C%20%C2%AB%D0%BF%D1%80%D0%B5%D0%B4%D0%BE%D1%82%D0%B2%D1%80%D0%B0%D1%89%D0%B0%D1%82%D1%8C%C2%BB.&text=%D0%98%D0%BC%D1%8F%20%D1%8F%D0%B2%D0%BB%D1%8F%D0%B5%D1%82%D1%81%D1%8F%20%D0%BE%D0%B4%D0%BD%D0%B8%D0%BC%20%D0%B8%D0%B7%20%D0%B4%D1%80%D0%B5%D0%B2%D0%BD%D0%B5%D0%B9%D1%88%D0%B8%D1%85,%D0%90%EE%80%80%D0%BB%D0%B5%D1%AF%D1%96%CC%81%D0%B9%20(%D0%90%D0%BB%D0%B5%D0%BA%D1%81%D0%B8%CC%81%D0%B9).'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Алексина'
SET @NameOrigin = ''
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wiktionary.org/wiki/%D0%90%D0%BB%D0%B5%D0%BA%D1%81%D0%B8%D0%BD%D0%B0'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Алим'
SET @NameOrigin = 'араб.'
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%BB%D0%B8%D0%BC'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Алина'
SET @NameOrigin = 'рус.'
SET @DetailName = 'благодарная'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%BB%D0%B8%D0%BD%D0%B0#:~:text=Alina%20%D0%B8%D0%BC%D0%B5%D0%B5%D1%82%20%D0%B0%D1%80%D0%B0%D0%B1%D1%81%D0%BA%D0%B8%D0%B5%20%D0%BA%D0%BE%D1%80%D0%BD%D0%B8%20%D0%B8,%D0%BA%20%D0%BC%D1%83%D0%B6%D1%81%D0%BA%D0%BE%D0%BC%D1%83%20%D0%90%D0%BB%D0%B8%D1%81%D1%82%D0%B5%D1%80%20(Alistair).'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Алипий'
SET @NameOrigin = 'греч.'
SET @DetailName = 'беспечальный'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%BB%D0%B8%D0%BF%D0%B8%D0%B9#:~:text=%2D%C2%BB%20%2B%20%D0%B4%D1%80.-,%2D%D0%B3%D1%80%D0%B5%D1%87.,)%20%E2%80%94%20%D0%BC%D1%83%D0%B6%D1%81%D0%BA%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F%20%D0%B3%D1%80%D0%B5%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B3%D0%BE%20%D0%BF%D1%80%D0%BE%D0%B8%D1%81%D1%85%D0%BE%D0%B6%D0%B4%D0%B5%D0%BD%D0%B8%D1%8F.&text=%D0%96%D0%B5%D0%BD%D1%81%D0%BA%D0%B8%D0%B9%20%D0%B2%D0%B0%D1%80%D0%B8%D0%B0%D0%BD%D1%82%20%D0%B8%D0%BC%D0%B5%D0%BD%D0%B8%20%E2%80%94%20%D0%90%D0%BB%D0%B8%D0%BF%D0%B8%D1%8F.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Алиса'
SET @NameOrigin = 'герм.'
SET @DetailName = 'благородная'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%BB%D0%B8%D1%81%D0%B0_(%D0%B8%D0%BC%D1%8F)#:~:text=%D0%90%D0%BB%D0%B8%CC%81%D1%81%D0%B0%20%E2%80%94%20%D0%B6%D0%B5%D0%BD%D1%81%D0%BA%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F%2C%20%D0%B2%D0%BE%D1%81%D1%85%D0%BE%D0%B4%D0%B8%D1%82%20%D0%BA,%D0%A1%D1%82%D1%80%D0%B0%D0%BD%D0%B5%20%D1%87%D1%83%D0%B4%D0%B5%D1%81%C2%BB%20(1865).'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Алла'
SET @NameOrigin = 'греч.'
SET @DetailName = 'умеющая всё'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%BB%D0%BB%D0%B0#:~:text=%D0%90%D0%BB%D0%BB%D0%B0%20%D0%B2%20%D0%BF%D0%B5%D1%80%D0%B5%D0%B2%D0%BE%D0%B4%D0%B5%20%D1%81%20%D0%B3%D0%BE%D1%82%D1%81%D0%BA%D0%BE%D0%B3%D0%BE,%C2%AB%D0%BC%D0%B0%D1%81%D1%82%D0%B5%D1%80%D0%B8%D1%86%D0%B0%20%D0%BD%D0%B0%20%D0%B2%D1%81%D0%B5%20%D1%80%D1%83%D0%BA%D0%B8%C2%BB.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Алфей'
SET @NameOrigin = 'евр.'
SET @DetailName = 'перемена'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%BB%D1%84%D0%B5%D0%B9#:~:text=%D0%90%D0%BB%D1%84%D0%B5%D0%B9%20%E2%80%94%20%D0%BC%D1%83%D0%B6%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BB%D0%B8%D1%87%D0%BD%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F%20%D0%B3%D1%80%D0%B5%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B3%D0%BE,%D0%90%D0%BB%D1%84%D0%B5%D0%B9%20%D0%9C%D0%B8%D1%82%D0%B8%D0%BB%D0%B5%D0%BD%D1%81%D0%BA%D0%B8%D0%B9'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Алфий'
SET @NameOrigin = ''
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Альбин'
SET @NameOrigin = ''
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%BB%D1%8C%D0%B1%D0%B8%D0%BD'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Альвиан'
SET @NameOrigin = 'греч.'
SET @DetailName = 'богатый'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%BB%D1%8C%D0%B2%D0%B8%D0%B0%D0%BD'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Альфред'
SET @NameOrigin = 'англ.'
SET @DetailName = 'эльф-советник'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%BB%D1%8C%D1%84%D1%80%D0%B5%D0%B4'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Амалия'
SET @NameOrigin = 'евр.'
SET @DetailName = 'труд'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://wiki5.ru/wiki/Amalia_(given_name)'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Амандин'
SET @NameOrigin = ''
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Амвросий'
SET @NameOrigin = 'греч.'
SET @DetailName = 'бессмертный'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%BC%D0%B2%D1%80%D0%BE%D1%81%D0%B8%D0%B9'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Аменония'
SET @NameOrigin = ''
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Аммия'
SET @NameOrigin = ''
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Аммон'
SET @NameOrigin = 'егип.'
SET @DetailName = 'незримый'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%BC%D0%BE%D0%BD#:~:text=%E1%BC%8C%CE%BC%CE%BC%CF%89%CE%BD%3B%20%D0%90%D0%BC%D0%BC%D0%BE%D0%BD)%20%E2%80%94%20%D0%B8%D0%BC%D1%8F%20%D0%97%D0%B5%D0%B2%D1%81%D0%B0,%D0%95%D0%B3%D0%BE%20%D0%B6%D0%B8%D0%B2%D0%BE%D1%82%D0%BD%D0%BE%D0%B5%20%E2%80%94%20%D0%B1%D0%B0%D1%80%D0%B0%D0%BD.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Аммоний'
SET @NameOrigin = 'егип.'
SET @DetailName = 'незримый'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%BC%D0%BC%D0%BE%D0%BD%D0%B8%D0%B9_%D0%9B%D0%B8%D1%82%D0%BE%D1%82%D0%BE%D0%BC%D0%B8%D1%81%D1%82'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Аммун'
SET @NameOrigin = 'егип.'
SET @DetailName = 'песчаный'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikinews.org/wiki/%D0%9A%D0%B0%D1%82%D0%B5%D0%B3%D0%BE%D1%80%D0%B8%D1%8F:%D0%90%D0%BC%D0%BC%D1%83%D0%BD_(%D0%B8%D0%BC%D1%8F)'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Амонит'
SET @NameOrigin = 'рус.'
SET @DetailName = 'безукоризненный'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Амос'
SET @NameOrigin = 'евр.'
SET @DetailName = 'крепкий'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%BC%D0%BE%D1%81#:~:text=%D0%90%D0%BC%D0%BE%CC%81%D1%81%20(%D0%BE%D1%82%20%D0%B8%D0%B2%D1%80.,%D1%82%D0%B0%D0%BA%D0%B6%D0%B5%3A%20%D0%9A%D0%BD%D0%B8%D0%B3%D0%B0%20%D0%BF%D1%80%D0%BE%D1%80%D0%BE%D0%BA%D0%B0%20%D0%90%D0%BC%D0%BE%D1%81%D0%B0).'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Амплий'
SET @NameOrigin = 'лат.'
SET @DetailName = 'большой'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%BC%D0%BF%D0%BB%D0%B8%D0%B9#:~:text=%E1%BC%88%CE%BC%CF%80%CE%BB%CE%AF%CE%B1%CF%82%20%E2%80%94%20%C2%AB%D0%B1%D0%BE%D0%BB%D1%8C%D1%88%D0%BE%D0%B9%C2%BB%2C%20%C2%AB,31%20%D0%BE%D0%BA%D1%82%D1%8F%D0%B1%D1%80%D1%8F%20(13%20%D0%BD%D0%BE%D1%8F%D0%B1%D1%80%D1%8F).&text=%D0%A3%D0%BF%D0%BE%D0%BC%D0%B8%D0%BD%D0%B0%D0%B5%D1%82%D1%81%D1%8F%20%D1%83%20%D0%B0%D0%BF%D0%BE%D1%81%D1%82%D0%BE%D0%BB%D0%B0%20%D0%9F%D0%B0%D0%B2%D0%BB%D0%B0%20%D0%B2,16%3A8).'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Амфиан'
SET @NameOrigin = 'греч.'
SET @DetailName = 'окружной'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikinews.org/wiki/%D0%9A%D0%B0%D1%82%D0%B5%D0%B3%D0%BE%D1%80%D0%B8%D1%8F:%D0%90%D0%BC%D1%84%D0%B8%D0%B0%D0%BD_(%D0%B8%D0%BC%D1%8F)'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Амфил'
SET @NameOrigin = ''
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Амфилохий'
SET @NameOrigin = 'греч.'
SET @DetailName = 'труднородный'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%BC%D1%84%D0%B8%D0%BB%D0%BE%D1%85%D0%B8%D0%B9#:~:text=%D0%90%D0%BC%D1%84%D0%B8%D0%BB%D0%BE%CC%81%D1%85%D0%B8%D0%B9%20(%D0%B3%D1%80%D0%B5%D1%87.,)%20%E2%80%94%20%D0%BC%D1%83%D0%B6%D1%81%D0%BA%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F%20%D0%B3%D1%80%D0%B5%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B3%D0%BE%20%D0%BF%D1%80%D0%BE%D0%B8%D1%81%D1%85%D0%BE%D0%B6%D0%B4%D0%B5%D0%BD%D0%B8%D1%8F.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Ананий'
SET @NameOrigin = 'евр.'
SET @DetailName = 'милость Господня'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://wikipedia.tel/%D0%90%D0%BD%D0%B0%D0%BD%D0%B8%D1%8F_(%D0%B8%D0%BC%D1%8F)'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Анания'
SET @NameOrigin = 'евр.'
SET @DetailName = 'милость Господня'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%BD%D0%B0%D0%BD%D0%B8%D1%8F#:~:text=%D0%90%D0%BD%D0%B0%CC%81%D0%BD%D0%B8%D1%8F%20(%D0%B8%D0%B2%D1%80.,%D0%B0%D0%BF%D0%BE%D1%81%D1%82%D0%BE%D0%BB%D0%BE%D0%B2%2C%20%D0%B5%D0%BF%D0%B8%D1%81%D0%BA%D0%BE%D0%BF%20%D0%94%D0%B0%D0%BC%D0%B0%D1%81%D1%81%D0%BA%D0%B8%D0%B9%2C%20%D1%81%D0%B2%D1%8F%D1%89%D0%B5%D0%BD%D0%BD%D0%BE%D0%BC%D1%83%D1%87%D0%B5%D0%BD%D0%B8%D0%BA.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Анастасий'
SET @NameOrigin = 'греч.'
SET @DetailName = 'воскрешенный'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%BD%D0%B0%D1%81%D1%82%D0%B0%D1%81%D0%B8%D0%B9'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Анастасия'
SET @NameOrigin = 'греч.'
SET @DetailName = 'воскресшая'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%BD%D0%B0%D1%81%D1%82%D0%B0%D1%81%D0%B8%D1%8F'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Анатолий'
SET @NameOrigin = 'греч.'
SET @DetailName = 'восточный'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%BD%D0%B0%D1%82%D0%BE%D0%BB%D0%B8%D0%B9'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Анатолия'
SET @NameOrigin = 'греч.'
SET @DetailName = 'восточная'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%BD%D0%B0%D1%82%D0%BE%D0%BB%D0%B8%D1%8F_(%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D1%8F)'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Ангелина'
SET @NameOrigin = 'греч.'
SET @DetailName = 'вестница'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%BD%D0%B3%D0%B5%D0%BB%D0%B8%D0%BD%D0%B0#:~:text=%D0%90%D0%BD%D0%B3%D0%B5%D0%BB%D0%B8%CC%81%D0%BD%D0%B0%20%E2%80%94%20%D0%B6%D0%B5%D0%BD%D1%81%D0%BA%D0%BE%D0%B5%20%D1%80%D1%83%D1%81%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BB%D0%B8%D1%87%D0%BD%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F,%D0%B8%D0%B7%20%D1%8D%D0%BF%D0%B8%D1%82%D0%B5%D1%82%D0%BE%D0%B2%20%D0%97%D0%B5%D0%B2%D1%81%D0%B0%20%D0%B8%20%D0%90%D1%80%D1%82%D0%B5%D0%BC%D0%B8%D0%B4%D1%8B.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Ангеляр'
SET @NameOrigin = 'греч.'
SET @DetailName = 'вестник'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'http://wiki-org.ru/wiki/%D0%90%D0%BD%D0%B3%D0%B5%D0%BB%D1%8F%D1%80'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Ангий'
SET @NameOrigin = 'греч.'
SET @DetailName = 'сосуд'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Андрей'
SET @NameOrigin = 'греч.'
SET @DetailName = 'мужественный'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%BD%D0%B4%D1%80%D0%B5%D0%B9'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Андроник'
SET @NameOrigin = 'греч.'
SET @DetailName = 'победитель мужей'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%BD%D0%B4%D1%80%D0%BE%D0%BD%D0%B8%D0%BA_(%D0%B8%D0%BC%D1%8F)#:~:text=%D0%98%D0%BC%D0%B5%D0%B5%D1%82%20%D0%B3%D1%80%D0%B5%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BF%D1%80%D0%BE%D0%B8%D1%81%D1%85%D0%BE%D0%B6%D0%B4%D0%B5%D0%BD%D0%B8%D0%B5%2C%20%D0%BF%D0%B5%D1%80%D0%B5%D0%B2%D0%BE%D0%B4%D0%B8%D1%82%D1%81%D1%8F%20%D0%BA%D0%B0%D0%BA,%D0%B8%D0%B7%20%D0%BD%D0%B8%D1%85%20%D1%81%D1%82%D0%B0%D0%BB%20%D0%90%D0%BD%D0%B4%D1%80%D0%BE%D0%BD%D0%B8%D0%BA%20%D0%9F%D0%B0%D0%BD%D0%BD%D0%BE%D0%BD%D1%81%D0%BA%D0%B8%D0%B9.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Анект'
SET @NameOrigin = 'греч.'
SET @DetailName = 'сносный'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Анемподист'
SET @NameOrigin = 'греч.'
SET @DetailName = 'беспрепятственный' 
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Аникита'
SET @NameOrigin = 'греч.'
SET @DetailName = 'непобедимый'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%BD%D0%B8%D0%BA%D0%B8%D1%82%D0%B0'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Анимаиса'
SET @NameOrigin = ''
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Анин'
SET @NameOrigin = ''
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wiktionary.org/wiki/%D0%90%D0%BD%D0%B8%D0%BD'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Анисим'
SET @NameOrigin = 'лат.'
SET @DetailName = 'полезный'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%BD%D0%B8%D1%81%D0%B8%D0%BC_(%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D1%8F)'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Анисия'
SET @NameOrigin = 'греч.'
SET @DetailName = 'успех'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%BD%D0%B8%D1%81%D0%B8%D1%8F'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Анна'
SET @NameOrigin = 'евр.'
SET @DetailName = 'благодать'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%BD%D0%BD%D0%B0_(%D0%B8%D0%BC%D1%8F)'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Антиох'
SET @NameOrigin = 'греч.'
SET @DetailName = 'сопротивляющийся'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%BD%D1%82%D0%B8%D0%BE%D1%85#:~:text=%D0%90%D0%BD%D1%82%D0%B8%D0%BE%CC%81%D1%85%20(%D0%B4%D1%80.,%D0%96%D0%B5%D0%BD%D1%81%D0%BA%D0%B0%D1%8F%20%D1%84%D0%BE%D1%80%D0%BC%D0%B0%20%D0%B8%D0%BC%D0%B5%D0%BD%D0%B8%20%E2%80%94%20%D0%90%D0%BD%D1%82%D0%B8%D0%BE%D1%85%D0%B8%D0%B4%D0%B0.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Антипа'
SET @NameOrigin = 'греч.'
SET @DetailName = 'крепкий' 
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%BD%D1%82%D0%B8%D0%BF%D0%B0'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Антипатр'
SET @NameOrigin = 'греч.'
SET @DetailName = 'как отец'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%BD%D1%82%D0%B8%D0%BF%D0%B0%D1%82%D1%80#:~:text=%CE%91%CE%BD%CF%84%CE%AF%CF%80%CE%B1%CF%84%CF%81%CE%BF%CF%82)%20%E2%80%94%20%D0%B3%D1%80%D0%B5%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F.,%D0%BF%D1%80%D0%B0%D0%B2%D0%B8%D1%82%D0%B5%D0%BB%D1%8C%20%D0%98%D1%83%D0%B4%D0%B5%D0%B8%2C%20%D0%BE%D1%81%D0%BD%D0%BE%D0%B2%D0%B0%D1%82%D0%B5%D0%BB%D1%8C%20%D0%B4%D0%B8%D0%BD%D0%B0%D1%81%D1%82%D0%B8%D0%B8%20%D0%98%D1%80%D0%BE%D0%B4%D0%B8%D0%B0%D0%B4.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Антон'
SET @NameOrigin = 'рус.'
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%BD%D1%82%D0%BE%D0%BD'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Антоний'
SET @NameOrigin = 'греч.'
SET @DetailName = 'приобретение взамен'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%BD%D1%82%D0%BE%D0%BD%D0%B8%D0%B9#:~:text=Antonius)%20%E2%80%94%20%D0%BC%D1%83%D0%B6%D1%81%D0%BA%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F%20%D0%BB%D0%B0%D1%82%D0%B8%D0%BD%D1%81%D0%BA%D0%BE%D0%B3%D0%BE%20%D0%BF%D1%80%D0%BE%D0%B8%D1%81%D1%85%D0%BE%D0%B6%D0%B4%D0%B5%D0%BD%D0%B8%D1%8F,%2C%2083%2D30%20%D0%B4%D0%BE%20%D0%BD.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Антонин'
SET @NameOrigin = 'рус.'
SET @DetailName = 'вступать в бой'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%BD%D1%82%D0%BE%D0%BD%D0%B8%D0%BD#:~:text=%D0%90%D0%BD%D1%82%D0%BE%D0%BD%D0%B8%CC%81%D0%BD%20%E2%80%94%20%D0%BC%D1%83%D0%B6%D1%81%D0%BA%D0%BE%D0%B5%20%D1%80%D1%83%D1%81%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BB%D0%B8%D1%87%D0%BD%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F,%D0%B8%D0%B7%20%D0%B2%D0%B5%D1%80%D1%81%D0%B8%D0%B9%2C%20%D1%81%20%D1%8D%D1%82%D1%80%D1%83%D1%81%D1%81%D0%BA%D0%B8%D0%BC%20%D1%8F%D0%B7%D1%8B%D0%BA%D0%BE%D0%BC.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Антонина'
SET @NameOrigin = 'рус.'
SET @DetailName = 'вступать в бой'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%BD%D1%82%D0%BE%D0%BD%D0%B8%D0%BD%D0%B0'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Анувий'
SET @NameOrigin = 'егип.'
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Анфим'
SET @NameOrigin = 'греч.'
SET @DetailName = 'покрытый цветами'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'http://wiki-org.ru/wiki/%D0%90%D0%BD%D1%84%D0%B8%D0%BC'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Анфиса'
SET @NameOrigin = 'греч.'
SET @DetailName = 'цветущая'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%BD%D1%84%D0%B8%D1%81%D0%B0_(%D0%B8%D0%BC%D1%8F)#:~:text=%D0%90%D0%BD%D1%84%D0%B8%CC%81%D1%81%D0%B0%20(%D0%B4%D1%80.,%E2%80%94%20%C2%AB%D1%86%D0%B2%D0%B5%D1%81%D1%82%D0%B8%2C%20%D1%86%D0%B2%D0%B5%D1%82%D0%B5%D0%BD%D0%B8%D0%B5%C2%BB.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Анфия'
SET @NameOrigin = ''
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Анфуса'
SET @NameOrigin = 'греч.'
SET @DetailName = 'цветок'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%BD%D1%84%D0%B8%D1%81%D0%B0_(%D0%B8%D0%BC%D1%8F)#:~:text=%D0%90%D0%BD%D1%84%D0%B8%CC%81%D1%81%D0%B0%20(%D0%B4%D1%80.,%D1%80%D1%83%D1%81%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BB%D0%B8%D1%87%D0%BD%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F%20%D0%B3%D1%80%D0%B5%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B3%D0%BE%20%D0%BF%D1%80%D0%BE%D0%B8%D1%81%D1%85%D0%BE%D0%B6%D0%B4%D0%B5%D0%BD%D0%B8%D1%8F.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Апеллий'
SET @NameOrigin = 'греч.'
SET @DetailName = 'относящийся к собранию'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%BF%D0%B5%D0%BB%D0%BB%D0%B8%D0%B9#:~:text=%D0%90%D0%BF%D0%B5%CC%81%D0%BB%D0%BB%D0%B8%D0%B9%20(%D0%90%D0%BF%D0%B5%D0%BB%D0%BB%D0%B5%CC%81%D1%81%2C%20%D0%90%D0%BF%D0%B5%D0%BB%D0%BB)%20(,%D0%B2%20%D0%9A%D0%B0%D1%82%D0%BE%D0%BB%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B9%20%D1%86%D0%B5%D1%80%D0%BA%D0%B2%D0%B8%20%E2%80%94%2031%20%D0%BE%D0%BA%D1%82%D1%8F%D0%B1%D1%80%D1%8F.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Аполлинарий'
SET @NameOrigin = 'греч.'
SET @DetailName = 'Аполлоноу пренадлежащий'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%BF%D0%BE%D0%BB%D0%BB%D0%B8%D0%BD%D0%B0%D1%80%D0%B8%D0%B9'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Аполлинария'
SET @NameOrigin = 'греч.'
SET @DetailName = 'Аполлоноу принадлежащая'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%BF%D0%BE%D0%BB%D0%BB%D0%B8%D0%BD%D0%B0%D1%80%D0%B8%D1%8F#:~:text=%E1%BC%88%CF%80%CF%8C%CE%BB%CE%BB%CF%89%CE%BD)%20%E2%80%94%20%D0%B6%D0%B5%D0%BD%D1%81%D0%BA%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F%20%D0%B4%D1%80%D0%B5%D0%B2%D0%BD%D0%B5%D1%80%D0%B8%D0%BC%D1%81%D0%BA%D0%BE%D0%B3%D0%BE%20%D0%BF%D1%80%D0%BE%D0%B8%D1%81%D1%85%D0%BE%D0%B6%D0%B4%D0%B5%D0%BD%D0%B8%D1%8F,%D0%96%D0%B5%D0%BD%D1%81%D0%BA%D0%B0%D1%8F%20%D1%84%D0%BE%D1%80%D0%BC%D0%B0%20%D0%BC%D1%83%D0%B6%D1%81%D0%BA%D0%BE%D0%B3%D0%BE%20%D0%B8%D0%BC%D0%B5%D0%BD%D0%B8%20%D0%90%D0%BF%D0%BE%D0%BB%D0%BB%D0%B8%D0%BD%D0%B0%D1%80%D0%B8%D0%B9.&text=%D0%92%20%D1%80%D1%83%D1%81%D1%81%D0%BA%D0%BE%D0%BC%20%D1%8F%D0%B7%D1%8B%D0%BA%D0%B5%20%D1%80%D0%B0%D1%81%D0%BF%D1%80%D0%BE%D1%81%D1%82%D1%80%D0%B0%D0%BD%D0%B5%D0%BD%D1%8B%20%D1%80%D0%B0%D0%B7%D0%B3%D0%BE%D0%B2%D0%BE%D1%80%D0%BD%D0%B0%D1%8F,%D0%B8%D0%BC%D0%B5%D0%BD%D0%B8%20%E2%80%94%20%D0%9F%D0%BE%D0%BB%D0%B8%CC%81%D0%BD%D0%B0%20%D0%B8%20%D0%BF%D1%80%D0%BE%D1%81%D1%82%D0%BE%D1%80%D0%B5%D1%87%D0%BD%D0%B0%D1%8F%20%D0%9F%D0%BE%D0%BB%D0%B8%D0%BD%D0%B0%D1%80%D0%B8%D1%8F.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Аполлон'
SET @NameOrigin = 'греч.'
SET @DetailName = 'лучезарный'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%BF%D0%BE%D0%BB%D0%BB%D0%BE%D0%BD#:~:text=%D0%90%D0%BF%D0%BE%D0%BB%D0%BB%D0%BE%CC%81%D0%BD%20(%D0%B4%D1%80.,%D0%BF%D0%BE%D0%BA%D1%80%D0%BE%D0%B2%D0%B8%D1%82%D0%B5%D0%BB%D1%8C%20%D0%BF%D0%B5%D1%80%D0%B5%D1%81%D0%B5%D0%BB%D0%B5%D0%BD%D1%86%D0%B5%D0%B2%2C%20%D0%BE%D0%BB%D0%B8%D1%86%D0%B5%D1%82%D0%B2%D0%BE%D1%80%D0%B5%D0%BD%D0%B8%D0%B5%20%D0%BC%D1%83%D0%B6%D1%81%D0%BA%D0%BE%D0%B9%20%D0%BA%D1%80%D0%B0%D1%81%D0%BE%D1%82%D1%8B.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Аполлоний'
SET @NameOrigin = 'греч.'
SET @DetailName = 'Аполлоноу пренадлежащий'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://wikipedia.tel/%D0%90%D0%BF%D0%BE%D0%BB%D0%BB%D0%BE%D0%BD%D0%B8%D0%B9'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Аполлос'
SET @NameOrigin = 'греч.'
SET @DetailName = 'губитель'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D0%BF%D0%BE%D0%BB%D0%BB%D0%BE%D1%81'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Апрониан'
SET @NameOrigin = 'греч.'
SET @DetailName = 'непредвиденный'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Апфия'
SET @NameOrigin = ''
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Ардалион'
SET @NameOrigin = 'греч.'
SET @DetailName = 'суетливый'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wiktionary.org/wiki/%D0%90%D1%80%D0%B4%D0%B0%D0%BB%D0%B8%D0%BE%D0%BD#:~:text=ardalio%20(%D1%80%D0%BE%D0%B4.,%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%D0%BC%20%C2%AB%D1%81%D0%BE%D1%81%D1%83%D0%B4%20%D0%B4%D0%BB%D1%8F%20%D0%BE%D0%BA%D1%80%D0%BE%D0%BF%D0%BB%D0%B5%D0%BD%D0%B8%D1%8F%C2%BB.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Арефа'
SET @NameOrigin = 'араб.'
SET @DetailName = 'орел'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D1%80%D0%B5%D1%84%D0%B0'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Ариадна'
SET @NameOrigin = 'греч.'
SET @DetailName = 'верная мужу'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D1%80%D0%B8%D0%B0%D0%B4%D0%BD%D0%B0#:~:text=%D0%90%D1%80%D0%B8%D0%B0%CC%81%D0%B4%D0%BD%D0%B0%20(%D0%B4%D1%80.,%D1%80%D0%B0%D1%81%D1%81%D0%BA%D0%B0%D0%B7%D1%8B%D0%B2%D0%B0%D0%BB%20%D0%9D%D0%B5%D1%81%D1%82%D0%BE%D1%80%20%D0%B2%20%C2%AB%D0%9A%D0%B8%D0%BF%D1%80%D0%B8%D1%8F%D1%85%C2%BB.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Ариан'
SET @NameOrigin = 'рус.'
SET @DetailName = 'Арису принадлежащий'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Арий'
SET @NameOrigin = 'евр.'
SET @DetailName = 'лев'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D1%80%D0%B8%D0%B9'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Арис'
SET @NameOrigin = 'греч.'
SET @DetailName = 'Бог войны'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D1%80%D0%B8%D1%81'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Аристарх'
SET @NameOrigin = 'греч.'
SET @DetailName = 'лучший правитель'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D1%80%D0%B8%D1%81%D1%82%D0%B0%D1%80%D1%85'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Аристион'
SET @NameOrigin = 'греч.'
SET @DetailName = 'лучший'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D1%80%D0%B8%D1%81%D1%82%D0%B8%D0%BE%D0%BD#:~:text=%E1%BC%88%CF%81%CE%B9%CF%83%CF%84%CE%AF%CF%89%CE%BD)%20%E2%80%94%20%D0%BC%D1%83%D0%B6%D1%81%D0%BA%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F%20%D0%B3%D1%80%D0%B5%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B3%D0%BE%20%D0%BF%D1%80%D0%BE%D0%B8%D1%81%D1%85%D0%BE%D0%B6%D0%B4%D0%B5%D0%BD%D0%B8%D1%8F,%D0%BF%D0%B5%D1%80%D0%B2%D1%8B%D0%BC%2C%20%D0%B2%D1%8B%D0%B4%D0%B5%D0%BB%D1%8F%D1%82%D1%8C%D1%81%D1%8F%2C%20%D0%BE%D1%82%D0%BB%D0%B8%D1%87%D0%B0%D1%82%D1%8C%D1%81%D1%8F%C2%BB.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Аристовул'
SET @NameOrigin = 'греч.'
SET @DetailName = 'советник лучший'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D1%80%D0%B8%D1%81%D1%82%D0%BE%D0%B2%D1%83%D0%BB_(%D0%B0%D0%BF%D0%BE%D1%81%D1%82%D0%BE%D0%BB_%D0%BE%D1%82_70)'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Аристоклий'
SET @NameOrigin = 'греч.'
SET @DetailName = 'прекрасный'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Аркадий'
SET @NameOrigin = 'греч.'
SET @DetailName = 'пастух'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D1%80%D0%BA%D0%B0%D0%B4%D0%B8%D0%B9'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Аронос'
SET @NameOrigin = 'греч.'
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Арпила'
SET @NameOrigin = ''
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Арсений'
SET @NameOrigin = 'греч.'
SET @DetailName = 'мужественный'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D1%80%D1%81%D0%B5%D0%BD%D0%B8%D0%B9#:~:text=%D0%90%D1%80%D1%81%D0%B5%CC%81%D0%BD%D0%B8%D0%B9%20(%D0%BE%D1%82%20%D0%B4%D1%80.,%D1%80%D0%B0%D1%81%D0%BF%D1%80%D0%BE%D1%81%D1%82%D1%80%D0%B0%D0%BD%D0%B5%D0%BD%D0%B8%D0%B5%20%D0%BA%D1%80%D0%B0%D1%82%D0%BA%D0%B0%D1%8F%20%D1%84%D0%BE%D1%80%D0%BC%D0%B0%20%D0%B8%D0%BC%D0%B5%D0%BD%D0%B8%20%E2%80%94%20%D0%90%D1%80%D1%81%D0%B5%CC%81%D0%BD.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Артема'
SET @NameOrigin = 'греч.'
SET @DetailName = 'здоровый'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Артемий'
SET @NameOrigin = 'греч.'
SET @DetailName = 'посвящённый Артемиде'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D1%80%D1%82%D0%B5%D0%BC%D0%B8%D0%B9'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Артемия'
SET @NameOrigin = 'греч.'
SET @DetailName = 'цветущая'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Артемон'
SET @NameOrigin = 'греч.'
SET @DetailName = 'парус'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Архелай'
SET @NameOrigin = 'греч.'
SET @DetailName = 'вождь народа'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D1%80%D1%85%D0%B5%D0%BB%D0%B0%D0%B9#:~:text=Archelaus)%20%E2%80%94%20%D0%B8%D0%BC%D1%8F%20%D0%BF%D0%B5%D1%80%D1%81%D0%BE%D0%BD%D0%B0%D0%B6%D0%B5%D0%B9%20%D0%B8%D0%B7%20%D0%B0%D0%BD%D1%82%D0%B8%D1%87%D0%BD%D1%8B%D1%85,%2C%20%D1%81%D1%8B%D0%BD%20%D0%A2%D0%B5%D0%BC%D0%B5%D0%BD%D0%B0%2C%20%D1%86%D0%B0%D1%80%D1%8F%20%D0%90%D1%80%D0%B3%D0%BE%D1%81%D0%B0.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Архелая'
SET @NameOrigin = 'греч.'
SET @DetailName = 'начальница людей'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Архилий'
SET @NameOrigin = ''
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Архипп'
SET @NameOrigin = 'греч.'
SET @DetailName = 'конюх'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D1%80%D1%85%D0%B8%D0%BF%D0%BF#:~:text=%D1%81%D1%82%D0%B0%D1%80%D1%88%D0%B8%D0%B9%C2%BB%20%2B%20%D0%B4%D1%80.-,%2D%D0%B3%D1%80%D0%B5%D1%87.,%D0%90%D1%80%D1%85%D0%B8%D0%BF%D0%BF%20(V%20%D0%B2%D0%B5%D0%BA%20%D0%B4%D0%BE%20%D0%BD.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Арчил'
SET @NameOrigin = 'груз.'
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D1%80%D1%87%D0%B8%D0%BB#:~:text=%D0%90%D1%80%D1%87%D0%B8%CC%81%D0%BB%20%E2%80%94%20%D0%BC%D1%83%D0%B6%D1%81%D0%BA%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F%20%D0%B3%D1%80%D1%83%D0%B7%D0%B8%D0%BD%D1%81%D0%BA%D0%BE%D0%B3%D0%BE%20%D0%BF%D1%80%D0%BE%D0%B8%D1%81%D1%85%D0%BE%D0%B6%D0%B4%D0%B5%D0%BD%D0%B8%D1%8F,%D0%B8%20%D0%9A%D0%B0%D1%85%D0%B5%D1%82%D0%B8%D0%B8%20(1664%E2%80%941675)'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Асинкрит'
SET @NameOrigin = 'греч.'
SET @DetailName = 'несравнимый'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D1%81%D0%B8%D0%BD%D0%BA%D1%80%D0%B8%D1%82#:~:text=%D0%90%D1%81%D0%B8%D0%BD%D0%BA%D1%80%D0%B8%CC%81%D1%82%20(%D0%90%D1%81%D0%B8%D0%B3%D0%BA%D1%80%D0%B8%D1%82%2C%20%D0%B3%D1%80%D0%B5%D1%87.,%D1%81%20%D0%BD%D0%B8%D0%BC%D0%B8%20%D0%B1%D1%80%D0%B0%D1%82%D1%8C%D0%B5%D0%B2%C2%BB%20(%D0%A0%D0%B8%D0%BC.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Аскалон'
SET @NameOrigin = 'греч.'
SET @DetailName = 'невозделанный'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Аскитрея'
SET @NameOrigin = 'греч.'
SET @DetailName = 'подвижница'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Асклиада'
SET @NameOrigin = ''
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Асклипиодот'
SET @NameOrigin = 'греч.'
SET @DetailName = 'дар Эскулапа'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Астерий'
SET @NameOrigin = 'греч.'
SET @DetailName = 'звездный'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D1%81%D1%82%D0%B5%D1%80%D0%B8%D0%B9_(%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D1%8F)#:~:text=%D0%90%D1%81%D1%82%D0%B5%CC%81%D1%80%D0%B8%D0%B9%20(%D0%B8%D0%BB%D0%B8%20%D0%90%D1%81%D1%82%D0%B5%D1%80%D0%B8%D0%BE%CC%81%D0%BD)%20%E2%80%94%20%D0%B8%D0%BC%D1%8F,(%D1%81%D1%8B%D0%BD%20%D0%95%D0%B3%D0%B8%D0%BF%D1%82%D0%B0)%20%E2%80%94%20%D1%81%D0%BC.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Астий'
SET @NameOrigin = 'греч.'
SET @DetailName = 'городской'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Астион'
SET @NameOrigin = 'греч.'
SET @DetailName = 'учтивый' 
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Аттий'
SET @NameOrigin = 'греч.'
SET @DetailName = 'нападающий'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Аттик'
SET @NameOrigin = 'греч.'
SET @DetailName = 'сосед'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D1%82%D1%82%D0%B8%D0%BA#:~:text=Atticus%20%E2%80%94%20%D0%90%D1%82%D1%82%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%B8%D0%B9%2C%20%D0%B6%D0%B8%D1%82%D0%B5%D0%BB%D1%8C%20%D0%90%D1%82%D1%82%D0%B8%D0%BA%D0%B8),%D0%9F%D1%80%D0%BE%D0%B8%D0%B7%D0%B2%D0%BE%D0%B4%D0%BD%D1%8B%D0%B5%3A%20%D0%90%CC%81%D1%82%D1%8F%2C%20%D0%90%D1%82%D1%8E%CC%81%D1%85%D0%B0.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Афанасий'
SET @NameOrigin = 'греч.'
SET @DetailName = 'бессмертный'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D1%84%D0%B0%D0%BD%D0%B0%D1%81%D0%B8%D0%B9'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Афанасия'
SET @NameOrigin = 'греч.'
SET @DetailName = 'бессмертная'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D1%84%D0%B0%D0%BD%D0%B0%D1%81%D0%B8%D0%B9#:~:text=%D1%82%D1%80%D0%B0%D0%BD%D1%81%D0%BA%D1%80.,%D1%84%D0%B0%D0%BC%D0%B8%D0%BB%D0%B8%D0%B8%20%D0%90%D1%84%D0%B0%D0%BD%D0%B0%D1%81%D1%8C%D0%B5%D0%B2%2C%20%D0%90%D1%84%D0%BE%D0%BD%D0%B8%D0%BD%20%D0%B8%20%D0%90%D1%84%D0%BE%D0%BD%D1%8C%D0%BA%D0%B8%D0%BD.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Афиноген'
SET @NameOrigin = 'греч.'
SET @DetailName = 'Афинянин'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D1%84%D0%B8%D0%BD%D0%BE%D0%B3%D0%B5%D0%BD#:~:text=%D0%90%D1%84%D0%B8%D0%BD%D0%BE%D0%B3%D0%B5%D0%BD%20(%D1%83%D0%BC.,%D0%90%D0%BC%D0%B2%D1%80%D0%BE%D1%81%D0%B8%D0%B9%20%D0%B8%D0%B7%20%D0%92%D0%BE%D1%81%D0%BA%D1%80%D0%B5%D1%81%D0%B5%D0%BD%D1%81%D0%BA%D0%BE%D0%B3%D0%BE%20%D0%9D%D0%BE%D0%B2%D0%BE%D0%B8%D0%B5%D1%80%D1%83%D1%81%D0%B0%D0%BB%D0%B8%D0%BC%D1%81%D0%BA%D0%BE%D0%B3%D0%BE%20%D0%BC%D0%BE%D0%BD%D0%B0%D1%81%D1%82%D1%8B%D1%80%D1%8F.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Афинодор'
SET @NameOrigin = 'греч.'
SET @DetailName = 'дар богини Афины'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D1%84%D0%B8%D0%BD%D0%BE%D0%B4%D0%BE%D1%80'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Афра'
SET @NameOrigin = 'герм.'
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Афраат'
SET @NameOrigin = 'греч.'
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D1%84%D1%80%D0%B0%D0%B0%D1%82'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Африкан'
SET @NameOrigin = 'лат.'
SET @DetailName = 'африканец'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D1%84%D1%80%D0%B8%D0%BA%D0%B0%D0%BD#:~:text=%D0%90%D1%84%D1%80%D0%B8%D0%BA%D0%B0%CC%81%D0%BD%20%E2%80%94%20%D0%BC%D1%83%D0%B6%D1%81%D0%BA%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F%20%D0%BB%D0%B0%D1%82%D0%B8%D0%BD%D1%81%D0%BA%D0%BE%D0%B3%D0%BE%20%D0%BF%D1%80%D0%BE%D0%B8%D1%81%D1%85%D0%BE%D0%B6%D0%B4%D0%B5%D0%BD%D0%B8%D1%8F,%D0%B0%D1%84%D1%80%D0%B8%D0%BA%D0%B0%D0%BD%D0%B5%D1%86%C2%BB%20(%D0%BB%D0%B0%D1%82.).'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Аффоний'
SET @NameOrigin = 'греч.'
SET @DetailName = 'обилие'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Ахаз'
SET @NameOrigin = 'евр.'
SET @DetailName = 'владетель'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D1%85%D0%B0%D0%B7'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Ахаик'
SET @NameOrigin = ''
SET @DetailName = 'апостол от 70-ти'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D1%85%D0%B0%D0%B8%D0%BA_(%D0%B0%D0%BF%D0%BE%D1%81%D1%82%D0%BE%D0%BB_%D0%BE%D1%82_70)#:~:text=%D0%90%D1%85%D0%B0%D0%B8%D0%BA%20(%D0%B3%D1%80%D0%B5%D1%87.,%D0%9F%D0%BE%D1%87%D0%B8%D1%82%D0%B0%D0%B9%D1%82%D0%B5%20%D1%82%D0%B0%D0%BA%D0%BE%D0%B2%D1%8B%D1%85%C2%BB%20(1%D0%9A%D0%BE%D1%80.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Ахилл'
SET @NameOrigin = 'греч.'
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D1%85%D0%B8%D0%BB%D0%BB#:~:text=%D0%90%D1%85%D0%B8%CC%81%D0%BB%D0%BB%20%D0%B8%D0%BB%D0%B8%20%D0%90%D1%85%D0%B8%D0%BB%D0%BB%D0%B5%CC%81%D1%81%20%E2%80%94%20%D0%BF%D0%B5%D1%80%D1%81%D0%BE%D0%BD%D0%B0%D0%B6%20%D0%B4%D1%80%D0%B5%D0%B2%D0%BD%D0%B5%D0%B3%D1%80%D0%B5%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B9,%D1%81%D1%8B%D0%BD%D0%BE%D0%BC%20%D0%9F%D0%B5%D0%BB%D0%B5%D1%8F%20%D0%B8%20%D0%BD%D0%B5%D1%80%D0%B5%D0%B8%D0%B4%D1%8B%20%D0%A4%D0%B5%D1%82%D0%B8%D0%B4%D1%8B.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Ахиллий'
SET @NameOrigin = 'греч.'
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D1%85%D0%B8%D0%BB%D0%BB#:~:text=%D0%90%D1%85%D0%B8%CC%81%D0%BB%D0%BB%20%D0%B8%D0%BB%D0%B8%20%D0%90%D1%85%D0%B8%D0%BB%D0%BB%D0%B5%CC%81%D1%81%20%E2%80%94%20%D0%BF%D0%B5%D1%80%D1%81%D0%BE%D0%BD%D0%B0%D0%B6%20%D0%B4%D1%80%D0%B5%D0%B2%D0%BD%D0%B5%D0%B3%D1%80%D0%B5%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B9,%D1%81%D1%8B%D0%BD%D0%BE%D0%BC%20%D0%9F%D0%B5%D0%BB%D0%B5%D1%8F%20%D0%B8%20%D0%BD%D0%B5%D1%80%D0%B5%D0%B8%D0%B4%D1%8B%20%D0%A4%D0%B5%D1%82%D0%B8%D0%B4%D1%8B.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Ахия'
SET @NameOrigin = 'евр.'
SET @DetailName = 'брат Господа'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D1%85%D0%B8%D1%8F#:~:text=%D0%90%D1%85%D0%B8%CC%81%D1%8F%20(%D0%B8%D0%B2%D1%80.,%D0%90%D1%85%D0%B8%D1%8F%20%E2%80%94%20%D0%BF%D1%80%D0%BE%D1%80%D0%BE%D0%BA%20%D0%B2%D1%80%D0%B5%D0%BC%D1%91%D0%BD%20%D1%86%D0%B0%D1%80%D1%8F%20%D0%A1%D0%BE%D0%BB%D0%BE%D0%BC%D0%BE%D0%BD%D0%B0.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = 'Аэтий'
SET @NameOrigin = 'греч.'
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%90%D1%8D%D1%86%D0%B8%D0%B9'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = ''
SET @NameOrigin = ''
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = ''
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = ''
SET @NameOrigin = ''
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = ''
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = ''
SET @NameOrigin = ''
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = ''
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = ''
SET @NameOrigin = ''
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = ''
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = ''
SET @NameOrigin = ''
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = ''
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
