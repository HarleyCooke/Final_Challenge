CREATE TABLE [dbo].[Members] (
    [MemberID] INT NOT NULL DEFAULT 0,
    [UserName] NVARCHAR(50) NOT NULL, 
    [Password] NVARCHAR(50) NOT NULL, 
    CONSTRAINT [PK_Members] PRIMARY KEY ([MemberID]), 
  
);

