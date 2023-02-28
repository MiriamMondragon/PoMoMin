USE [PoMoMin]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[EstadosInventario](
	[EstadoID] [int] IDENTITY(1,1) NOT NULL,
	[Estado] [nvarchar](100) NOT NULL,
	[Descripcion] [nvarchar](150) NULL
 CONSTRAINT [PK_ESTADOSINVENTARIO] PRIMARY KEY CLUSTERED 
(
	[EstadoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO



CREATE TABLE [dbo].[TiposInventario](
	[TipoInventarioID] [int] IDENTITY(1,1) NOT NULL,
	[TipoInventario] [nvarchar](100) NOT NULL
 CONSTRAINT [PK_TIPOINVENTARIO] PRIMARY KEY CLUSTERED 
(
	[TipoInventarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO



CREATE TABLE [dbo].[Categorias](
	[CategoriaID] [int] IDENTITY(1,1) NOT NULL,
	[Categoria] [nvarchar](100) NOT NULL,
	[Descripcion] [nvarchar](150) NOT NULL,
	[AplicaA] [nvarchar](5) NOT NULL
 CONSTRAINT [PK_CATEGORIA] PRIMARY KEY CLUSTERED 
(
	[CategoriaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO




CREATE TABLE [dbo].[Fabricantes](
	[FabricanteID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Descripcion] [nvarchar](150) NOT NULL, 
	Activo BIT NOT NULL
 CONSTRAINT [PK_FABRICANTES] PRIMARY KEY CLUSTERED 
(
	[FabricanteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO


CREATE TABLE [dbo].[Proveedores](
	[ProveedorID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Descripcion] [nvarchar](150) NOT NULL,
	[Direccion] [nvarchar](150) NULL,
	[Telefono] [nvarchar](100) NULL,
	[NombreContacto] [nvarchar] (100) NULL,
	[Activo] [bit] NOT NULL,
	[FechaRegistro] [date] DEFAULT GETDATE(),
	[Notas] [ntext] NULL,
 CONSTRAINT [PK_PROVEEDORES] PRIMARY KEY CLUSTERED 
(
	[ProveedorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO



CREATE TABLE [dbo].[Inventario](
	[InventarioID] [bigint] IDENTITY(1,1) NOT NULL,
	[CodigoInventario] [nvarchar](200) NOT NULL,
	[CodigoBarra] [nvarchar](200) NOT NULL,
	[TipoInventarioID] [int] NOT NULL,
	[CategoriaID] [int] NOT NULL,
	[FabricanteID] [int] NULL,
	[Modelo] [nvarchar](50) NULL,
	[Serie] [nvarchar](50) NULL,
	[Descripcion] [nvarchar](150) NULL,
	[SucursalID] [int] NOT NULL,
	[AsignadoA] [bigint] NULL,
	[ProveedorID] [int] NULL,
	[EstadoID] [int] NOT NULL,
	[FechaCompra] [date] NULL,
	[FechaUtilMaxima] [date] NULL,
	[FechaUltimoSoporte] [date] NULL,
	[FechaRegistro] [date] DEFAULT GETDATE(),
	[Notas] [ntext] NULL,
 CONSTRAINT [PK_INVENTARIO] PRIMARY KEY CLUSTERED 
(
	[InventarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE NONCLUSTERED INDEX NCI_CodigoInventario
ON Inventario (CodigoInventario ASC); 

CREATE NONCLUSTERED INDEX NCI_CodigoBarra
ON Inventario (CodigoBarra ASC); 

ALTER TABLE dbo.Inventario
ADD CONSTRAINT FK_INVENTARIO_TIPO
FOREIGN KEY (TipoInventarioID)
REFERENCES dbo.TiposInventario(TipoInventarioID);

ALTER TABLE dbo.Inventario
ADD CONSTRAINT FK_INVENTARIO_CATEGORIA
FOREIGN KEY (CategoriaID)
REFERENCES dbo.Categorias(CategoriaID);

ALTER TABLE dbo.Inventario
ADD CONSTRAINT FK_INVENTARIO_FABRICANTE
FOREIGN KEY (FabricanteID)
REFERENCES dbo.Fabricantes(FabricanteID);

ALTER TABLE dbo.Inventario
ADD CONSTRAINT FK_INVENTARIO_SUCURSAL
FOREIGN KEY (SucursalID)
REFERENCES dbo.Sucursales(SucursalID);

ALTER TABLE dbo.Inventario
ADD CONSTRAINT FK_INVENTARIO_EMPLEADO
FOREIGN KEY (AsignadoA)
REFERENCES dbo.Empleados(EmpleadoID);

ALTER TABLE dbo.Inventario
ADD CONSTRAINT FK_INVENTARIO_PROVEEDOR
FOREIGN KEY (ProveedorID)
REFERENCES dbo.Proveedores(ProveedorID);

ALTER TABLE dbo.Inventario
ADD CONSTRAINT FK_INVENTARIO_ESTADO
FOREIGN KEY (EstadoID)
REFERENCES dbo.EstadosInventario(EstadoID);

GO
