CREATE FUNCTION [ConvertToNumeric](@sNumber VARCHAR(255)) 
RETURNS VARCHAR(1000) 
AS 
BEGIN
    WHILE PatIndex('%[^0123456789,]%', @sNumber) > 0 
        SET @sNumber = Stuff(@sNumber, PatIndex('%[^0123456789,]%', @sNumber), 1, '') 
	
	SET @sNumber = replace(@sNumber,',','.')
    RETURN @sNumber 
END 
GO