DECLARE @Name NVARCHAR(50)
DECLARE @NameOrigin NVARCHAR(50)
DECLARE @DetailName NVARCHAR(500)

DECLARE @Url NVARCHAR(4000)

--#############################################################
SET @Name = '������'
SET @NameOrigin = '���.'
SET @DetailName = '��������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%92%D0%B0%D0%B2%D0%B8%D0%BB%D0%B0#:~:text=%CE%92%CE%B1%CE%B2%CF%8D%CE%BB%CE%B1%CF%82)%20%E2%80%94%20%D0%BC%D1%83%D0%B6%D1%81%D0%BA%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F%20%D0%B3%D1%80%D0%B5%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B3%D0%BE%20%D0%BF%D1%80%D0%BE%D0%B8%D1%81%D1%85%D0%BE%D0%B6%D0%B4%D0%B5%D0%BD%D0%B8%D1%8F,%D1%83%D0%BC%D0%B5%D1%80%20%D0%BC%D0%B5%D0%B6%D0%B4%D1%83%20305%E2%80%94311%20%D0%B3%D0%BE%D0%B4%D0%B0%D0%BC%D0%B8)'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '�����'
SET @NameOrigin = '����.'
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%92%D0%B0%D0%B4%D0%B8%D0%BC#:~:text=%D0%92%D0%B0%D0%B4%D0%B8%CC%81%D0%BC%20%E2%80%94%20%D0%BC%D1%83%D0%B6%D1%81%D0%BA%D0%BE%D0%B5%20%D1%80%D1%83%D1%81%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BB%D0%B8%D1%87%D0%BD%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F.&text=%D0%91%D0%BE%D0%BB%D1%8C%D1%88%D0%B8%D0%BD%D1%81%D1%82%D0%B2%D0%BE%20%D1%81%D0%BF%D0%B5%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D1%81%D1%82%D0%BE%D0%B2%20%D1%81%D1%87%D0%B8%D1%82%D0%B0%D0%B5%D1%82%20%D1%8D%D1%82%D0%BE%20%D0%B8%D0%BC%D1%8F,%D0%BA%D0%B0%D0%BA%20%D1%81%D0%BE%D0%BA%D1%80%D0%B0%D1%89%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%81%D0%BB%D0%B0%D0%B2%D1%8F%D0%BD%D1%81%D0%BA%D0%BE%D0%B3%D0%BE%20%D0%B8%D0%BC%D0%B5%D0%BD%D0%B8%20%D0%92%D0%B0%D0%B4%D0%B8%D0%BC%D0%B8%D1%80.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '����'
SET @NameOrigin = '����.'
SET @DetailName = '��� ���������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%92%D0%B0%D0%BA%D1%85_(%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D1%8F)#:~:text=%D0%92%D0%B0%D0%BA%D1%85%20(%D0%91%D0%B0%CC%81%D1%85%D1%83%D1%81%2C%20%D0%94%D0%B8%D0%BE%CC%81%D0%BD%D0%B8%CC%81%D1%81)%20%E2%80%94,%D0%BE%D1%82%D0%BC%D0%B5%D1%87%D0%B0%D0%B5%D1%82%D1%81%D1%8F%207%20(20)%20%D0%BE%D0%BA%D1%82%D1%8F%D0%B1%D1%80%D1%8F.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '������'
SET @NameOrigin = '���.'
SET @DetailName = '�������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%92%D0%B0%D0%BB%D0%B5%D0%BD%D1%82_(%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D1%8F)'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '��������'
SET @NameOrigin = '���.'
SET @DetailName = '�������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%92%D0%B0%D0%BB%D0%B5%D0%BD%D1%82%D0%B8%D0%BD#:~:text=%D0%92%D0%B0%D0%BB%D0%B5%D0%BD%D1%82%D0%B8%CC%81%D0%BD%20%E2%80%94%20%D0%BC%D1%83%D0%B6%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BB%D0%B8%D1%87%D0%BD%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F%20%D0%BB%D0%B0%D1%82%D0%B8%D0%BD%D1%81%D0%BA%D0%BE%D0%B3%D0%BE,%D0%A6%D0%B5%D1%80%D0%BA%D0%BE%D0%B2%D0%BD%D0%B0%D1%8F%20%D1%84%D0%BE%D1%80%D0%BC%D0%B0%20%D0%B8%D0%BC%D0%B5%D0%BD%D0%B8%20%E2%80%94%20%D0%A3%D0%B0%D0%BB%D0%B5%D0%BD%D1%82%D0%B8%CC%81%D0%BD.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '���������'
SET @NameOrigin = '���.'
SET @DetailName = '�������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%92%D0%B0%D0%BB%D0%B5%D0%BD%D1%82%D0%B8%D0%BD%D0%B0#:~:text=%D0%92%D0%B0%D0%BB%D0%B5%D0%BD%D1%82%D0%B8%CC%81%D0%BD%D0%B0%20%E2%80%94%20%D0%B6%D0%B5%D0%BD%D1%81%D0%BA%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F%20(%D0%BE%D1%82%20%D0%BB%D0%B0%D1%82,%D0%BF%D1%80%D0%BE%D0%B8%D0%B7%D0%B2%D0%BE%D0%B4%D0%BD%D0%BE%D0%B5%20%D0%BE%D1%82%20%D0%BC%D1%83%D0%B6%D1%81%D0%BA%D0%BE%D0%B3%D0%BE%20%D0%B8%D0%BC%D0%B5%D0%BD%D0%B8%20%D0%92%D0%B0%D0%BB%D0%B5%D0%BD%D1%82%D0%B8%D0%BD.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '��������'
SET @NameOrigin = '���.'
SET @DetailName = '������� �������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%92%D0%B0%D0%BB%D0%B5%D1%80%D1%8C%D1%8F%D0%BD#:~:text=%D0%92%D0%B0%D0%BB%D0%B5%D1%80%D1%8C%D1%8F%CC%81%D0%BD%2C%20%D0%92%D0%B0%D0%BB%D0%B5%D1%80%D0%B8%D0%B0%CC%81%D0%BD%20%E2%80%94%20%D0%BC%D1%83%D0%B6%D1%81%D0%BA%D0%BE%D0%B5%20%D1%80%D1%83%D1%81%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BB%D0%B8%D1%87%D0%BD%D0%BE%D0%B5,%C2%AB%D0%92%D0%B0%D0%BB%D0%B5%D1%80%D0%B8%D0%B0%D0%BD%D1%83%D1%81%C2%BB%20%E2%80%94%20%D1%8D%D0%BF%D0%B8%D1%82%D0%B5%D1%82%20%D0%9C%D0%B0%D1%80%D1%81%D0%B0.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '�������'
SET @NameOrigin = '���.'
SET @DetailName = '�������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%92%D0%B0%D0%BB%D0%B5%D1%80%D0%B8%D0%B9'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '�������'
SET @NameOrigin = '���.'
SET @DetailName = '�������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%92%D0%B0%D0%BB%D0%B5%D1%80%D0%B8%D1%8F#:~:text=%D0%92%D0%B0%D0%BB%D0%B5%D1%80%D0%B8%D1%8F%20%E2%80%94%20%D0%B6%D0%B5%D0%BD%D1%81%D0%BA%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F%2C%20%D0%BF%D1%80%D0%BE%D0%B8%D1%81%D1%85%D0%BE%D0%B4%D0%B8%D1%82%20%D0%BE%D1%82,%C2%AB%D0%B1%D1%8B%D1%82%D1%8C%20%D1%81%D0%B8%D0%BB%D1%8C%D0%BD%D1%8B%D0%BC%2C%20%D0%B7%D0%B4%D0%BE%D1%80%D0%BE%D0%B2%D1%8B%D0%BC%C2%BB.&text=%D0%9D%D0%B0%20%D0%A0%D1%83%D1%81%D1%8C%20%D0%BF%D1%80%D0%B8%D0%BD%D0%B5%D1%81%D0%B5%D0%BD%D0%BE%20%D1%85%D1%80%D0%B8%D1%81%D1%82%D0%B8%D0%B0%D0%BD%D1%81%D1%82%D0%B2%D0%BE%D0%BC%20%D0%B8%D0%B7%20%D0%92%D0%B8%D0%B7%D0%B0%D0%BD%D1%82%D0%B8%D0%B8.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '������'
SET @NameOrigin = '����.'
SET @DetailName = ''
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
SET @Name = '��������'
SET @NameOrigin = '���.'
SET @DetailName = '����� ��������������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%92%D0%B0%D1%80%D0%B0%D1%85%D0%B8%D0%B8%D0%BB#:~:text=%E2%80%8F%D7%91%D7%A8%D7%9B%D7%99%D7%90%D7%9C%E2%80%8F%E2%80%8E%20%E2%80%94%20%D0%B1%D0%BB%D0%B0%D0%B3%D0%BE%D1%81%D0%BB%D0%BE%D0%B2%D0%B5%D0%BD%D0%B8%D0%B5,%D0%BD%D0%B0%20%D0%B2%D1%81%D1%8F%D0%BA%D0%BE%D0%B5%20%D0%B4%D0%BE%D0%B1%D1%80%D0%BE%D0%B5%20%D0%B6%D0%B8%D1%82%D0%B5%D0%B9%D1%81%D0%BA%D0%BE%D0%B5%20%D0%B7%D0%B0%D0%BD%D1%8F%D1%82%D0%B8%D0%B5%C2%BB.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '�������'
SET @NameOrigin = '���.'
SET @DetailName = '����� ��������������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%92%D0%B0%D1%80%D0%B0%D1%85%D0%B8%D0%B8%D0%BB#:~:text=%E2%80%8F%D7%91%D7%A8%D7%9B%D7%99%D7%90%D7%9C%E2%80%8F%E2%80%8E%20%E2%80%94%20%D0%B1%D0%BB%D0%B0%D0%B3%D0%BE%D1%81%D0%BB%D0%BE%D0%B2%D0%B5%D0%BD%D0%B8%D0%B5,%D0%BD%D0%B0%20%D0%B2%D1%81%D1%8F%D0%BA%D0%BE%D0%B5%20%D0%B4%D0%BE%D0%B1%D1%80%D0%BE%D0%B5%20%D0%B6%D0%B8%D1%82%D0%B5%D0%B9%D1%81%D0%BA%D0%BE%D0%B5%20%D0%B7%D0%B0%D0%BD%D1%8F%D1%82%D0%B8%D0%B5%C2%BB.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '���������'
SET @NameOrigin = '����.'
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://religion.wikireading.ru/15649'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '������'
SET @NameOrigin = '����.'
SET @DetailName = '���������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '�������'
SET @NameOrigin = '����.'
SET @DetailName = '��������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%92%D0%B0%D1%80%D0%B2%D0%B0%D1%80%D0%B0'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '��������'
SET @NameOrigin = '����.'
SET @DetailName = '������� ����������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%92%D0%B0%D1%80%D0%B8%D0%BF%D1%81%D0%B0%D0%B2'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '�������'
SET @NameOrigin = '����.'
SET @DetailName = '��� �����'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%92%D0%B0%D1%80%D0%BB%D0%B0%D0%BC#:~:text=%D0%92%D0%B0%D1%80%D0%BB%D0%B0%CC%81%D0%BC%20%E2%80%94%20%D0%BC%D1%83%D0%B6%D1%81%D0%BA%D0%BE%D0%B5%20%D1%80%D1%83%D1%81%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BB%D0%B8%D1%87%D0%BD%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F,%D0%A6%D0%B5%D1%80%D0%BA%D0%BE%D0%B2%D0%BD%D0%BE%D1%81%D0%BB%D0%B0%D0%B2%D1%8F%D0%BD%D1%81%D0%BA%D0%B0%D1%8F%20%D1%84%D0%BE%D1%80%D0%BC%D0%B0%20%D0%B8%D0%BC%D0%B5%D0%BD%D0%B8%20%E2%80%94%20%D0%92%D0%B0%D1%80%D0%BB%D0%B0%D0%B0%CC%81%D0%BC.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '�������'
SET @NameOrigin = '���.'
SET @DetailName = '��� ��������' 
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%92%D0%B0%D1%80%D0%BD%D0%B0%D0%B2%D0%B0'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '������'
SET @NameOrigin = ''
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '����������'
SET @NameOrigin = '����.'
SET @DetailName = '������ �����'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%92%D0%B0%D1%80%D1%81%D0%BE%D0%BD%D0%BE%D1%84%D0%B8%D0%B9#:~:text=%D0%92%D0%B0%D1%80%D1%81%D0%BE%D0%BD%D0%BE%CC%81%D1%84%D0%B8%D0%B9%2C%20%D0%B8%D0%BB%D0%B8%20%D0%92%D0%B0%D1%80%D1%81%D0%B0%D0%BD%D0%BE%CC%81%D1%84%D0%B8%D0%B9%20(%D0%B3%D1%80%D0%B5%D1%87.,%D1%81%D1%82%D1%80%D0%B0%D0%B6%C2%BB)%20%E2%80%94%20%D0%BC%D1%83%D0%B6%D1%81%D0%BA%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '�����'
SET @NameOrigin = '���.'
SET @DetailName = '��� �����'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '�����'
SET @NameOrigin = '���.'
SET @DetailName = '��������������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%91%D0%B0%D1%80%D1%83%D1%85#:~:text=%E2%80%8F%D7%91%D7%A8%D7%95%D7%9A%E2%80%8F%E2%80%8F%E2%80%8E,%D0%B8%D0%B5%D1%80%D1%83%D1%81%D0%B0%D0%BB%D0%B8%D0%BC%D1%81%D0%BA%D0%B8%D1%85%20%D1%81%D1%82%D0%B5%D0%BD%20%D0%BF%D1%80%D0%B8%20%D0%9D%D0%B5%D0%B5%D0%BC%D0%B8%D0%B8%20(%D0%9D%D0%B5%D0%B5%D0%BC.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '����������'
SET @NameOrigin = '���.'
SET @DetailName = '��� �������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%92%D0%B0%D1%80%D1%84%D0%BE%D0%BB%D0%BE%D0%BC%D0%B5%D0%B9_(%D0%B8%D0%BC%D1%8F)'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '�������'
SET @NameOrigin = '����.'
SET @DetailName = '�����������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%92%D0%B0%D1%81%D0%B8%D0%BB%D0%B8%D0%B9#:~:text=%CE%92%CE%B1%CF%83%CE%AF%CE%BB%CE%B5%CE%B9%CE%BF%CF%82)%20%E2%80%94%20%D0%BC%D1%83%D0%B6%D1%81%D0%BA%D0%BE%D0%B5%20%D1%80%D1%83%D1%81%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BB%D0%B8%D1%87%D0%BD%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F,%D1%86%D0%B0%D1%80%D1%8C%2C%20%D0%BC%D0%BE%D0%BD%D0%B0%D1%80%D1%85%2C%20%D0%BF%D1%80%D0%B0%D0%B2%D0%B8%D1%82%D0%B5%D0%BB%D1%8C%C2%BB.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '�������'
SET @NameOrigin = '����.'
SET @DetailName = '�����������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%92%D0%B0%D1%81%D0%B8%D0%BB%D0%B8%D0%B9#:~:text=%CE%92%CE%B1%CF%83%CE%AF%CE%BB%CE%B5%CE%B9%CE%BF%CF%82)%20%E2%80%94%20%D0%BC%D1%83%D0%B6%D1%81%D0%BA%D0%BE%D0%B5%20%D1%80%D1%83%D1%81%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BB%D0%B8%D1%87%D0%BD%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F,%D1%86%D0%B0%D1%80%D1%8C%2C%20%D0%BC%D0%BE%D0%BD%D0%B0%D1%80%D1%85%2C%20%D0%BF%D1%80%D0%B0%D0%B2%D0%B8%D1%82%D0%B5%D0%BB%D1%8C%C2%BB.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '��������'
SET @NameOrigin = '����.'
SET @DetailName = '�����������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%92%D0%B0%D1%81%D0%B8%D0%BB%D0%B8%D1%81%D0%B0#:~:text=%CE%92%CE%B1%CF%83%CE%AF%CE%BB%CE%B9%CF%83%CF%83%CE%B1)%20%E2%80%94%20%D0%B6%D0%B5%D0%BD%D1%81%D0%BA%D0%BE%D0%B5%20%D1%80%D1%83%D1%81%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BB%D0%B8%D1%87%D0%BD%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F,%D0%B1%D0%BE%D0%B3%D0%B8%D0%BD%D1%8C%20%D0%93%D0%B5%D1%80%D1%8B%2C%20%D0%90%D1%84%D1%80%D0%BE%D0%B4%D0%B8%D1%82%D1%8B%2C%20%D0%9F%D0%B5%D1%80%D1%81%D0%B5%D1%84%D0%BE%D0%BD%D1%8B.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '��������'
SET @NameOrigin = '����.'
SET @DetailName = '�����'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%92%D0%B0%D1%81%D0%B8%D0%BB%D0%B8%D1%81%D0%BA'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '���������'
SET @NameOrigin = '����.'
SET @DetailName = '�����������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%92%D0%B0%D1%81%D0%B8%D0%BB%D0%B8%D1%81%D0%B0#:~:text=%CE%92%CE%B1%CF%83%CE%AF%CE%BB%CE%B9%CF%83%CF%83%CE%B1)%20%E2%80%94%20%D0%B6%D0%B5%D0%BD%D1%81%D0%BA%D0%BE%D0%B5%20%D1%80%D1%83%D1%81%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BB%D0%B8%D1%87%D0%BD%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F,%D0%B1%D0%BE%D0%B3%D0%B8%D0%BD%D1%8C%20%D0%93%D0%B5%D1%80%D1%8B%2C%20%D0%90%D1%84%D1%80%D0%BE%D0%B4%D0%B8%D1%82%D1%8B%2C%20%D0%9F%D0%B5%D1%80%D1%81%D0%B5%D1%84%D0%BE%D0%BD%D1%8B.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '�������'
SET @NameOrigin = '����.'
SET @DetailName = '�����������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%92%D0%B0%D1%81%D0%B8%D0%BB%D0%B8%D1%81%D0%B0#:~:text=%CE%92%CE%B1%CF%83%CE%AF%CE%BB%CE%B9%CF%83%CF%83%CE%B1)%20%E2%80%94%20%D0%B6%D0%B5%D0%BD%D1%81%D0%BA%D0%BE%D0%B5%20%D1%80%D1%83%D1%81%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BB%D0%B8%D1%87%D0%BD%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F,%D0%B1%D0%BE%D0%B3%D0%B8%D0%BD%D1%8C%20%D0%93%D0%B5%D1%80%D1%8B%2C%20%D0%90%D1%84%D1%80%D0%BE%D0%B4%D0%B8%D1%82%D1%8B%2C%20%D0%9F%D0%B5%D1%80%D1%81%D0%B5%D1%84%D0%BE%D0%BD%D1%8B.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '�����'
SET @NameOrigin = ''
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '����'
SET @NameOrigin = ''
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%92%D0%B0%D1%81%D1%81'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '�����'
SET @NameOrigin = '����.'
SET @DetailName = '�������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%92%D0%B0%D1%81%D1%81%D0%B0#:~:text=%D0%92%D0%B0%CC%81%D1%81%D1%81%D0%B0%20%E2%80%94%20%D0%B6%D0%B5%D0%BD%D1%81%D0%BA%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F%20%D0%BE%D1%82%20%D0%B3%D1%80%D0%B5%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B3%D0%BE,%D0%96%D0%B5%D0%BD%D1%81%D0%BA%D0%B0%D1%8F%20%D1%84%D0%BE%D1%80%D0%BC%D0%B0%20%D0%BC%D1%83%D0%B6%D1%81%D0%BA%D0%BE%D0%B3%D0%BE%20%D0%B8%D0%BC%D0%B5%D0%BD%D0%B8%20%D0%92%D0%B0%D1%81%D1%81.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '�������'
SET @NameOrigin = '���.'
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%92%D0%B0%D1%81%D1%81%D0%B8%D0%B0%D0%BD#:~:text=%D0%92%D0%B0%D1%81%D1%81%D0%B8%D0%B0%D0%BD%20(%D0%BB%D0%B0%D1%82.,%D1%86%D0%B5%D1%80%D0%BA%D0%B2%D0%B8%2C%20%D0%B0%D1%80%D1%85%D0%B8%D0%B5%D0%BF%D0%B8%D1%81%D0%BA%D0%BE%D0%BF%20%D0%9A%D0%B0%D0%B7%D0%B0%D0%BD%D1%81%D0%BA%D0%B8%D0%B9%20%D0%B8%20%D0%A1%D0%B2%D0%B8%D1%8F%D0%B6%D1%81%D0%BA%D0%B8%D0%B9.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '����'
SET @NameOrigin = '����.'
SET @DetailName = '������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%92%D0%B0%D1%82%D0%B0_(%D0%B8%D0%BD%D0%B4%D1%83%D0%B8%D0%B7%D0%BC)#:~:text=%E0%A4%B5%E0%A4%BE%E0%A4%A4%2C%20IAST%3A%20v%C4%81ta%2C%20%D0%B1%D1%83%D0%BA%D0%B2,%D0%B2%20%D0%B8%D0%BD%D0%B4%D0%B8%D0%B9%D1%81%D0%BA%D0%BE%D0%B9%20%D0%BC%D0%B8%D1%84%D0%BE%D0%BB%D0%BE%D0%B3%D0%B8%D0%B8%20%D0%B1%D0%BE%D0%B6%D0%B5%D1%81%D1%82%D0%B2%D0%BE%20%D0%B2%D0%B5%D1%82%D1%80%D0%B0.&text=%D0%92%D0%B0%D1%82%D0%B0%20%D0%BE%D1%87%D0%B5%D0%BD%D1%8C%20%D1%82%D0%B5%D1%81%D0%BD%D0%BE%20%D1%81%D0%B2%D1%8F%D0%B7%D0%B0%D0%BD%20%D1%81,%D1%81%D0%BC%D1%8B%D1%81%D0%BB%20%D1%80%D0%B0%D1%81%D1%81%D0%BC%D0%B0%D1%82%D1%80%D0%B8%D0%B2%D0%B0%D1%82%D1%8C%20%D0%B8%D1%85%20%D0%BF%D0%BE%20%D0%BE%D1%82%D0%B4%D0%B5%D0%BB%D1%8C%D0%BD%D0%BE%D1%81%D1%82%D0%B8.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '�������'
SET @NameOrigin = '����.'
SET @DetailName = '��������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '��������'
SET @NameOrigin = '����.'
SET @DetailName = '�������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '�����'
SET @NameOrigin = '����.'
SET @DetailName = '������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%A4%D0%B8%D1%84%D0%B0%D0%B8%D0%BB_%D0%B8_%D0%A4%D0%B8%D0%B2%D0%B5%D1%8F'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '���������'
SET @NameOrigin = '���.'
SET @DetailName = '���� ���������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '��������'
SET @NameOrigin = '���.'
SET @DetailName = '��������������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '�������'
SET @NameOrigin = ''
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '��������'
SET @NameOrigin = '���.'
SET @DetailName = '��� �������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%92%D0%B5%D0%BD%D0%B8%D0%B0%D0%BC%D0%B8%D0%BD_(%D0%B8%D0%BC%D1%8F)#:~:text=%D0%92%D0%B5%D0%BD%D0%B8%D0%B0%D0%BC%D0%B8%D0%BD%20(%D0%92%D0%B5%D0%BD%D1%8C%D1%8F%D0%BC%D0%B8%D0%BD)%20%E2%80%94%20%D1%80%D1%83%D1%81%D1%81%D0%BA%D0%BE%D1%8F%D0%B7%D1%8B%D1%87%D0%BD%D0%B0%D1%8F%20%D0%B2%D0%B5%D1%80%D1%81%D0%B8%D1%8F,%E2%80%94%20%D0%91%D0%B5%D0%BD%D0%B4%D0%B6%D0%B0%D0%BC%D0%B8%D0%BD%2C%20%D1%84%D1%80.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '����'
SET @NameOrigin = '����.'
SET @DetailName = '����'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%92%D0%B5%D1%80%D0%B0_(%D0%B8%D0%BC%D1%8F)#:~:text=%D0%92%D0%B5%CC%81%D1%80%D0%B0%20%E2%80%94%20%D0%B6%D0%B5%D0%BD%D1%81%D0%BA%D0%BE%D0%B5%20%D1%80%D1%83%D1%81%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BB%D0%B8%D1%87%D0%BD%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F,%D0%9F%D0%B8%D1%81%D1%82%D0%B8%D1%81)%2C%20%D0%B8%D0%BC%D0%B5%D0%BD%D0%B8%20%D1%80%D0%B0%D0%BD%D0%BD%D0%B5%D1%85%D1%80%D0%B8%D1%81%D1%82%D0%B8%D0%B0%D0%BD%D1%81%D0%BA%D0%BE%D0%B9%20%D1%81%D0%B2%D1%8F%D1%82%D0%BE%D0%B9.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '����'
SET @NameOrigin = '����.'
SET @DetailName = '����'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '������'
SET @NameOrigin = '����.'
SET @DetailName = '�������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '������'
SET @NameOrigin = '���.'
SET @DetailName = '�������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%92%D0%B8%D0%B2%D0%B8%D0%B0%D0%BD'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '��������'
SET @NameOrigin = '���.'
SET @DetailName = '�����������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%92%D0%B8%D0%BA%D0%B5%D0%BD%D1%82%D0%B8%D0%B9'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '������'
SET @NameOrigin = '���.'
SET @DetailName = '����������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%92%D0%B8%D0%BA%D1%82%D0%BE%D1%80_(%D0%B8%D0%BC%D1%8F)'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '��������'
SET @NameOrigin = '���.'
SET @DetailName = '�������������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%92%D0%B8%D0%BA%D1%82%D0%BE%D1%80%D0%B8%D0%BD'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '��������'
SET @NameOrigin = '���.'
SET @DetailName = '������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%92%D0%B8%D0%BA%D1%82%D0%BE%D1%80%D0%B8%D1%8F_(%D0%B8%D0%BC%D1%8F)#:~:text=%D0%92%D0%B8%D0%BA%D1%82%D0%BE%CC%81%D1%80%D0%B8%D1%8F%20(%D0%BE%D1%82%20%D0%BB%D0%B0%D1%82.,%D0%9C%D1%83%D0%B6%D1%81%D0%BA%D0%B0%D1%8F%20%D1%84%D0%BE%D1%80%D0%BC%D0%B0%20%D0%B8%D0%BC%D0%B5%D0%BD%D0%B8%20%E2%80%94%20%D0%92%D0%B8%D0%BA%D1%82%D0%BE%D1%80.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '���'
SET @NameOrigin = '����.'
SET @DetailName = '������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '�����'
SET @NameOrigin = '���.'
SET @DetailName = '������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%92%D0%B8%D0%BE%D0%BB%D0%B0_(%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D1%8F)#:~:text=%D0%92%D0%B8%D0%BE%CC%81%D0%BB%D0%B0%20%E2%80%94%20%D0%B6%D0%B5%D0%BD%D1%81%D0%BA%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F%20(%D0%BE%D1%82%20%D0%BB%D0%B0%D1%82,%2C%20%D0%B0%20%D0%B8%D0%BC%D1%8F%20%D0%92%D0%B8%D0%BE%D0%BB%D0%B5%D1%82%D1%82%D0%B0%20%E2%80%94%20%D0%B8%D1%82%D0%B0%D0%BB%D1%8C%D1%8F%D0%BD%D1%81%D0%BA%D0%BE%D0%B5.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '���'
SET @NameOrigin = '���.'
SET @DetailName = '�������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '�������'
SET @NameOrigin = '���.'
SET @DetailName = '������������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '�������'
SET @NameOrigin = ''
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '���������'
SET @NameOrigin = '����.'
SET @DetailName = '������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%92%D0%B8%D1%81%D1%81%D0%B0%D1%80%D0%B8%D0%BE%D0%BD'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '���'
SET @NameOrigin = '���.'
SET @DetailName = '�����������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '�������'
SET @NameOrigin = '���.'
SET @DetailName = '���������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%92%D0%B8%D1%82%D0%B0%D0%BB%D0%B8%D0%B9#:~:text=%D0%92%D0%B8%D1%82%D0%B0%CC%81%D0%BB%D0%B8%D0%B9%20(%D0%BB%D0%B0%D1%82.,%D1%80%D1%83%D1%81%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BB%D0%B8%D1%87%D0%BD%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F%20%D0%B4%D1%80%D0%B5%D0%B2%D0%BD%D0%B5%D1%80%D0%B8%D0%BC%D1%81%D0%BA%D0%BE%D0%B3%D0%BE%20%D0%BF%D1%80%D0%BE%D0%B8%D1%81%D1%85%D0%BE%D0%B6%D0%B4%D0%B5%D0%BD%D0%B8%D1%8F.&text=%D0%A1%D0%BE%D0%BA%D1%80%D0%B0%D1%89%D1%91%D0%BD%D0%BD%D0%B0%D1%8F%20%D1%84%D0%BE%D1%80%D0%BC%D0%B0%20%D0%92%D0%B8%D1%82%D1%8F%20%D1%8F%D0%B2%D0%BB%D1%8F%D0%B5%D1%82%D1%81%D1%8F%2C%20%D0%BA%D0%B0%D0%BA,%D0%BF%D0%BE%D0%BF%D0%B0%D0%BB%D0%BE%20%D1%81%20%D1%85%D1%80%D0%B8%D1%81%D1%82%D0%B8%D0%B0%D0%BD%D1%81%D1%82%D0%B2%D0%BE%D0%BC%20%D0%B8%D0%B7%20%D0%92%D0%B8%D0%B7%D0%B0%D0%BD%D1%82%D0%B8%D0%B8.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '�������'
SET @NameOrigin = '����.'
SET @DetailName = '���������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '��������'
SET @NameOrigin = '����.'
SET @DetailName = '������� � ����� ������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%92%D0%BB%D0%B0%D0%B4%D0%B8%D0%BC%D0%B8%D1%80_(%D0%B8%D0%BC%D1%8F)'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '���������'
SET @NameOrigin = '����.'
SET @DetailName = '�����'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%92%D0%BB%D0%B0%D0%B4%D0%B8%D1%81%D0%BB%D0%B0%D0%B2#:~:text=%D0%9E%D0%B1%D1%80%D0%B0%D0%B7%D0%BE%D0%B2%D0%B0%D0%BD%D0%BE%20%D1%81%D0%BB%D0%BE%D0%B6%D0%B5%D0%BD%D0%B8%D0%B5%D0%BC%20%D0%BE%D1%81%D0%BD%D0%BE%D0%B2%20%D0%B2%D0%BB%D0%B0%D0%B4%20%E2%80%94%20(%D1%81%D1%80,%C2%AB%D1%81%D0%BB%D0%B0%D0%B2%D0%BD%D1%8B%D0%B9%2C%20%D0%B7%D0%BD%D0%B0%D0%BC%D0%B5%D0%BD%D0%B8%D1%82%D1%8B%D0%B9%C2%BB).'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '����'
SET @NameOrigin = '����.'
SET @DetailName = '�������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%92%D0%BB%D0%B0%D1%81#:~:text=%D0%92%D0%BB%D0%B0%D1%81%2C%20%D1%86%D0%B5%D1%80%D0%BA.,%2C%20%D0%BE%D0%B1%D1%80%D0%BE%D1%81%D1%88%D0%B8%D0%B9%20%D0%B2%D0%BE%D0%BB%D0%BE%D1%81%D0%BE%D0%BC%2C%20%D1%88%D0%B5%D1%80%D1%81%D1%82%D1%8C%D1%8E%C2%BB.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '���������'
SET @NameOrigin = '���.'
SET @DetailName = '�����������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%92%D0%BE%D0%BD%D0%B8%D1%84%D0%B0%D1%82%D0%B8%D0%B9_(%D0%92%D0%B8%D0%BD%D0%BE%D0%B3%D1%80%D0%B0%D0%B4%D1%81%D0%BA%D0%B8%D0%B9)'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '������'
SET @NameOrigin = ''
SET @DetailName = ''
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

