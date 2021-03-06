USE [cc6]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Convenio]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Convenio](
	[Id] [int] NOT NULL,
	[Nome] [varchar](150) NULL,
	[Descricao] [text] NULL,
	[ValorCobertura] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Especialidade]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Especialidade](
	[Id] [int] NOT NULL,
	[Descricao] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Medico]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Medico](
	[Id] [int] NOT NULL,
	[Registro] [varchar](10) NULL,
	[Nome] [varchar](150) NULL,
	[Endereco] [varchar](150) NULL,
	[Telefone] [varchar](15) NULL,
 CONSTRAINT [PK__Medico__1367E606] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Paciente]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Paciente](
	[Id] [int] NOT NULL,
	[Convenio_Id] [int] NULL,
	[Consultorio_Id] [int] NULL,
	[Rg] [varchar](20) NULL,
	[Nome] [varchar](150) NULL,
	[Telefone] [varchar](20) NULL,
	[Endereco] [varchar](255) NULL,
	[Observacoes] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Medico_Especialidade]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Medico_Especialidade](
	[Medico_Id] [int] NULL,
	[Especialidade_Id] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Funcionario]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Funcionario](
	[Id] [int] NOT NULL,
	[Consultorio_Id] [int] NULL,
	[Nome] [varchar](150) NULL,
	[DataNascimento] [datetime] NULL,
	[Endereco] [varchar](255) NULL,
	[Telefone] [varchar](1) NULL,
	[DataAdmissao] [datetime] NULL,
	[Salario] [money] NULL,
	[Cargo] [varchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Salas]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Salas](
	[Id] [int] NOT NULL,
	[Consultorio_Id] [int] NULL,
	[Numero] [int] NULL,
	[Complemento] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Consultas]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Consultas](
	[id] [int] NOT NULL,
	[Consultorio_Id] [int] NULL,
	[Medico_Id] [int] NULL,
	[Paciente_Convenio_Id] [int] NULL,
	[Paciente_Id] [int] NULL,
	[DataHoraConsulta] [datetime] NOT NULL,
 CONSTRAINT [PK__Consultas__7C8480AE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Consultorio]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Consultorio](
	[Id] [int] NOT NULL,
	[Nome] [varchar](150) NULL,
	[Endereco] [varchar](255) NULL,
	[Telefone] [varchar](20) NULL,
	[Medico_Id] [int] NULL,
 CONSTRAINT [PK__Consultorio__0BC6C43E] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
USE [cc6]
GO
USE [cc6]
GO
USE [cc6]
GO
USE [cc6]
GO
USE [cc6]
GO
USE [cc6]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Paciente__Consul__1920BF5C]') AND parent_object_id = OBJECT_ID(N'[dbo].[Paciente]'))
ALTER TABLE [dbo].[Paciente]  WITH CHECK ADD  CONSTRAINT [FK__Paciente__Consul__1920BF5C] FOREIGN KEY([Consultorio_Id])
REFERENCES [dbo].[Consultorio] ([Id])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Paciente__Conven__182C9B23]') AND parent_object_id = OBJECT_ID(N'[dbo].[Paciente]'))
ALTER TABLE [dbo].[Paciente]  WITH CHECK ADD  CONSTRAINT [FK__Paciente__Conven__182C9B23] FOREIGN KEY([Convenio_Id])
REFERENCES [dbo].[Convenio] ([Id])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Medico_Es__Espec__2A4B4B5E]') AND parent_object_id = OBJECT_ID(N'[dbo].[Medico_Especialidade]'))
ALTER TABLE [dbo].[Medico_Especialidade]  WITH CHECK ADD FOREIGN KEY([Especialidade_Id])
REFERENCES [dbo].[Especialidade] ([Id])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Medico_Es__Medic__29572725]') AND parent_object_id = OBJECT_ID(N'[dbo].[Medico_Especialidade]'))
ALTER TABLE [dbo].[Medico_Especialidade]  WITH CHECK ADD  CONSTRAINT [FK__Medico_Es__Medic__29572725] FOREIGN KEY([Medico_Id])
REFERENCES [dbo].[Medico] ([Id])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Funcionar__Consu__286302EC]') AND parent_object_id = OBJECT_ID(N'[dbo].[Funcionario]'))
ALTER TABLE [dbo].[Funcionario]  WITH CHECK ADD FOREIGN KEY([Consultorio_Id])
REFERENCES [dbo].[Consultorio] ([Id])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Salas__Consultor__2B3F6F97]') AND parent_object_id = OBJECT_ID(N'[dbo].[Salas]'))
ALTER TABLE [dbo].[Salas]  WITH CHECK ADD FOREIGN KEY([Consultorio_Id])
REFERENCES [dbo].[Consultorio] ([Id])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Consultas__Medic__1B0907CE]') AND parent_object_id = OBJECT_ID(N'[dbo].[Consultas]'))
ALTER TABLE [dbo].[Consultas]  WITH CHECK ADD  CONSTRAINT [FK__Consultas__Medic__1B0907CE] FOREIGN KEY([Medico_Id])
REFERENCES [dbo].[Medico] ([Id])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Consultor__Medic__276EDEB3]') AND parent_object_id = OBJECT_ID(N'[dbo].[Consultorio]'))
ALTER TABLE [dbo].[Consultorio]  WITH CHECK ADD  CONSTRAINT [FK__Consultor__Medic__276EDEB3] FOREIGN KEY([Medico_Id])
REFERENCES [dbo].[Medico] ([Id])
