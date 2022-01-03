USE Collections
GO

IF (SELECT COUNT(1) FROM COLLECTION.attribute_data_type) != 0
	RETURN

BEGIN TRY 

	BEGIN TRANSACTION

	INSERT INTO COLLECTION.attribute_data_type (
		type_sql,
		type_length,
		type_code
	)
	VALUES
	('varchar',	255,	'V'),
	('varchar',	50,		'V1'),
	('float',	NULL,	'F'),
	('int',		NULL,	'I'),
	('bit',		NULL,	'B'),
	('date',	NULL,	'D')

	COMMIT TRANSACTION
END TRY
BEGIN CATCH
   SELECT  
		ERROR_NUMBER() AS ErrorNumber , 
        ERROR_SEVERITY() AS ErrorSeverity,  
        ERROR_STATE() AS ErrorState,  
        ERROR_PROCEDURE() AS ErrorProcedure,  
        ERROR_LINE() AS ErrorLine,  
        ERROR_MESSAGE() AS ErrorMessage

	ROLLBACK
END CATCH