--SET @Url = ''
--EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '��������'
SET @NameOrigin = '����.'
SET @DetailName = '���� ���������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%92%D1%81%D0%B5%D0%B2%D0%BE%D0%BB%D0%BE%D0%B4'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '�����'
SET @NameOrigin = '����.'
SET @DetailName = '������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%92%D1%83%D0%BA%D0%BE%D0%BB#:~:text=%CE%B2%CE%BF%CF%85%CE%BA%CF%8C%CE%BB%CE%BF%CF%82%20%E2%80%94%20%C2%AB%D0%BF%D0%B0%D1%81%D1%82%D1%83%D1%85%C2%BB)%20%E2%80%94,%D1%84%D0%B0%D0%BC%D0%B8%D0%BB%D0%B8%D0%B8%20%D0%92%D1%83%D0%BA%D0%BE%D0%BB%D0%BE%D0%B2%2C%20%D0%92%D0%B8%D0%BA%D1%83%D0%BB%D0%B8%D0%BD%2C%20%D0%92%D0%B8%D0%BA%D1%83%D0%BB%D0%BE%D0%B2.&text=%D0%98%D0%BC%D0%B5%D0%BD%D0%B8%D0%BD%D1%8B%3A%2019%20%D1%84%D0%B5%D0%B2%D1%80%D0%B0%D0%BB%D1%8F.,%2C%20%D0%92%D0%B8%D0%BA%D1%83%D1%88%D0%B0%2C%20%D0%9A%D1%83%D0%BB%D1%8F%2C%20%D0%A3%D0%BA%D0%BE%D0%BB.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
SET @Name = '��������'
SET @NameOrigin = '���.'
SET @DetailName = '����� �������'
EXEC [NamesCatalog].[dbo].[AdditionalFullInfoNames] @Name, @NameOrigin, @DetailName

