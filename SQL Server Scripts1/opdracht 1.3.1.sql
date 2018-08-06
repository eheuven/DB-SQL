SELECT TOP (1000) [Clients].ClientNumber
      ,[Clients].FirstName
      ,[Clients].MiddleName
      ,[Clients].FamilyName
	  ,[Loans].Amount
	  ,[Adresses].ZipCode
	  
  FROM [Bank].[dbo].[Client] AS [Clients]
  JOIN [Bank].[dbo].[Address] AS [Adresses] ON [Clients].AddressID = [Adresses].ID
  JOIN [Bank].[dbo].[Loan] AS [Loans] ON [Clients].ID = [Loans].ClientID

  WHERE [Loans].Amount > 2500
  AND	[Adresses].ZipCode < '4000'
   AND	[Adresses].ZipCode > '3000'
