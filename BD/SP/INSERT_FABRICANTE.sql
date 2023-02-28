USE PoMoMin
GO

CREATE PROCEDURE INSERT_FABRICANTE
	@NOMBRE NVARCHAR(100),
	@DESCRIPCION NVARCHAR(150),
	-- DATOS PARA BITACORA
	@USUARIOBITA NVARCHAR(100),
	@DISPOSITIVO NVARCHAR(200),
	-- RECUPERAR ID
	@ID INT OUTPUT
AS
DECLARE @MENSAJE AS VARCHAR(100);
BEGIN TRY
	IF @NOMBRE IS NULL
	   BEGIN
			RAISERROR('Algunos parámetros no pueden ser nulos', 16, 1)
		END
	INSERT INTO Fabricantes(Nombre, Descripcion, Activo)
	VALUES(@NOMBRE, @DESCRIPCION, 1);
		   SET @ID = @@IDENTITY;

	SET @MENSAJE = 'Inserción de fabricante con ID: ' + CAST(@ID AS VARCHAR);

	-- BITACORA
	EXEC INSERT_BITACORA @USUARIOBITA, 'INSERT', 'COMPLETADO EXITOSAMENTE', @MENSAJE, @DISPOSITIVO;

	PRINT 'Registro insertado correctamente'
END TRY
BEGIN CATCH
	SET @MENSAJE = 'Mensaje de error:' + ERROR_MESSAGE();
	EXEC INSERT_BITACORA @USUARIOBITA, 'INSERT', 'NO COMPLETADO', @MENSAJE, @DISPOSITIVO;
END CATCH
GO