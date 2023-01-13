USE [NamesCatalog]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW dbo.NamesFullInfo AS
SELECT T1.NamesId, T1.Name, T1.Sex , T3.NumbOfDay, T3.NumbOfMonth,
      CASE T3.NumbOfMonth 
		  WHEN 1 THEN '������' 
		  WHEN 2 THEN '�������' 
		  WHEN 3 THEN '����' 
		  WHEN 4 THEN '������' 
		  WHEN 5 THEN '���' 
		  WHEN 6 THEN '����' 
		  WHEN 7 THEN '����' 
		  WHEN 8 THEN '������' 
		  WHEN 9 THEN '��������' 
		  WHEN 10 THEN '�������' 
		  WHEN 11 THEN '������' 
		  WHEN 12 THEN '�������'
		  else ''
		END AS  MonthCaption_1,
		CASE T3.NumbOfMonth 
		  WHEN 1 THEN '������' 
		  WHEN 2 THEN '�������' 
		  WHEN 3 THEN '�����' 
		  WHEN 4 THEN '������' 
		  WHEN 5 THEN '���' 
		  WHEN 6 THEN '����' 
		  WHEN 7 THEN '����' 
		  WHEN 8 THEN '�������' 
		  WHEN 9 THEN '��������' 
		  WHEN 10 THEN '�������' 
		  WHEN 11 THEN '������' 
		  WHEN 12 THEN '�������'
		  else ''
		END AS  MonthCaption_2,
		ISNULL(T5.[FullNameOrigin], '������������� ����������') AS FullNameOrigin,
		ISNULL(T6.[DetailName], '�������� �� ����������') AS DetailName,
		ISNULL(T7.[ReferenceUrl], '�������� � ��������� �� ������') AS ReferenceUrl
 FROM [NamesCatalog].[dbo].[Names] T1
  LEFT JOIN [NamesCatalog].[dbo].[DaysOrtodoxChristians] T2 ON T2.NamesId = T1.NamesId
  LEFT JOIN [NamesCatalog].[dbo].[DaysOfYears] T3 ON T3.DaysOfYearsId = T2.DaysOfYearsId
  LEFT JOIN [NamesCatalog].[dbo].[NamesAdditionalInfo] T4 ON T4.NamesId = T1.NamesId
  LEFT JOIN [NamesCatalog].[dbo].[Origin] T5 ON T5.OriginId = T4.OriginId
  LEFT JOIN [NamesCatalog].[dbo].[Denotation] T6 ON T6.DenotationId = T4.DenotationId
  LEFT JOIN [NamesCatalog].[dbo].[UrlReference] T7 ON T7.NamesId = T1.NamesId
