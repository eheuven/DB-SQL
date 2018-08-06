SELECT TOP (1000)  [Clients].ClientNumber
	  ,[Clients].FirstName
	  ,[Clients].MiddleName
	  ,[Clients].FamilyName

	  ,SUM(CASE WHEN [Clients].ID = [Loans].ClientID
		  THEN [Payments].Amount
		  END) AS "total payments"

  FROM [Bank].[dbo].[Client] AS [Clients]
  JOIN [Bank].[dbo].[Loan] AS [Loans] ON [Clients].ID = [Loans].ClientID
  JOIN [Bank].[dbo].[Payment] AS [Payments] ON [Loans].ID = [Payments].LoanID

  WHERE [Loans].ExpirationDate > Convert(datetime, '2009-01-01' )

  GROUP BY [Clients].ClientNumber, [Clients].FirstName, [Clients].MiddleName, [Clients].FamilyName

  
