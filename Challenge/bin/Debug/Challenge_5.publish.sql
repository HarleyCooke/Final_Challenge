﻿/*
Deployment script for ChallengeDataBase

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar LoadTestData "true"
:setvar DatabaseName "ChallengeDataBase"
:setvar DefaultFilePrefix "ChallengeDataBase"
:setvar DefaultDataPath ""
:setvar DefaultLogPath ""

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
PRINT N'Rename refactoring operation with key 79747096-d6be-4025-94da-458f24b131a1 is skipped, element [dbo].[Members].[userName] (SqlSimpleColumn) will not be renamed to MemberId';


GO
PRINT N'Rename refactoring operation with key 97341c0b-f20c-44c6-802d-a98981675e72 is skipped, element [dbo].[Groups].[GroupName] (SqlSimpleColumn) will not be renamed to GroupId';


GO
PRINT N'Rename refactoring operation with key 4052f4cc-fedb-452e-8981-0744111dbd62 is skipped, element [dbo].[Members].[password] (SqlSimpleColumn) will not be renamed to UserName';


GO
PRINT N'Rename refactoring operation with key 4bd7e487-70b5-4f2e-b57c-94fc38dd3897 is skipped, element [dbo].[Groups].[Members] (SqlSimpleColumn) will not be renamed to GroupName';


GO
PRINT N'Rename refactoring operation with key 1ef02e05-31ca-4497-96a5-1d7051e7583c, 328ce8b2-6caa-465b-be03-ca31cc0378ab, e70ed74e-5ce4-4c22-9a3e-e9079ba286cd is skipped, element [dbo].[Groups].[MemberShout] (SqlSimpleColumn) will not be renamed to UserName';


GO
PRINT N'Rename refactoring operation with key 51c62ca6-2457-4335-8b87-95c4d26890a4, 9e7f42e7-74be-428f-a201-74e03899ab17 is skipped, element [dbo].[coffeeOrders].[Group] (SqlSimpleColumn) will not be renamed to GroupName';


GO
PRINT N'Creating [dbo].[coffeeOrders]...';


GO
CREATE TABLE [dbo].[coffeeOrders] (
    [Date]      DATE          NOT NULL,
    [Time]      DATETIME      NOT NULL,
    [Venue]     NVARCHAR (50) NOT NULL,
    [GroupName] NVARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([Date] ASC)
);


GO
PRINT N'Creating [dbo].[Groups]...';


GO
CREATE TABLE [dbo].[Groups] (
    [GroupName]   NVARCHAR (50) NOT NULL,
    [UserName]    NVARCHAR (50) NOT NULL,
    [MemberShout] INT           NULL,
    PRIMARY KEY CLUSTERED ([GroupName] ASC)
);


GO
PRINT N'Creating [dbo].[Members]...';


GO
CREATE TABLE [dbo].[Members] (
    [UserName] NVARCHAR (50) NOT NULL,
    [Password] NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([UserName] ASC)
);


GO
PRINT N'Creating [dbo].[FK_coffeeOrders_Groups]...';


GO
ALTER TABLE [dbo].[coffeeOrders] WITH NOCHECK
    ADD CONSTRAINT [FK_coffeeOrders_Groups] FOREIGN KEY ([GroupName]) REFERENCES [dbo].[Groups] ([GroupName]);


GO
PRINT N'Creating [dbo].[FK_Groups_MemberList]...';


GO
ALTER TABLE [dbo].[Groups] WITH NOCHECK
    ADD CONSTRAINT [FK_Groups_MemberList] FOREIGN KEY ([UserName]) REFERENCES [dbo].[Members] ([UserName]);


GO
-- Refactoring step to update target server with deployed transaction logs

IF OBJECT_ID(N'dbo.__RefactorLog') IS NULL
BEGIN
    CREATE TABLE [dbo].[__RefactorLog] (OperationKey UNIQUEIDENTIFIER NOT NULL PRIMARY KEY)
    EXEC sp_addextendedproperty N'microsoft_database_tools_support', N'refactoring log', N'schema', N'dbo', N'table', N'__RefactorLog'
END
GO
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '79747096-d6be-4025-94da-458f24b131a1')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('79747096-d6be-4025-94da-458f24b131a1')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '4052f4cc-fedb-452e-8981-0744111dbd62')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('4052f4cc-fedb-452e-8981-0744111dbd62')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '97341c0b-f20c-44c6-802d-a98981675e72')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('97341c0b-f20c-44c6-802d-a98981675e72')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '4bd7e487-70b5-4f2e-b57c-94fc38dd3897')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('4bd7e487-70b5-4f2e-b57c-94fc38dd3897')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '1ef02e05-31ca-4497-96a5-1d7051e7583c')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('1ef02e05-31ca-4497-96a5-1d7051e7583c')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '328ce8b2-6caa-465b-be03-ca31cc0378ab')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('328ce8b2-6caa-465b-be03-ca31cc0378ab')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '51c62ca6-2457-4335-8b87-95c4d26890a4')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('51c62ca6-2457-4335-8b87-95c4d26890a4')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '9e7f42e7-74be-428f-a201-74e03899ab17')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('9e7f42e7-74be-428f-a201-74e03899ab17')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'e70ed74e-5ce4-4c22-9a3e-e9079ba286cd')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('e70ed74e-5ce4-4c22-9a3e-e9079ba286cd')

GO

GO
/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

IF '$(LoadTestData)' = 'true'

BEGIN


DELETE FROM Members;
DELETE FROM Groups;
DELETE FROM coffeeOrders;

INSERT INTO Members (UserName, Password) VALUES
('Admin', 'password'),
('TestUser', 'password')

END;
GO

GO
