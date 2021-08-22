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

if ('$(DeploySampleData)' = 'true')

BEGIN 
DELETE FROM OFFICE

INSERT INTO [OFFICE] (LocCode, [Address], [Description]) VALUES
('A01', '21 Flinders Road, Melbourne', 'Head office located in Melbourne CBD'),
('A02', '234 John Street, Hawthorn', 'work location for Admin staff') ,
('B01', '20-40 Main Street, Bendigo', 'Storage location for equipment');

DELETE FROM Employee

INSERT INTO [Employee] (StaffID, GivenName, Surname) VALUES 
(01, 'John', 'Smith'),
(02, 'Mary', 'Jones'),
(03, 'Alex', 'Johnson');
END