SET @Url = 'https://ru.wikipedia.org/wiki/%D0%92%D1%8F%D1%87%D0%B5%D1%81%D0%BB%D0%B0%D0%B2#:~:text=%D0%92%D1%8F%D1%87%D0%B5%D1%81%D0%BB%D0%B0%CC%81%D0%B2%20%E2%80%94%20%D0%BC%D1%83%D0%B6%D1%81%D0%BA%D0%BE%D0%B5%20%D0%B4%D0%B2%D1%83%D1%85%D0%BE%D1%81%D0%BD%D0%BE%D0%B2%D0%BD%D0%BE%D0%B5%20%D1%80%D1%83%D1%81%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BB%D0%B8%D1%87%D0%BD%D0%BE%D0%B5,%D1%81%D0%BE%20%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%D0%BC%20%C2%AB%D0%B1%D0%BE%D0%BB%D0%B5%D0%B5%20%D1%81%D0%BB%D0%B0%D0%B2%D0%BD%D1%8B%D0%B9%C2%BB.&text=%D0%94%D1%80%D0%B5%D0%B2%D0%BD%D1%8F%D1%8F%20%D1%86%D0%B5%D1%80%D0%BA%D0%BE%D0%B2%D0%BD%D0%B0%D1%8F%20%D1%84%D0%BE%D1%80%D0%BC%D0%B0%20%D0%B8%D0%BC%D0%B5%D0%BD%D0%B8%20%E2%80%94%20%D0%92%D1%8F%D1%86%D0%B5%D1%81%D0%BB%D0%B0%CC%81%D0%B2,%D1%81%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%D0%BD%D1%8B%20XVII%20%D0%B2%D0%B5%D0%BA%D0%B0)%20%E2%80%94%20%D0%92%D0%B5%D1%87%D0%B5%D1%81%D0%BB%D0%B0%CC%81%D0%B2.'
EXEC [NamesCatalog].[dbo].[AddUrlReference] @Name, @Url
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--#############################################################
