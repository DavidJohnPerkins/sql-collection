USE Collections
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

DROP FUNCTION IF EXISTS UTILS.sq
GO

CREATE FUNCTION UTILS.sq(@text varchar(255))
RETURNS varchar(255) AS  
BEGIN
	DECLARE @return_val varchar(255)

	SET @return_val = '''' + @text + ''''

	RETURN @return_val
	
END
GO
