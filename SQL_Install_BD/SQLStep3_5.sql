DECLARE @Name NVARCHAR(50)
DECLARE @NameOrigin NVARCHAR(50)
DECLARE @DetailName NVARCHAR(500)

DECLARE @Url NVARCHAR(4000)

--#############################################################
SET @Name = '�����'
SET @NameOrigin = '���.'
SET @DetailName = '�������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%94%D0%B0%D0%B2%D0%B8%D0%B4_(%D0%B8%D0%BC%D1%8F)#:~:text=%D0%94%D0%B0%D0%B2%D0%B8%CC%81%D0%B4%20%E2%80%94%20%D0%BC%D1%83%D0%B6%D1%81%D0%BA%D0%BE%D0%B5%20%D1%80%D1%83%D1%81%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BB%D0%B8%D1%87%D0%BD%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F,%D0%BA%D0%BE%D1%82%D0%BE%D1%80%D0%BE%D0%B3%D0%BE%20%D0%BF%D1%80%D0%BE%D0%B8%D0%B7%D0%BE%D1%88%D0%BB%D0%B0%20%D1%80%D0%B0%D1%81%D0%BF%D1%80%D0%BE%D1%81%D1%82%D1%80%D0%B0%D0%BD%D1%91%D0%BD%D0%BD%D0%B0%D1%8F%20%D1%84%D0%B0%D0%BC%D0%B8%D0%BB%D0%B8%D1%8F%20%D0%94%D0%B0%D0%B2%D1%8B%D0%B4%D0%BE%D0%B2.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '������'
SET @NameOrigin = '���.'
SET @DetailName = '' 
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '����'
SET @NameOrigin = '���.'
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '������'
SET @NameOrigin = '���.'
SET @DetailName = '������ ��������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '������'
SET @NameOrigin = '���.'
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%94%D0%B5%D0%BC%D1%8C%D1%8F%D0%BD#:~:text=%D0%94%D0%B5%D0%BC%D1%8C%D1%8F%CC%81%D0%BD%20%E2%80%94%20%D0%BC%D1%83%D0%B6%D1%81%D0%BA%D0%BE%D0%B5%20%D1%80%D1%83%D1%81%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BB%D0%B8%D1%87%D0%BD%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F,%D0%BC%D0%B5%D1%81%D1%82%D0%BD%D0%BE%D1%87%D1%82%D0%B8%D0%BC%D0%BE%D0%B9%20%D0%B1%D0%BE%D0%B3%D0%B8%D0%BD%D0%B5%20%D0%BF%D0%BB%D0%BE%D0%B4%D0%BE%D1%80%D0%BE%D0%B4%D0%B8%D1%8F%20%D0%B8%20%D0%B8%D0%B7%D0%BE%D0%B1%D0%B8%D0%BB%D0%B8%D1%8F.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '������'
SET @NameOrigin = '����.'
SET @DetailName = '����'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%94%D0%B0%D0%BD%D0%B0%D0%BA%D1%82#:~:text=%E1%BC%84%CE%BD%CE%B1%CE%BE%20(%D0%B3%D0%B5%D0%BD%D0%B8%D1%82%D0%B8%D0%B2%20%D0%B4%D1%80.-,%2D%D0%B3%D1%80%D0%B5%D1%87.,%D0%BA%D0%BE%D1%80%D0%BE%D0%BB%D1%8C%2C%20%D0%BB%D0%BE%D1%80%D0%B4%2C%20%D1%85%D0%BE%D0%B7%D1%8F%D0%B8%D0%BD%C2%BB.&text=%D0%9F%D1%80%D0%B5%D0%B4%D0%BF%D0%BE%D0%BB%D0%B0%D0%B3%D0%B0%D0%B5%D1%82%D1%81%D1%8F%2C%20%D1%87%D1%82%D0%BE%20%D1%81%D0%BE%D0%B2%D1%80%D0%B5%D0%BC%D0%B5%D0%BD%D0%BD%D0%B0%D1%8F%20%D1%84%D0%BE%D1%80%D0%BC%D0%B0%20%D0%B8%D0%BC%D0%B5%D0%BD%D0%B8,%2D%D0%B3%D1%80%D0%B5%D1%87.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '������'
SET @NameOrigin = '���.'
SET @DetailName = '��� � ��� �����'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%94%D0%B0%D0%BD%D0%B8%D0%B8%D0%BB_(%D0%B8%D0%BC%D1%8F)'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '�����'
SET @NameOrigin = '����.'
SET @DetailName = '�����������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%94%D0%B0%D1%80%D1%8C%D1%8F#:~:text=%D0%94%D0%B0%CC%81%D1%80%D1%8C%D1%8F%20%E2%80%94%20%D0%B6%D0%B5%D0%BD%D1%81%D0%BA%D0%BE%D0%B5%20%D1%80%D1%83%D1%81%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BB%D0%B8%D1%87%D0%BD%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F,%E2%80%94%20%C2%AB%D0%B4%D0%BE%D0%B1%D1%80%D1%8B%D0%B9%2C%20%D0%B1%D0%BB%D0%B0%D0%B3%D0%BE%D0%B9%C2%BB.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '�����'
SET @NameOrigin = '���.'
SET @DetailName = '��������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%94%D0%B0%D1%81%D0%B8%D0%B9#:~:text=Dasius)%20%E2%80%94%20%D0%BC%D1%83%D0%B6%D1%81%D0%BA%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F%20%D0%BB%D0%B0%D1%82%D0%B8%D0%BD%D1%81%D0%BA%D0%BE%D0%B3%D0%BE%20%D0%BF%D1%80%D0%BE%D0%B8%D1%81%D1%85%D0%BE%D0%B6%D0%B4%D0%B5%D0%BD%D0%B8%D1%8F,)%20%E2%80%94%20%D0%BC%D1%83%D1%87%D0%B5%D0%BD%D0%B8%D0%BA%2C%20%D0%BF%D0%B0%D0%BC%D1%8F%D1%82%D1%8C%2020%20%D0%BD%D0%BE%D1%8F%D0%B1%D1%80%D1%8F'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '�����'
SET @NameOrigin = '���.'
SET @DetailName = '��������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '��������'
SET @NameOrigin = '���.'
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '������'
SET @NameOrigin = '���.'
SET @DetailName = '����������� �����'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%94%D0%B5%D0%BC%D1%8C%D1%8F%D0%BD'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '�����'
SET @NameOrigin = '����.'
SET @DetailName = '����������� �������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%94%D0%B5%D0%BD%D0%B8%D1%81#:~:text=%D0%94%D0%B5%D0%BD%D0%B8%CC%81%D1%81%20%E2%80%94%20%D0%BC%D1%83%D0%B6%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BB%D0%B8%D1%87%D0%BD%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F%2C%20%D1%80%D0%B0%D1%81%D0%BF%D1%80%D0%BE%D1%81%D1%82%D1%80%D0%B0%D0%BD%D1%91%D0%BD%D0%BD%D0%BE%D0%B5%20%D0%B2%20%D0%A0%D0%BE%D1%81%D1%81%D0%B8%D0%B8.&text=%D0%94%D0%BE%20%D0%BD%D0%B0%D1%87%D0%B0%D0%BB%D0%B0%20XX%20%D0%B2%D0%B5%D0%BA%D0%B0%20%D0%B8%D0%BC%D1%8F,%2D%D0%B3%D1%80%D0%B5%D1%87.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '�����'
SET @NameOrigin = '���.'
SET @DetailName = '������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%94%D0%B8%D0%B0%D0%BD%D0%B0_(%D0%B8%D0%BC%D1%8F)#:~:text=%D0%94%D0%B8%D0%B0%CC%81%D0%BD%D0%B0%20(%D0%BE%D1%82%20%D0%BB%D0%B0%D1%82.,%D0%B4%D1%80%D0%B5%D0%B2%D0%BD%D0%B5%D0%B3%D1%80%D0%B5%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B9%20%D0%BC%D0%B8%D1%84%D0%BE%D0%BB%D0%BE%D0%B3%D0%B8%D0%B8%20%D0%94%D0%B8%D0%B0%D0%BD%D0%B5%20%D1%81%D0%BE%D0%BE%D1%82%D0%B2%D0%B5%D1%82%D1%81%D1%82%D0%B2%D0%BE%D0%B2%D0%B0%D0%BB%D0%B0%20%D0%90%D1%80%D1%82%D0%B5%D0%BC%D0%B8%D0%B4%D0%B0).&text=%D0%92%20%D0%BF%D0%B5%D1%80%D1%81%D0%B8%D0%B4%D1%81%D0%BA%D0%BE%D0%BC%20%D1%8F%D0%B7%D1%8B%D0%BA%D0%B5%20%D0%BE%D0%BD%D0%BE%20%D0%BE%D0%B7%D0%BD%D0%B0%D1%87%D0%B0%D0%B5%D1%82%20%C2%AB%D0%BF%D0%BE%D1%81%D0%BB%D0%B0%D0%BD%D0%BD%D0%B8%D1%86%D0%B0%20%D0%B7%D0%B4%D0%BE%D1%80%D0%BE%D0%B2%D1%8C%D1%8F%20%D0%B8%20%D0%B1%D0%BB%D0%B0%D0%B3%D0%BE%D0%B4%D0%B5%D1%8F%D0%BD%D0%B8%D1%8F%C2%BB.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '�����'
SET @NameOrigin = '����.'
SET @DetailName = '�������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '���'
SET @NameOrigin = '����.'
SET @DetailName = '����'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%94%D0%B8%D0%B9#:~:text=%D0%94%D0%B8%D0%B9%20%E2%80%94%20%D1%80%D1%83%D1%81%D1%81%D0%BA%D0%BE%D0%B5%20%D1%86%D0%B5%D1%80%D0%BA%D0%BE%D0%B2%D0%BD%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F%20(%D0%B2%D0%B0%D1%80%D0%B8%D0%B0%D0%BD%D1%82,IV%20%D0%B2%D0%B5%D0%BA%D0%B0%20%E2%80%94%20%D0%BE%D0%BA%D0%BE%D0%BB%D0%BE%20430).'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '���������'
SET @NameOrigin = '����.'
SET @DetailName = '����� ��������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%94%D0%B8%D0%BC%D0%B8%D1%82%D1%80%D0%B8%D0%B0%D0%BD_%D0%92%D0%B5%D1%80%D0%BE%D0%BD%D1%81%D0%BA%D0%B8%D0%B9'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '��������'
SET @NameOrigin = '����.'
SET @DetailName = '����������� ������ �������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%94%D0%BC%D0%B8%D1%82%D1%80%D0%B8%D0%B9#:~:text=%D0%94%D0%BC%D0%B8%CC%81%D1%82%D1%80%D0%B8%D0%B9%20(%D1%81%D0%BC.,%D0%B1%D0%BE%D0%B3%D0%B8%D0%BD%D0%B5%20%D0%94%D0%B5%D0%BC%D0%B5%D1%82%D1%80%D0%B5%C2%BB%20(%D0%9C%D0%B8%D1%82%D1%80%D0%B5).'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '������'
SET @NameOrigin = '����.'
SET @DetailName = '��� �����'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%94%D0%B8%D0%BE%D0%B4%D0%BE%D1%80#:~:text=%D0%94%D0%B8%D0%BE%D0%B4%D0%BE%CC%81%D1%80%20(%D0%B3%D1%80%D0%B5%D1%87.,%D0%BF%D0%B0%D1%82%D1%80%D0%B8%D0%B0%D1%80%D1%85%20%D0%98%D0%B5%D1%80%D1%83%D1%81%D0%B0%D0%BB%D0%B8%D0%BC%D1%81%D0%BA%D0%B8%D0%B9%20%D0%B8%20%D0%B2%D1%81%D0%B5%D1%8F%20%D0%9F%D0%B0%D0%BB%D0%B5%D1%81%D1%82%D0%B8%D0%BD%D1%8B.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '������'
SET @NameOrigin = '����.'
SET @DetailName = '��� ������� �����'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%94%D0%B8%D0%BE%D0%BC%D0%B8%D0%B4#:~:text=%D0%94%D0%B8%D0%BE%D0%BC%D0%B8%CC%81%D0%B4%20(%D0%B3%D1%80%D0%B5%D1%87.,%D1%80%D1%83%D1%81%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BB%D0%B8%D1%87%D0%BD%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F%20%D0%B3%D1%80%D0%B5%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B3%D0%BE%20%D0%BF%D1%80%D0%BE%D0%B8%D1%81%D1%85%D0%BE%D0%B6%D0%B4%D0%B5%D0%BD%D0%B8%D1%8F.&text=%D0%9F%D1%80%D0%BE%D0%B8%D1%81%D1%85%D0%BE%D0%B4%D0%B8%D1%82%20%D0%BE%D1%82%20%D0%B4%D1%80%D0%B5%D0%B2%D0%BD%D0%B5%D0%B3%D1%80%D0%B5%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B3%D0%BE%20%CE%94%CE%B9%CE%BF%CE%BC%CE%AE%CE%B4%CE%B7%CF%82%20%C2%AB%D0%94%D0%B8%D0%BE%D0%BC%D0%B5%D0%B4,%D0%B1%D0%BE%D0%B3%C2%BB%20%D0%B8%D0%BB%D0%B8%20%C2%AB%D0%B1%D0%BE%D0%B6%D0%B5%D1%81%D1%82%D0%B2%D0%B5%D0%BD%D0%BD%D1%8B%D0%B9%C2%BB.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '����'
SET @NameOrigin = '����.'
SET @DetailName = '������������ ��� ����'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%94%D0%B8%D0%BE%D0%BD'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '��������'
SET @NameOrigin = '����.'
SET @DetailName = '����������� �������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%94%D0%B8%D0%BE%D0%BD%D0%B8%D1%81%D0%B8%D0%B9#:~:text=%D0%94%D0%B8%D0%BE%D0%BD%D0%B8%D1%81%D0%B8%D0%B9%20%E2%80%94%20%D1%86%D0%B0%D1%80%D1%8C%20%D0%BE%D0%B4%D0%BD%D0%BE%D0%B3%D0%BE%20%D0%B8%D0%B7%20%D0%B8%D0%BD%D0%B4%D0%BE,%D0%94%D0%B8%D0%BE%D0%BD%D0%B8%D1%81%D0%B8%D0%B9%20%D0%93%D0%B5%D1%80%D0%B0%D0%BA%D0%BB%D0%B5%D0%B9%D1%81%D0%BA%D0%B8%D0%B9%20%E2%80%94%20%D1%82%D0%B8%D1%80%D0%B0%D0%BD%20%D0%93%D0%B5%D1%80%D0%B0%D0%BA%D0%BB%D0%B5%D0%B8%20%D0%9F%D0%BE%D0%BD%D1%82%D0%B8%D0%B9%D1%81%D0%BA%D0%BE%D0%B9.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '�������'
SET @NameOrigin = '����.'
SET @DetailName = '��� �����'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%94%D0%B8%D0%BE%D1%81%D0%BA%D0%BE%D1%80#:~:text=%CE%94%CE%B9%CF%8C%CF%83%20%E2%80%94%20%C2%AB%D0%94%D0%B8%D0%B9%C2%BB%20(%D1%80%D0%BE%D0%B4,%C2%BB)%20%E2%80%94%20%D0%B3%D1%80%D0%B5%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BC%D1%83%D0%B6%D1%81%D0%BA%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '�������'
SET @NameOrigin = ''
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%94%D0%BE%D0%B2%D0%BC%D0%BE%D0%BD%D1%82_(%D0%BA%D0%BD%D1%8F%D0%B7%D1%8C_%D0%BF%D1%81%D0%BA%D0%BE%D0%B2%D1%81%D0%BA%D0%B8%D0%B9)#:~:text=%D0%94%D0%BE%D0%B2%D0%BC%D0%BE%CC%81%D0%BD%D1%82%2C%20%D0%B8%D0%BB%D0%B8%20%D0%94%D0%BE%CC%81%D0%BC%D0%B0%D0%BD%D1%82%20(%D1%83%D0%BC.,%D1%82%D0%BE%D0%BC%20%D1%87%D0%B8%D1%81%D0%BB%D0%B5%20%D0%B2%20%D0%A0%D0%B0%D0%BA%D0%BE%D0%B2%D0%BE%D1%80%D1%81%D0%BA%D0%BE%D0%B9%20%D0%B1%D0%B8%D1%82%D0%B2%D0%B5.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '��������'
SET @NameOrigin = '���.'
SET @DetailName = '������������� �������' 
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '�����'
SET @NameOrigin = '���.'
SET @DetailName = '�������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%94%D0%BE%D0%BC%D0%BD%D0%B0_(%D0%B8%D0%BC%D1%8F)#:~:text=%D0%94%D0%BE%D0%BC%D0%BD%D0%B0%20(%D0%BB%D0%B0%D1%82.,)%20%E2%80%94%20%D0%B6%D0%B5%D0%BD%D1%81%D0%BA%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F%20%D0%BB%D0%B0%D1%82%D0%B8%D0%BD%D1%81%D0%BA%D0%BE%D0%B3%D0%BE%20%D0%BF%D1%80%D0%BE%D0%B8%D1%81%D1%85%D0%BE%D0%B6%D0%B4%D0%B5%D0%BD%D0%B8%D1%8F.&text=%D0%A0%D0%B0%D0%B7%D0%B3%D0%BE%D0%B2%D0%BE%D1%80%D0%BD%D1%8B%D0%B5%20%D1%84%D0%BE%D1%80%D0%BC%D1%8B%20%D0%B8%D0%BC%D0%B5%D0%BD%D0%B8%3A%20%D0%94%D0%BE%D0%BC%D0%BD%D0%B8%D0%BA%D0%B0%2C%20%D0%94%D0%BE%D0%BC%D0%BD%D0%B8%D0%BD%D0%B0.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '�������'
SET @NameOrigin = '���.'
SET @DetailName = '�������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%94%D0%BE%D0%BC%D0%BD%D0%B0_(%D0%B8%D0%BC%D1%8F)#:~:text=%D0%94%D0%BE%D0%BC%D0%BD%D0%B0%20(%D0%BB%D0%B0%D1%82.,)%20%E2%80%94%20%D0%B6%D0%B5%D0%BD%D1%81%D0%BA%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F%20%D0%BB%D0%B0%D1%82%D0%B8%D0%BD%D1%81%D0%BA%D0%BE%D0%B3%D0%BE%20%D0%BF%D1%80%D0%BE%D0%B8%D1%81%D1%85%D0%BE%D0%B6%D0%B4%D0%B5%D0%BD%D0%B8%D1%8F.&text=%D0%A0%D0%B0%D0%B7%D0%B3%D0%BE%D0%B2%D0%BE%D1%80%D0%BD%D1%8B%D0%B5%20%D1%84%D0%BE%D1%80%D0%BC%D1%8B%20%D0%B8%D0%BC%D0%B5%D0%BD%D0%B8%3A%20%D0%94%D0%BE%D0%BC%D0%BD%D0%B8%D0%BA%D0%B0%2C%20%D0%94%D0%BE%D0%BC%D0%BD%D0%B8%D0%BD%D0%B0.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '�����'
SET @NameOrigin = '���.'
SET @DetailName = '����������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%94%D0%BE%D0%BD%D0%B0%D1%82_(%D0%B8%D0%BC%D1%8F)#:~:text=%D0%94%D0%BE%D0%BD%D0%B0%CC%81%D1%82%20%E2%80%94%20%D0%BC%D1%83%D0%B6%D1%81%D0%BA%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F%20%D0%BB%D0%B0%D1%82%D0%B8%D0%BD%D1%81%D0%BA%D0%BE%D0%B3%D0%BE%20%D0%BF%D1%80%D0%BE%D0%B8%D1%81%D1%85%D0%BE%D0%B6%D0%B4%D0%B5%D0%BD%D0%B8%D1%8F,%D0%BF%D0%BE%D0%B4%D0%B0%D1%80%D0%B5%D0%BD%D0%BD%D1%8B%D0%B9%C2%BB%2C%20%C2%AB%D0%BE%D1%82%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D0%B9%C2%BB.&text=%D0%92%20%D1%85%D1%80%D0%B8%D1%81%D1%82%D0%B8%D0%B0%D0%BD%D1%81%D0%BA%D0%BE%D0%BC%20%D0%B8%D0%BC%D0%B5%D0%BD%D0%BE%D1%81%D0%BB%D0%BE%D0%B2%D0%B5%20%D0%B8%D0%BC%D1%8F%20%D0%94%D0%BE%D0%BD%D0%B0%D1%82,%D0%92%D0%B5%D0%BB%D0%B8%D0%BA%D0%BE%D0%B3%D0%BE%20%D0%B8%20%D0%BF%D1%80%D0%BE%D1%81%D0%BB%D0%B0%D0%B2%D0%B8%D0%B2%D1%88%D0%B8%D0%BC%D1%81%D1%8F%20%D0%BA%D0%B0%D0%BA%20%D1%87%D1%83%D0%B4%D0%BE%D1%82%D0%B2%D0%BE%D1%80%D0%B5%D1%86.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '�������'
SET @NameOrigin = '����.'
SET @DetailName = '��� �����'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%94%D0%BE%D1%80%D0%BE%D1%84%D0%B5%D0%B9#:~:text=%D0%94%D0%BE%D1%80%D0%BE%D1%84%D0%B5%D0%B9%20(%D0%B3%D1%80%D0%B5%D1%87.,XX%20%D0%B2%D0%B5%D0%BA%D0%B0%20%E2%80%94%20%D0%BF%D1%80%D0%B5%D0%B8%D0%BC%D1%83%D1%89%D0%B5%D1%81%D1%82%D0%B2%D0%B5%D0%BD%D0%BD%D0%BE%20%D0%BA%D0%B0%D0%BA%20%D0%BC%D0%BE%D0%BD%D0%B0%D1%88%D0%B5%D1%81%D0%BA%D0%BE%D0%B5.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '�������'
SET @NameOrigin = '����.'
SET @DetailName = '��� �����'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%94%D0%BE%D1%80%D0%BE%D1%82%D0%B5%D1%8F'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '�������'
SET @NameOrigin = '����.'
SET @DetailName = '������ �����'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%94%D0%BE%D1%81%D0%B8%D1%84%D0%B5%D0%B9#:~:text=%D0%94%D0%BE%D1%81%D0%B8%D1%84%D0%B5%CC%81%D0%B9%20(%D0%B3%D1%80%D0%B5%D1%87.,(%D1%80%D1%83%D1%81%D1%81%D0%BA%D0%B8%D0%B9%20%D0%B2%D0%B0%D1%80%D0%B8%D0%B0%D0%BD%D1%82%20%E2%80%94%20%D0%A4%D0%B5%D0%B4%D0%BE%D1%81%D0%B5%D0%B9).'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '�������'
SET @NameOrigin = '����.'
SET @DetailName = '������ �����'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%94%D0%BE%D1%81%D0%B8%D1%84%D0%B5%D1%8F_%D0%9A%D0%B8%D0%B5%D0%B2%D1%81%D0%BA%D0%B0%D1%8F'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '�������'
SET @NameOrigin = '����.'
SET @DetailName = '����'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://cyclowiki.org/wiki/%D0%94%D1%80%D0%BE%D1%81%D0%B8%D0%B4%D0%B0_%D0%A0%D0%B8%D0%BC%D1%81%D0%BA%D0%B0%D1%8F'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '�������'
SET @NameOrigin = '����.'
SET @DetailName = '�����������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '�������'
SET @NameOrigin = '���.'
SET @DetailName = '������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '����'
SET @NameOrigin = '����.'
SET @DetailName = '���'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '�����'
SET @NameOrigin = '����.'
SET @DetailName = '�������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
