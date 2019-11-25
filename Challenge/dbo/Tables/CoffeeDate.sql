CREATE TABLE [dbo].[coffeeOrders] (
    [CoffeeDateID]  INT          NOT NULL,
    [Date]  DATETIME      NOT NULL,
    [Time] DATETIME NOT NULL,
    [Venue] NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_coffeeOrders] PRIMARY KEY ([CoffeeDateID])
);

