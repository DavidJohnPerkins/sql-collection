USE Collections
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'UTILS.sb') AND [type] IN ('F', 'FN'))
BEGIN 
	DROP FUNCTION UTILS.sb
	PRINT '########## UTILS.sb dropped successfully ##########'
END
GO

CREATE FUNCTION UTILS.sb(@text varchar(255))
RETURNS varchar(255) AS  
BEGIN
	DECLARE @return_val varchar(255)

	SET @return_val = '[' + @text + ']'

	RETURN @return_val
	
END
GO
PRINT '########## UTILS.sb created successfully ##########'
