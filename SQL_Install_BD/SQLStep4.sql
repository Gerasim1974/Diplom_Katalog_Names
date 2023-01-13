USE [NamesCatalog]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW dbo.NamesFullInfo AS
SELECT T1.NamesId, T1.Name, T1.Sex , T3.NumbOfDay, T3.NumbOfMonth,
      CASE T3.NumbOfMonth 
		  WHEN 1 THEN 'яЌ¬ј–№' 
		  WHEN 2 THEN '‘≈¬–јЋ№' 
		  WHEN 3 THEN 'ћј–“' 
		  WHEN 4 THEN 'јѕ–≈Ћ№' 
		  WHEN 5 THEN 'ћј…' 
		  WHEN 6 THEN '»ёЌ№' 
		  WHEN 7 THEN '»ёЋ№' 
		  WHEN 8 THEN 'ј¬√”—“' 
		  WHEN 9 THEN '—≈Ќ“яЅ–№' 
		  WHEN 10 THEN 'ќ “яЅ–№' 
		  WHEN 11 THEN 'ЌќяЅ–№' 
		  WHEN 12 THEN 'ƒ≈ јЅ–№'
		  else ''
		END AS  MonthCaption_1,
		CASE T3.NumbOfMonth 
		  WHEN 1 THEN 'яЌ¬ј–я' 
		  WHEN 2 THEN '‘≈¬–јЋя' 
		  WHEN 3 THEN 'ћј–“ј' 
		  WHEN 4 THEN 'јѕ–≈Ћя' 
		  WHEN 5 THEN 'ћјя' 
		  WHEN 6 THEN '»ёЌя' 
		  WHEN 7 THEN '»ёЋя' 
		  WHEN 8 THEN 'ј¬√”—“ј' 
		  WHEN 9 THEN '—≈Ќ“яЅ–я' 
		  WHEN 10 THEN 'ќ “яЅ–я' 
		  WHEN 11 THEN 'ЌќяЅ–я' 
		  WHEN 12 THEN 'ƒ≈ јЅ–я'
		  else ''
		END AS  MonthCaption_2,
		ISNULL(T5.[FullNameOrigin], 'происхождение неизвестно') AS FullNameOrigin,
		ISNULL(T6.[DetailName], 'значение не определено') AS DetailName,
		ISNULL(T7.[ReferenceUrl], 'источник в интернете не найден') AS ReferenceUrl
 FROM [NamesCatalog].[dbo].[Names] T1
  LEFT JOIN [NamesCatalog].[dbo].[DaysOrtodoxChristians] T2 ON T2.NamesId = T1.NamesId
  LEFT JOIN [NamesCatalog].[dbo].[DaysOfYears] T3 ON T3.DaysOfYearsId = T2.DaysOfYearsId
  LEFT JOIN [NamesCatalog].[dbo].[NamesAdditionalInfo] T4 ON T4.NamesId = T1.NamesId
  LEFT JOIN [NamesCatalog].[dbo].[Origin] T5 ON T5.OriginId = T4.OriginId
  LEFT JOIN [NamesCatalog].[dbo].[Denotation] T6 ON T6.DenotationId = T4.DenotationId
  LEFT JOIN [NamesCatalog].[dbo].[UrlReference] T7 ON T7.NamesId = T1.NamesId
