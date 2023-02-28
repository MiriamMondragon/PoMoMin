# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Bitacora(models.Model):
    noregistro = models.BigAutoField(db_column='NoRegistro', primary_key=True)  # Field name made lowercase.
    usuario = models.CharField(db_column='Usuario', max_length=100, db_collation='SQL_Latin1_General_CP1_CI_AS')  # Field name made lowercase.
    fechahoraevento = models.DateTimeField(db_column='FechaHoraEvento', blank=True, null=True)  # Field name made lowercase.
    tipoevento = models.CharField(db_column='TipoEvento', max_length=50, db_collation='SQL_Latin1_General_CP1_CI_AS', blank=True, null=True)  # Field name made lowercase.
    estadoevento = models.CharField(db_column='EstadoEvento', max_length=50, db_collation='SQL_Latin1_General_CP1_CI_AS', blank=True, null=True)  # Field name made lowercase.
    descripcion = models.CharField(db_column='Descripcion', max_length=250, db_collation='SQL_Latin1_General_CP1_CI_AS', blank=True, null=True)  # Field name made lowercase.
    dispositivo = models.CharField(db_column='Dispositivo', max_length=200, db_collation='SQL_Latin1_General_CP1_CI_AS', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        db_table = 'Bitacora'


class Categorias(models.Model):
    categoriaid = models.AutoField(db_column='CategoriaID', primary_key=True)  # Field name made lowercase.
    categoria = models.CharField(db_column='Categoria', max_length=100, db_collation='SQL_Latin1_General_CP1_CI_AS')  # Field name made lowercase.
    descripcion = models.CharField(db_column='Descripcion', max_length=150, db_collation='SQL_Latin1_General_CP1_CI_AS')  # Field name made lowercase.
    aplicaa = models.CharField(db_column='AplicaA', max_length=5, db_collation='SQL_Latin1_General_CP1_CI_AS', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        db_table = 'Categorias'


class Departamentos(models.Model):
    departamentoid = models.AutoField(db_column='DepartamentoID', primary_key=True)  # Field name made lowercase.
    nombre = models.CharField(db_column='Nombre', max_length=100, db_collation='SQL_Latin1_General_CP1_CI_AS')  # Field name made lowercase.
    descripcion = models.CharField(db_column='Descripcion', max_length=200, db_collation='SQL_Latin1_General_CP1_CI_AS', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        db_table = 'Departamentos'


class Empleados(models.Model):
    empleadoid = models.BigAutoField(db_column='EmpleadoID', primary_key=True)  # Field name made lowercase.
    nombres = models.CharField(db_column='Nombres', max_length=100, db_collation='SQL_Latin1_General_CP1_CI_AS')  # Field name made lowercase.
    apellidos = models.CharField(db_column='Apellidos', max_length=100, db_collation='SQL_Latin1_General_CP1_CI_AS')  # Field name made lowercase.
    identificacion = models.CharField(db_column='Identificacion', max_length=100, db_collation='SQL_Latin1_General_CP1_CI_AS')  # Field name made lowercase.
    sucursalid = models.ForeignKey('Sucursales', models.DO_NOTHING, db_column='SucursalID')  # Field name made lowercase.
    puestoid = models.ForeignKey('Puestos', models.DO_NOTHING, db_column='PuestoID')  # Field name made lowercase.
    reportaa = models.ForeignKey('self', models.DO_NOTHING, db_column='ReportaA', blank=True, null=True)  # Field name made lowercase.
    telefonocelular = models.CharField(db_column='TelefonoCelular', max_length=100, db_collation='SQL_Latin1_General_CP1_CI_AS', blank=True, null=True)  # Field name made lowercase.
    telefonotrabajo = models.CharField(db_column='TelefonoTrabajo', max_length=100, db_collation='SQL_Latin1_General_CP1_CI_AS', blank=True, null=True)  # Field name made lowercase.
    direccion = models.CharField(db_column='Direccion', max_length=150, db_collation='SQL_Latin1_General_CP1_CI_AS', blank=True, null=True)  # Field name made lowercase.
    genero = models.CharField(db_column='Genero', max_length=15, db_collation='SQL_Latin1_General_CP1_CI_AS', blank=True, null=True)  # Field name made lowercase.
    fechanacimiento = models.DateField(db_column='FechaNacimiento', blank=True, null=True)  # Field name made lowercase.
    fechaalta = models.DateField(db_column='FechaAlta', blank=True, null=True)  # Field name made lowercase.
    fechabaja = models.DateField(db_column='FechaBaja', blank=True, null=True)  # Field name made lowercase.
    estadoid = models.ForeignKey('Estadosempleado', models.DO_NOTHING, db_column='EstadoID')  # Field name made lowercase.
    fecharegistro = models.DateField(db_column='FechaRegistro', blank=True, null=True)  # Field name made lowercase.
    notas = models.TextField(db_column='Notas', db_collation='SQL_Latin1_General_CP1_CI_AS', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        db_table = 'Empleados'


class EstadosEmpleado(models.Model):
    estadoid = models.AutoField(db_column='EstadoID', primary_key=True)  # Field name made lowercase.
    estado = models.CharField(db_column='Estado', max_length=100, db_collation='SQL_Latin1_General_CP1_CI_AS')  # Field name made lowercase.
    descripcion = models.CharField(db_column='Descripcion', max_length=150, db_collation='SQL_Latin1_General_CP1_CI_AS', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        db_table = 'EstadosEmpleado'


class EstadosInventario(models.Model):
    estadoid = models.AutoField(db_column='EstadoID', primary_key=True)  # Field name made lowercase.
    estado = models.CharField(db_column='Estado', max_length=100, db_collation='SQL_Latin1_General_CP1_CI_AS')  # Field name made lowercase.
    descripcion = models.CharField(db_column='Descripcion', max_length=150, db_collation='SQL_Latin1_General_CP1_CI_AS', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        db_table = 'EstadosInventario'


class EstadosUsuario(models.Model):
    estadoid = models.AutoField(db_column='EstadoID', primary_key=True)  # Field name made lowercase.
    estado = models.CharField(db_column='Estado', max_length=100, db_collation='SQL_Latin1_General_CP1_CI_AS')  # Field name made lowercase.
    descripcion = models.CharField(db_column='Descripcion', max_length=150, db_collation='SQL_Latin1_General_CP1_CI_AS', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        db_table = 'EstadosUsuario'


class Fabricantes(models.Model):
    fabricanteid = models.AutoField(db_column='FabricanteID', primary_key=True)  # Field name made lowercase.
    nombre = models.CharField(db_column='Nombre', max_length=100, db_collation='SQL_Latin1_General_CP1_CI_AS')  # Field name made lowercase.
    descripcion = models.CharField(db_column='Descripcion', max_length=150, db_collation='SQL_Latin1_General_CP1_CI_AS')  # Field name made lowercase.
    activo = models.BooleanField(db_column='Activo', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        db_table = 'Fabricantes'


class Inventario(models.Model):
    inventarioid = models.BigAutoField(db_column='InventarioID', primary_key=True)  # Field name made lowercase.
    codigoinventario = models.CharField(db_column='CodigoInventario', max_length=200, db_collation='SQL_Latin1_General_CP1_CI_AS')  # Field name made lowercase.
    codigobarra = models.CharField(db_column='CodigoBarra', max_length=200, db_collation='SQL_Latin1_General_CP1_CI_AS')  # Field name made lowercase.
    tipoinventarioid = models.ForeignKey('TiposInventario', models.DO_NOTHING, db_column='TipoInventarioID')  # Field name made lowercase.
    categoriaid = models.ForeignKey(Categorias, models.DO_NOTHING, db_column='CategoriaID')  # Field name made lowercase.
    fabricanteid = models.ForeignKey(Fabricantes, models.DO_NOTHING, db_column='FabricanteID', blank=True, null=True)  # Field name made lowercase.
    modelo = models.CharField(db_column='Modelo', max_length=50, db_collation='SQL_Latin1_General_CP1_CI_AS', blank=True, null=True)  # Field name made lowercase.
    serie = models.CharField(db_column='Serie', max_length=50, db_collation='SQL_Latin1_General_CP1_CI_AS', blank=True, null=True)  # Field name made lowercase.
    descripcion = models.CharField(db_column='Descripcion', max_length=150, db_collation='SQL_Latin1_General_CP1_CI_AS', blank=True, null=True)  # Field name made lowercase.
    sucursalid = models.ForeignKey('Sucursales', models.DO_NOTHING, db_column='SucursalID')  # Field name made lowercase.
    asignadoa = models.ForeignKey(Empleados, models.DO_NOTHING, db_column='AsignadoA', blank=True, null=True)  # Field name made lowercase.
    proveedorid = models.ForeignKey('Proveedores', models.DO_NOTHING, db_column='ProveedorID', blank=True, null=True)  # Field name made lowercase.
    estadoid = models.ForeignKey(EstadosInventario, models.DO_NOTHING, db_column='EstadoID')  # Field name made lowercase.
    fechacompra = models.DateField(db_column='FechaCompra', blank=True, null=True)  # Field name made lowercase.
    fechautilmaxima = models.DateField(db_column='FechaUtilMaxima', blank=True, null=True)  # Field name made lowercase.
    fechaultimosoporte = models.DateField(db_column='FechaUltimoSoporte', blank=True, null=True)  # Field name made lowercase.
    fecharegistro = models.DateField(db_column='FechaRegistro', blank=True, null=True)  # Field name made lowercase.
    notas = models.TextField(db_column='Notas', db_collation='SQL_Latin1_General_CP1_CI_AS', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        db_table = 'Inventario'


class InventarioEmpleados(models.Model):
    inventarioid = models.OneToOneField(Inventario, models.DO_NOTHING, db_column='InventarioID', primary_key=True)  # Field name made lowercase.
    empleadoid = models.ForeignKey(Empleados, models.DO_NOTHING, db_column='EmpleadoID')  # Field name made lowercase.
    motivoasignacionid = models.ForeignKey('Motivoscambio', models.DO_NOTHING, db_column='MotivoAsignacionID')  # Field name made lowercase.
    motivodesasignacionid = models.ForeignKey('Motivoscambio', models.DO_NOTHING, db_column='MotivoDesasignacionID', blank=True, null=True)  # Field name made lowercase.
    fechavigente = models.DateTimeField(db_column='FechaVigente')  # Field name made lowercase.
    fechafin = models.DateTimeField(db_column='FechaFin', blank=True, null=True)  # Field name made lowercase.
    notas = models.TextField(db_column='Notas', db_collation='SQL_Latin1_General_CP1_CI_AS', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        db_table = 'InventarioEmpleados'
        unique_together = (('inventarioid', 'empleadoid', 'fechavigente'),)


class MotivosCambio(models.Model):
    motivoid = models.AutoField(db_column='MotivoID', primary_key=True)  # Field name made lowercase.
    motivo = models.CharField(db_column='Motivo', max_length=200, db_collation='SQL_Latin1_General_CP1_CI_AS')  # Field name made lowercase.
    descripcion = models.CharField(db_column='Descripcion', max_length=150, db_collation='SQL_Latin1_General_CP1_CI_AS')  # Field name made lowercase.
    aplicaa = models.CharField(db_column='AplicaA', max_length=5, db_collation='SQL_Latin1_General_CP1_CI_AS')  # Field name made lowercase.

    class Meta:
        db_table = 'MotivosCambio'


class PerfilesUsuario(models.Model):
    perfilid = models.AutoField(db_column='PerfilID', primary_key=True)  # Field name made lowercase.
    nombreperfil = models.CharField(db_column='NombrePerfil', max_length=100, db_collation='SQL_Latin1_General_CP1_CI_AS')  # Field name made lowercase.
    descripcion = models.CharField(db_column='Descripcion', max_length=150, db_collation='SQL_Latin1_General_CP1_CI_AS', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        db_table = 'PerfilesUsuario'


class Proveedores(models.Model):
    proveedorid = models.AutoField(db_column='ProveedorID', primary_key=True)  # Field name made lowercase.
    nombre = models.CharField(db_column='Nombre', max_length=100, db_collation='SQL_Latin1_General_CP1_CI_AS')  # Field name made lowercase.
    descripcion = models.CharField(db_column='Descripcion', max_length=150, db_collation='SQL_Latin1_General_CP1_CI_AS')  # Field name made lowercase.
    direccion = models.CharField(db_column='Direccion', max_length=150, db_collation='SQL_Latin1_General_CP1_CI_AS', blank=True, null=True)  # Field name made lowercase.
    telefono = models.CharField(db_column='Telefono', max_length=100, db_collation='SQL_Latin1_General_CP1_CI_AS', blank=True, null=True)  # Field name made lowercase.
    nombrecontacto = models.CharField(db_column='NombreContacto', max_length=100, db_collation='SQL_Latin1_General_CP1_CI_AS', blank=True, null=True)  # Field name made lowercase.
    activo = models.BooleanField(db_column='Activo')  # Field name made lowercase.
    fecharegistro = models.DateField(db_column='FechaRegistro', blank=True, null=True)  # Field name made lowercase.
    notas = models.TextField(db_column='Notas', db_collation='SQL_Latin1_General_CP1_CI_AS', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        db_table = 'Proveedores'


class Puestos(models.Model):
    puestoid = models.AutoField(db_column='PuestoID', primary_key=True)  # Field name made lowercase.
    nombre = models.CharField(db_column='Nombre', max_length=100, db_collation='SQL_Latin1_General_CP1_CI_AS')  # Field name made lowercase.
    departamentoid = models.ForeignKey(Departamentos, models.DO_NOTHING, db_column='DepartamentoID')  # Field name made lowercase.
    descripcion = models.CharField(db_column='Descripcion', max_length=200, db_collation='SQL_Latin1_General_CP1_CI_AS', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        db_table = 'Puestos'


class Sucursales(models.Model):
    sucursalid = models.AutoField(db_column='SucursalID', primary_key=True)  # Field name made lowercase.
    nombre = models.CharField(db_column='Nombre', max_length=100, db_collation='SQL_Latin1_General_CP1_CI_AS')  # Field name made lowercase.
    direccion = models.CharField(db_column='Direccion', max_length=200, db_collation='SQL_Latin1_General_CP1_CI_AS', blank=True, null=True)  # Field name made lowercase.
    activo = models.BooleanField(db_column='Activo')  # Field name made lowercase.

    class Meta:
        db_table = 'Sucursales'


class TiposInventario(models.Model):
    tipoinventarioid = models.AutoField(db_column='TipoInventarioID', primary_key=True)  # Field name made lowercase.
    tipoinventario = models.CharField(db_column='TipoInventario', max_length=100, db_collation='SQL_Latin1_General_CP1_CI_AS')  # Field name made lowercase.

    class Meta:
        db_table = 'TiposInventario'


class Usuarios(models.Model):
    usuarioid = models.AutoField(db_column='UsuarioID', primary_key=True)  # Field name made lowercase.
    usuario = models.CharField(db_column='Usuario', max_length=200, db_collation='SQL_Latin1_General_CP1_CI_AS')  # Field name made lowercase.
    clave = models.CharField(db_column='Clave', max_length=300, db_collation='SQL_Latin1_General_CP1_CI_AS')  # Field name made lowercase.
    perfilid = models.ForeignKey(PerfilesUsuario, models.DO_NOTHING, db_column='PerfilID')  # Field name made lowercase.
    fechacreacion = models.DateField(db_column='FechaCreacion', blank=True, null=True)  # Field name made lowercase.
    fechaultimaactualizacion = models.DateField(db_column='FechaUltimaActualizacion', blank=True, null=True)  # Field name made lowercase.
    estadoid = models.ForeignKey(EstadosUsuario, models.DO_NOTHING, db_column='EstadoID')  # Field name made lowercase.

    class Meta:
        db_table = 'Usuarios'