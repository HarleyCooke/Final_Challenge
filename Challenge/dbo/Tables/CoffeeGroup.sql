CREATE TABLE [dbo].[Groups] (
    [GroupID]     NVARCHAR (50) NOT NULL,
    [GroupName] NVARCHAR (50) NOT NULL,
    [MemberID] INT NOT NULL, 
    [MemberShout] NCHAR(10) NOT NULL, 
    [CoffeeDateID] INT NULL, 
    PRIMARY KEY CLUSTERED ([GroupID]), 
    CONSTRAINT [FK_Groups_Members] FOREIGN KEY ([MemberID]) REFERENCES [Members]([MemberID]), 
    CONSTRAINT [FK_Groups_coffeeOrders] FOREIGN KEY ([CoffeeDateID]) REFERENCES [coffeeOrders]([CoffeeDateID]),


);

