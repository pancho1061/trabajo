USE [ veterinaria]
GO
/****** Object:  Table [dbo].[dueño]    Script Date: 22/09/2016 12:53:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dueño](
	[rut] [varchar](12) NOT NULL,
	[nombre] [varchar](20) NULL,
	[apellido] [varchar](20) NULL,
	[direccion] [varchar](20) NULL,
	[fono] [int] NULL,
 CONSTRAINT [PK_dueño] PRIMARY KEY CLUSTERED 
(
	[rut] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[especie]    Script Date: 22/09/2016 12:53:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[especie](
	[id_especie] [int] IDENTITY(1,1) NOT NULL,
	[nombre_especie] [varchar](20) NULL,
 CONSTRAINT [PK_especie] PRIMARY KEY CLUSTERED 
(
	[id_especie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mascota]    Script Date: 22/09/2016 12:53:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mascota](
	[id_mascota] [int] IDENTITY(1,1) NOT NULL,
	[nombre_mascota] [varchar](20) NULL,
	[peso] [int] NULL,
	[id_raza] [int] NOT NULL,
	[id_especie] [int] NOT NULL,
	[id_dueño] [varchar](12) NOT NULL,
 CONSTRAINT [PK_mascota] PRIMARY KEY CLUSTERED 
(
	[id_mascota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[raza]    Script Date: 22/09/2016 12:53:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[raza](
	[id_raza] [int] IDENTITY(1,1) NOT NULL,
	[nombre_raza] [varchar](20) NULL,
 CONSTRAINT [PK_raza] PRIMARY KEY CLUSTERED 
(
	[id_raza] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[especie] ON 

INSERT [dbo].[especie] ([id_especie], [nombre_especie]) VALUES (1, N'mamiferos')
INSERT [dbo].[especie] ([id_especie], [nombre_especie]) VALUES (2, N'aves')
INSERT [dbo].[especie] ([id_especie], [nombre_especie]) VALUES (3, N'reptiles')
INSERT [dbo].[especie] ([id_especie], [nombre_especie]) VALUES (4, N'peces')
SET IDENTITY_INSERT [dbo].[especie] OFF
SET IDENTITY_INSERT [dbo].[raza] ON 

INSERT [dbo].[raza] ([id_raza], [nombre_raza]) VALUES (1, N'perro')
INSERT [dbo].[raza] ([id_raza], [nombre_raza]) VALUES (2, N'gato')
INSERT [dbo].[raza] ([id_raza], [nombre_raza]) VALUES (3, N'conejo')
INSERT [dbo].[raza] ([id_raza], [nombre_raza]) VALUES (4, N'loro')
INSERT [dbo].[raza] ([id_raza], [nombre_raza]) VALUES (5, N'canario')
INSERT [dbo].[raza] ([id_raza], [nombre_raza]) VALUES (6, N'pez ')
INSERT [dbo].[raza] ([id_raza], [nombre_raza]) VALUES (7, N'iguana')
INSERT [dbo].[raza] ([id_raza], [nombre_raza]) VALUES (8, N'tortuga')
SET IDENTITY_INSERT [dbo].[raza] OFF
ALTER TABLE [dbo].[especie]  WITH CHECK ADD  CONSTRAINT [FK_especie_especie] FOREIGN KEY([id_especie])
REFERENCES [dbo].[especie] ([id_especie])
GO
ALTER TABLE [dbo].[especie] CHECK CONSTRAINT [FK_especie_especie]
GO
ALTER TABLE [dbo].[mascota]  WITH CHECK ADD  CONSTRAINT [FK_mascota_dueño] FOREIGN KEY([id_dueño])
REFERENCES [dbo].[dueño] ([rut])
GO
ALTER TABLE [dbo].[mascota] CHECK CONSTRAINT [FK_mascota_dueño]
GO
ALTER TABLE [dbo].[mascota]  WITH CHECK ADD  CONSTRAINT [FK_mascota_especie] FOREIGN KEY([id_especie])
REFERENCES [dbo].[especie] ([id_especie])
GO
ALTER TABLE [dbo].[mascota] CHECK CONSTRAINT [FK_mascota_especie]
GO
ALTER TABLE [dbo].[mascota]  WITH CHECK ADD  CONSTRAINT [FK_mascota_raza] FOREIGN KEY([id_raza])
REFERENCES [dbo].[raza] ([id_raza])
GO
ALTER TABLE [dbo].[mascota] CHECK CONSTRAINT [FK_mascota_raza]
GO
