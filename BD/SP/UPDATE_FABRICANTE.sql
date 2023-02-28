USE PoMoMin
GO

CREATE PROCEDURE UPDATE_FABRICANTE
	@ID INT,
	@NOMBRE NVARCHAR(100),
	@DESCRIPCION NVARCHAR(150),
	@ACTIVO BIT,
	-- DATOS PARA BITACORA
	@USUARIOBITA NVARCHAR(100),
	@DISPOSITIVO NVARCHAR(200)
AS
DECLARE @MENSAJE AS VARCHAR(100);
BEGIN TRY
	IF @ID IS NULL OR @ACTIVO IS NULL
	   BEGIN
			RAISERROR('Algunos parámetros no pueden ser nulos', 16, 1)
		END
	UPDATE Fabricantes
	SET Nombre = COALESCE(@NOMBRE, Nombre),
		Descripcion = COALESCE(@DESCRIPCION, Descripcion),
		Activo = COALESCE(@ACTIVO, Activo)
	WHERE FabricanteID = @ID
	
	IF @ACTIVO <> 0 -- INACTIVO
	BEGIN
		SET @MENSAJE = 'Actualización de fabricante con ID: ' + CAST(@ID AS VARCHAR);
		-- BITACORA
		EXEC INSERT_BITACORA @USUARIOBITA, 'UPDATE', 'COMPLETADO EXITOSAMENTE', @MENSAJE, @DISPOSITIVO;
	END
	ELSE
	BEGIN
		SET @MENSAJE = 'Desactivación de fabricante con ID: ' + CAST(@ID AS VARCHAR);
		-- BITACORA
		EXEC INSERT_BITACORA @USUARIOBITA, 'DEACTIVATE', 'COMPLETADO EXITOSAMENTE', @MENSAJE, @DISPOSITIVO;
	END

END TRY
BEGIN CATCH
	SET @MENSAJE = 'Mensaje de error:' + ERROR_MESSAGE();
	EXEC INSERT_BITACORA @USUARIOBITA, 'UPDATE', 'NO COMPLETADO', @MENSAJE, @DISPOSITIVO;
END CATCH
GO