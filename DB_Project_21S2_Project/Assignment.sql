CREATE TABLE [Assignment]
(
	[DateAssigned] INT NOT NULL, 
    [LocCode] NVARCHAR(10) NOT NULL, 
    [StaffID] INT NOT NULL,
	PRIMARY KEY (DateAssigned, LocCode, StaffID),
	CONSTRAINT [FK1] FOREIGN KEY ([LocCode] ) REFERENCES [Office]([LocCode]),
	CONSTRAINT [FK2] FOREIGN KEY ([StaffID]) REFERENCES [Employee]([StaffID]), 
    CONSTRAINT [DateFormat] CHECK (LEN(DateAssigned)=8)
)
