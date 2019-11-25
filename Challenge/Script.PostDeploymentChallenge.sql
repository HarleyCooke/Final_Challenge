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
DELETE FROM CoffeeDate;
DELETE FROM CoffeeGroups;

INSERT INTO Members (MemberID ,UserName, Password) VALUES
('1', 'Admin', 'password'),
('2', 'TestUser', 'password')

END;
