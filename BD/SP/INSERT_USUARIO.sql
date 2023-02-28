USE PoMoMin
GO

CREATE PROCEDURE INSERT_USUARIO
	@USUARIO NVARCHAR(200),
	@CLAVEBASE64 NVARCHAR(300),
	@IDPERFIL INT,
	-- @FECHAREGISTRO DEFAULT GETDATE() DESDE CREACION DE TABLA
	-- @FECHAULTIMAACTUALIZACION NULL AL CREAR REGISTRO
	@ESTADOID INT,
	-- DATOS PARA BITACORA
	@USUARIOBITA NVARCHAR(100),
	@DISPOSITIVO NVARCHAR(200),
	-- RECUPERAR ID
	@ID INT OUTPUT
AS
DECLARE @MENSAJE AS VARCHAR(100);
BEGIN TRY
	IF @USUARIO IS NULL OR @CLAVEBASE64 IS NULL OR @IDPERFIL IS NULL OR @ESTADOID IS NULL
	   BEGIN
			RAISERROR('Algunos parámetros no pueden ser nulos', 16, 1)
		END
	INSERT INTO Usuarios(Usuario, Clave, PerfilID, EstadoID)
	VALUES(@USUARIO, @CLAVEBASE64, @IDPERFIL, @ESTADOID);
		   SET @ID = @@IDENTITY;

	SET @MENSAJE = 'Inserción de usuario con ID: ' + CAST(@ID AS VARCHAR);

	-- BITACORA
	EXEC INSERT_BITACORA @USUARIOBITA, 'INSERT', 'COMPLETADO EXITOSAMENTE', @MENSAJE, @DISPOSITIVO;

	PRINT 'Registro insertado correctamente'
END TRY
BEGIN CATCH
	SET @MENSAJE = 'Mensaje de error:' + ERROR_MESSAGE();
	EXEC INSERT_BITACORA @USUARIOBITA, 'INSERT', 'NO COMPLETADO', @MENSAJE, @DISPOSITIVO;
END CATCH
GO