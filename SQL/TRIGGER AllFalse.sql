USE gcabplus
GO

CREATE TRIGGER AllFalse
ON TPATIENTS
AFTER  INSERT
AS

DECLARE @CountStrat INT;
DECLARE @CountEnd INT;

SET @CountStrat = 1;
SET @CountEnd = (select (COUNT(ID_ANTEP) )as cou from TAnte_List where ID_ANTE = 1); ;

WHILE @CountStrat <= @CountEnd 
	BEGIN
		UPDATE TAnte_List 
		SET CHECK_ANTE = 0 
		WHERE ID_ANTE = 1
		
		SET @CountStrat = @CountStrat + 1;
END