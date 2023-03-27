USE PoMoMin
GO

CREATE PROCEDURE INSERT_EMPLEADO
	@NOMBRES NVARCHAR(100),
	@APELLIDOS NVARCHAR(100),
	@IDENTIFICACION NVARCHAR(100),
	@SUCURSALID INT,
	@PUESTOID INT,
	@REPORTAA BIGINT,
	@CELULAR NVARCHAR(100),
	@TELTRABAJO NVARCHAR(100),
	@DIRECCION NVARCHAR(150),
	@GENERO NVARCHAR(15),
	@FECHANACIMIENTO DATE,
	@FECHAALTA DATE,
	@FECHABAJA DATE,
	@ESTADOID INT,
	-- @FECHAREGISTRO DEFAULT GETDATE() DESDE CREACION DE TABLA
	@NOTAS NTEXT,
	-- DATOS PARA BITACORA
	@USUARIOBITA NVARCHAR(100),
	@DISPOSITIVO NVARCHAR(200),
	-- RECUPERAR ID
	@ID BIGINT OUTPUT
AS
DECLARE @MENSAJE AS VARCHAR(100);
BEGIN TRY
	IF @NOMBRES IS NULL OR @APELLIDOS IS NULL OR @IDENTIFICACION IS NULL OR @ESTADOID IS NULL OR @FECHAALTA IS NULL
	   OR @SUCURSALID IS NULL OR @PUESTOID IS NULL
	   BEGIN
			RAISERROR('Algunos par�metros no pueden ser nulos', 16, 1)
			SET @ID = 0;
		END
	IF EXISTS(SELECT Identificacion FROM Empleados WHERE Identificacion = @IDENTIFICACION)
	   BEGIN
			RAISERROR('El numero de identidad ya existe en la base', 16, 1)
			SET @ID = 0;
		END
	INSERT INTO Empleados(Nombres, Apellidos, Identificacion, SucursalID, PuestoID, ReportaA, TelefonoCelular, TelefonoTrabajo, 
	Direccion, Genero, FechaNacimiento, FechaAlta, FechaBaja, EstadoID, Notas)
	VALUES(@NOMBRES, @APELLIDOS, @IDENTIFICACION, @SUCURSALID, @PUESTOID, @REPORTAA, @CELULAR, @TELTRABAJO, 
		   @DIRECCION,	@GENERO, @FECHANACIMIENTO, @FECHAALTA, @FECHABAJA, @ESTADOID, @NOTAS);
		   SET @ID = @@IDENTITY;

	SET @MENSAJE = 'Inserci�n de empleado con ID: ' + CAST(@ID AS VARCHAR);

	-- BITACORA
	EXEC INSERT_BITACORA @USUARIOBITA, 'INSERT', 'COMPLETADO EXITOSAMENTE', @MENSAJE, @DISPOSITIVO;

	PRINT 'Registro insertado correctamente'
	SET @ID = 1;
END TRY
BEGIN CATCH
	SET @MENSAJE = 'Mensaje de error:' + ERROR_MESSAGE();
	EXEC INSERT_BITACORA @USUARIOBITA, 'INSERT', 'NO COMPLETADO', @MENSAJE, @DISPOSITIVO;
	SET @ID = 0;
END CATCH
GO