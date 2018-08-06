SELECT DISTINCT TOP (1000)  [Clients].FirstName
	  ,[Clients].MiddleName
	  ,[Clients].FamilyName
	  ,[Accounts].AccountNumber
	  ,[Accounts].Type
	  ,[Accounts].Balance
	  
	  ,SUM(
		  CASE WHEN [Transactions].Type ='C' 
		  THEN [Transactions].Amount
		  END
		) OVER () - SUM(
		  CASE WHEN [Transactions].Type ='D' 
          THEN [Transactions].Amount
		  END
		) OVER () AS "Total Transactions" 

  FROM [Bank].[dbo].[Client] AS [Clients]
  JOIN [Bank].[dbo].[Account] AS [Accounts] ON [Clients].ID = [Accounts].ClientID
  JOIN [Bank].[dbo].[AccountTransaction] AS [Transactions] ON [Transactions].AccountID = [Accounts].ID

  WHERE [Clients].FirstName = 'Tieneke'
  AND [Accounts].Type = 'C'