DROP VIEW IF EXISTS dwh.[Calendar]
GO

CREATE VIEW dwh.[Calendar] AS
/*This section is intended for the scripting layer*/
SELECT
    *
    /*### Add dynamically calculated columns, like offsets ###*/
    --#region Offset
    ,[Offset Year]                  = YEAR([Date]) - YEAR(GETDATE())										  
	,[Offset Quarter]				= DATEDIFF(QUARTER, GETDATE(), [Date])
	,[Offset Month]					= DATEDIFF(MONTH, GETDATE(), [Date])
	,[Offset Date]					= DATEDIFF(DAY, GETDATE(), [Date])
    ,last_updated = GETDATE()
    --#endregion
FROM [_DeltaSYS].[Dates]