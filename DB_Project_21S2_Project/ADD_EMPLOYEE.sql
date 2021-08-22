CREATE PROCEDURE [dbo].[ADD_EMPLOYEE]
	@pStaffID INT,
	@pGivenName NVARCHAR(20),
	@pSurname NVARCHAR(20)
AS
BEGIN
    BEGIN TRY
        IF @pStaffID < 1 OR @pStaffID > 9999
            THROW 30020, 'Staff ID out of range', 1

		INSERT INTO [Employee] (StaffID, GivenName, Surname) VALUES 
		(@pStaffID, @pGivenName, @pSurname)
	END TRY
	BEGIN CATCH
	    
        If ERROR_NUMBER() = 2627
            THROW 30010, 'Duplicate Staff ID', 1
        ELSE IF ERROR_NUMBER() = 30020
            THROW
        ELSE
            BEGIN
                DECLARE @ERRORMESSAGE NVARCHAR(MAX) = ERROR_MESSAGE();
                THROW 30000, @ERRORMESSAGE, 1
            END; 
    END CATCH
END