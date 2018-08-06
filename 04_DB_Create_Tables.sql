USE Bank;

/****** Create Address table ******/
CREATE TABLE "Address" (
	"ID" 					int IDENTITY(1,1) PRIMARY KEY,
	"Street"				varchar(150) NULL,
	"StreetNumber"			varchar(5) NOT NULL,
	"ZipCode"				varchar(7) NOT NULL,
	"City"					varchar(100) NULL
);

/****** Create Client table ******/
CREATE TABLE "Client" (
	"ID" 					int IDENTITY(1,1) PRIMARY KEY,
	"ClientNumber"			varchar(10) NOT NULL,
	"FirstName"				varchar(100) NOT NULL,
	"MiddleName"			varchar(100) NULL,
	"FamilyName"			varchar(100) NOT NULL,
	"AddressID"				int NOT NULL REFERENCES "Address"("ID")
);

/****** Create Account table ******/
CREATE TABLE "Account" (
	"ID" 					int IDENTITY(1,1) PRIMARY KEY,
	"AccountNumber"			varchar(10) NOT NULL,
	"Balance"				float NOT NULL,
	"Type"					char(1) NOT NULL,
	"DateOpened"			date NOT NULL,
	"ClientID"				int NOT NULL REFERENCES "Client"("ID")
);

/****** Create PaymentAuthorization table ******/
CREATE TABLE "PaymentAuthorization" (
	"ID" 					int IDENTITY(1,1) PRIMARY KEY,
	"Amount"				float NOT NULL,
	"ExecutionDayOfMonth"	int NOT NULL,
	"CreationDate"			date NOT NULL,
	"Description"			text NULL,
	"AccountID"				int NOT NULL REFERENCES "Account"("ID"),
	"PaymentAccountID"		int NOT NULL REFERENCES "Account"("ID")
);

/****** Create AccountTransaction table ******/
CREATE TABLE "AccountTransaction" (
	"ID" 					int IDENTITY(1,1) PRIMARY KEY,
	"Amount"				float NOT NULL,
	"Description"			text NULL,
	"Date"					date NOT NULL,
	"Type"					char(1) NOT NULL,
	"Code"					char(2) NOT NULL,
	"AccountID"				int NOT NULL REFERENCES "Account"("ID")
);

/****** Create Loan table ******/
CREATE TABLE "Loan" (
	"ID" 					int IDENTITY(1,1) PRIMARY KEY,
	"Amount"				float NOT NULL,
	"ContractDate"			date NOT NULL,
	"ExpirationDate"		date NOT NULL,
	"NumberOfPayment"		int NOT NULL,
	"LoanPercentage"		float NOT NULL,
	"LoanPenaltyPercentage"	float NOT NULL,
	"DateClosed"			date NULL,
	"ClientID"				int NOT NULL REFERENCES "Client"("ID"),
	"AccountID"				int NOT NULL REFERENCES "Account"("ID")
);

/****** Create Payment table ******/
CREATE TABLE "Payment" (
	"ID" 					int IDENTITY(1,1) PRIMARY KEY,
	"Amount"				float NOT NULL,
	"Description"			text NULL,
	"Date"					date NOT NULL,
	"LoanID"				int NOT NULL REFERENCES "Loan"("ID")
);
