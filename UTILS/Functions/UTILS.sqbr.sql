USE Collections
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'UTILS.sqbr') AND [type] IN ('F', 'FN'))
BEGIN 
	DROP FUNCTION UTILS.sqbr
	PRINT '########## UTILS.sqbr dropped successfully ##########'
END
GO

CREATE FUNCTION UTILS.sqbr(@text varchar(255))
RETURNS varchar(255) AS  
BEGIN
	DECLARE @return_val varchar(255)

	SET @return_val = '[' + @text + ']'

	RETURN @return_val
	
END
GO
PRINT '########## UTILS.sqbr created successfully ##########'
