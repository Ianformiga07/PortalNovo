USE [master]
GO
/****** Object:  Database [PortalAnanas]    Script Date: 24/09/2024 19:26:41 ******/
CREATE DATABASE [PortalAnanas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Portal-Ananas', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Portal-Ananas.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Portal-Ananas_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Portal-Ananas_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [PortalAnanas] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PortalAnanas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PortalAnanas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PortalAnanas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PortalAnanas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PortalAnanas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PortalAnanas] SET ARITHABORT OFF 
GO
ALTER DATABASE [PortalAnanas] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PortalAnanas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PortalAnanas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PortalAnanas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PortalAnanas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PortalAnanas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PortalAnanas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PortalAnanas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PortalAnanas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PortalAnanas] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PortalAnanas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PortalAnanas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PortalAnanas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PortalAnanas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PortalAnanas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PortalAnanas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PortalAnanas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PortalAnanas] SET RECOVERY FULL 
GO
ALTER DATABASE [PortalAnanas] SET  MULTI_USER 
GO
ALTER DATABASE [PortalAnanas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PortalAnanas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PortalAnanas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PortalAnanas] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PortalAnanas] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PortalAnanas] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PortalAnanas', N'ON'
GO
ALTER DATABASE [PortalAnanas] SET QUERY_STORE = ON
GO
ALTER DATABASE [PortalAnanas] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [PortalAnanas]
GO
/****** Object:  Table [dbo].[cam_administradores]    Script Date: 24/09/2024 19:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cam_administradores](
	[id_admin] [int] IDENTITY(1,1) NOT NULL,
	[CPF] [varchar](14) NOT NULL,
	[NomeCompleto] [varchar](200) NULL,
	[dataNasc] [datetime] NULL,
	[sexo] [int] NULL,
	[cep] [varchar](14) NULL,
	[endereco] [varchar](150) NULL,
	[cidade] [varchar](150) NULL,
	[uf] [varchar](50) NULL,
	[celular] [varchar](14) NULL,
	[email] [varchar](150) NULL,
	[senha] [varchar](50) NULL,
	[confimaSenha] [varchar](50) NULL,
	[id_UsuCad] [varchar](50) NULL,
	[dataCad] [datetime] NULL,
	[id_UsuAlt] [varchar](50) NULL,
	[dataAlt] [datetime] NULL,
	[id_adminPermissao] [int] NULL,
 CONSTRAINT [PK_cam_administradores] PRIMARY KEY CLUSTERED 
(
	[id_admin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cam_admissao]    Script Date: 24/09/2024 19:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cam_admissao](
	[id_tipoAdmissao] [int] IDENTITY(1,1) NOT NULL,
	[desc_admissao] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cam_cargos]    Script Date: 24/09/2024 19:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cam_cargos](
	[id_cargo] [int] IDENTITY(1,1) NOT NULL,
	[desc_cargo] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cam_categoriaLeg]    Script Date: 24/09/2024 19:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cam_categoriaLeg](
	[id_categoriaLeg] [int] IDENTITY(1,1) NOT NULL,
	[descricao] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cam_comissao]    Script Date: 24/09/2024 19:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cam_comissao](
	[id_comissao] [int] IDENTITY(1,1) NOT NULL,
	[id_vereador] [int] NULL,
	[id_funcoes] [int] NULL,
	[id_mandato] [int] NULL,
	[obs] [varchar](200) NULL,
	[id_tipoComissao] [int] NULL,
	[statusComissao] [bit] NULL,
 CONSTRAINT [PK_cam_comissao] PRIMARY KEY CLUSTERED 
(
	[id_comissao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cam_diarioOfi]    Script Date: 24/09/2024 19:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cam_diarioOfi](
	[id_diario] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [varchar](50) NOT NULL,
	[anexo_diario] [varchar](50) NOT NULL,
	[status_diario] [bit] NOT NULL,
	[dataCad] [datetime] NULL,
	[idUsu_Cad] [varchar](50) NULL,
	[idUsu_Alt] [varchar](50) NULL,
	[dataAlt] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cam_escolaridade]    Script Date: 24/09/2024 19:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cam_escolaridade](
	[id_escolaridade] [int] IDENTITY(1,1) NOT NULL,
	[desc_escolaridade] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cam_funcoesLeg]    Script Date: 24/09/2024 19:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cam_funcoesLeg](
	[id_funcoes] [int] IDENTITY(1,1) NOT NULL,
	[desc_funcoes] [varchar](50) NULL,
 CONSTRAINT [PK_cam_funcoesLeg] PRIMARY KEY CLUSTERED 
(
	[id_funcoes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cam_historia]    Script Date: 24/09/2024 19:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cam_historia](
	[id_historia] [int] IDENTITY(1,1) NOT NULL,
	[anoFundacao] [varchar](50) NOT NULL,
	[dataAniversario] [datetime] NOT NULL,
	[populacao] [int] NOT NULL,
	[area] [float] NOT NULL,
	[conteudo] [varchar](1000) NOT NULL,
	[idUsu_Cad] [varchar](50) NULL,
	[dataCad] [datetime] NULL,
	[idUsu_Alt] [varchar](50) NULL,
	[dataAlt] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cam_legislacao]    Script Date: 24/09/2024 19:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cam_legislacao](
	[id_legislacao] [int] IDENTITY(1,1) NOT NULL,
	[id_categoriaLeg] [int] NOT NULL,
	[descricao] [varchar](200) NOT NULL,
	[anexo_legislacao] [varchar](50) NOT NULL,
	[id_AutorVer] [int] NOT NULL,
	[status_Leg] [bit] NOT NULL,
	[dataCad] [datetime] NOT NULL,
	[idUsu_Cad] [varchar](50) NULL,
	[idUsu_Alt] [varchar](50) NULL,
	[dataAlt] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cam_legislativo]    Script Date: 24/09/2024 19:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cam_legislativo](
	[id_legislativo] [int] IDENTITY(1,1) NOT NULL,
	[id_vereador] [int] NULL,
	[id_mandato] [int] NULL,
	[id_funcoes] [int] NULL,
	[obs] [varchar](200) NULL,
	[statusLeg] [bit] NULL,
 CONSTRAINT [PK_cam_legislativo] PRIMARY KEY CLUSTERED 
(
	[id_legislativo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cam_mandatoAnt]    Script Date: 24/09/2024 19:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cam_mandatoAnt](
	[id_mandatoAnt] [int] IDENTITY(1,1) NOT NULL,
	[id_vereador] [int] NULL,
	[anoInicio] [varchar](50) NULL,
	[anoFim] [varchar](50) NULL,
 CONSTRAINT [PK_cam_mandatoAnt] PRIMARY KEY CLUSTERED 
(
	[id_mandatoAnt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cam_mandatosLeg]    Script Date: 24/09/2024 19:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cam_mandatosLeg](
	[id_mandatosLeg] [int] IDENTITY(1,1) NOT NULL,
	[mandatos] [varchar](50) NULL,
 CONSTRAINT [PK_cam_mandatosLeg] PRIMARY KEY CLUSTERED 
(
	[id_mandatosLeg] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cam_noticias]    Script Date: 24/09/2024 19:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cam_noticias](
	[id_noticia] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [varchar](100) NOT NULL,
	[subtitulo] [varchar](100) NOT NULL,
	[conteudo] [varchar](1000) NOT NULL,
	[anexo_noticia] [varchar](50) NOT NULL,
	[autor] [varchar](50) NOT NULL,
	[destaque] [bit] NOT NULL,
	[dataCad] [datetime] NOT NULL,
	[idUsu_Cad] [varchar](50) NULL,
	[idUsu_Alt] [varchar](50) NULL,
	[dataAlt] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cam_permissaoAcesso]    Script Date: 24/09/2024 19:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cam_permissaoAcesso](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_adminPermissao] [int] NULL,
	[id_permissao] [int] NULL,
 CONSTRAINT [PK_cam_permissoes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cam_regimento]    Script Date: 24/09/2024 19:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cam_regimento](
	[id_regimento] [int] IDENTITY(1,1) NOT NULL,
	[descricao] [varchar](100) NOT NULL,
	[anexo_regimento] [varchar](50) NOT NULL,
	[data_cad] [datetime] NULL,
	[idUsu_Cad] [varchar](50) NULL,
	[idUsu_Alt] [varchar](50) NULL,
	[data_Alt] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cam_servidor]    Script Date: 24/09/2024 19:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cam_servidor](
	[id_servidor] [int] IDENTITY(1,1) NOT NULL,
	[CPF] [varchar](50) NULL,
	[NomeCompleto] [varchar](50) NULL,
 CONSTRAINT [PK_cam_servidor] PRIMARY KEY CLUSTERED 
(
	[id_servidor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cam_servidores]    Script Date: 24/09/2024 19:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cam_servidores](
	[id_servidor] [int] IDENTITY(1,1) NOT NULL,
	[CPF] [varchar](14) NOT NULL,
	[NomeCompleto] [varchar](100) NOT NULL,
	[DataNascimento] [date] NOT NULL,
	[Sexo] [varchar](10) NOT NULL,
	[EstadoCivil] [varchar](15) NOT NULL,
	[Matricula] [varchar](20) NOT NULL,
	[RG] [varchar](20) NOT NULL,
	[OrgaoExpedidor] [varchar](50) NOT NULL,
	[id_Escolaridade] [int] NOT NULL,
	[CEP] [varchar](10) NOT NULL,
	[Endereco] [varchar](255) NOT NULL,
	[Numero] [varchar](10) NOT NULL,
	[Bairro] [varchar](100) NOT NULL,
	[Complemento] [varchar](100) NULL,
	[Cidade] [varchar](100) NOT NULL,
	[UF] [varchar](2) NOT NULL,
	[Celular] [varchar](15) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[id_TipoAdmissao] [int] NOT NULL,
	[id_Cargo] [int] NOT NULL,
	[id_CargoRecebimento] [int] NOT NULL,
	[Decreto] [varchar](50) NULL,
	[DataDecreto] [datetime] NULL,
	[CargaHorariaMensal] [int] NULL,
	[DataAdmissao] [datetime] NULL,
	[FotoPerfil] [varbinary](max) NULL,
	[banco] [varchar](50) NULL,
	[agencia] [varchar](10) NULL,
	[conta] [varchar](10) NULL,
	[tipoConta] [int] NULL,
	[operacao] [varchar](10) NULL,
	[nivelAcesso] [int] NULL,
	[senha] [varchar](255) NOT NULL,
	[id_permissao] [int] NULL,
 CONSTRAINT [PK__Servidor__3214EC27C93389BF] PRIMARY KEY CLUSTERED 
(
	[id_servidor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cam_tipoComissao]    Script Date: 24/09/2024 19:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cam_tipoComissao](
	[id_tipoComissao] [int] IDENTITY(1,1) NOT NULL,
	[DescComissao] [varchar](250) NULL,
 CONSTRAINT [PK_cam_tipoComissao] PRIMARY KEY CLUSTERED 
(
	[id_tipoComissao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cam_tipoPermissao]    Script Date: 24/09/2024 19:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cam_tipoPermissao](
	[id_permissao] [int] IDENTITY(1,1) NOT NULL,
	[desc_Permissao] [varchar](50) NULL,
 CONSTRAINT [PK_cam_permissao] PRIMARY KEY CLUSTERED 
(
	[id_permissao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cam_vereador]    Script Date: 24/09/2024 19:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cam_vereador](
	[id_vereador] [int] IDENTITY(1,1) NOT NULL,
	[id_servidor] [int] NULL,
	[apelido] [varchar](100) NULL,
	[logo] [varchar](50) NULL,
	[ocupacao] [varchar](100) NULL,
 CONSTRAINT [PK_cam_vereador] PRIMARY KEY CLUSTERED 
(
	[id_vereador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cam_admissao] ON 

INSERT [dbo].[cam_admissao] ([id_tipoAdmissao], [desc_admissao]) VALUES (1, N'Concursado')
INSERT [dbo].[cam_admissao] ([id_tipoAdmissao], [desc_admissao]) VALUES (2, N'Contrato')
INSERT [dbo].[cam_admissao] ([id_tipoAdmissao], [desc_admissao]) VALUES (3, N'Comissionado')
INSERT [dbo].[cam_admissao] ([id_tipoAdmissao], [desc_admissao]) VALUES (4, N'Estagiário')
INSERT [dbo].[cam_admissao] ([id_tipoAdmissao], [desc_admissao]) VALUES (5, N'Terceirizado')
INSERT [dbo].[cam_admissao] ([id_tipoAdmissao], [desc_admissao]) VALUES (6, N'Efetivo')
INSERT [dbo].[cam_admissao] ([id_tipoAdmissao], [desc_admissao]) VALUES (7, N'Aposentado')
INSERT [dbo].[cam_admissao] ([id_tipoAdmissao], [desc_admissao]) VALUES (8, N'Eletivo (Vereador)')
SET IDENTITY_INSERT [dbo].[cam_admissao] OFF
GO
SET IDENTITY_INSERT [dbo].[cam_cargos] ON 

INSERT [dbo].[cam_cargos] ([id_cargo], [desc_cargo]) VALUES (1, N'Assessor de Gabinete')
INSERT [dbo].[cam_cargos] ([id_cargo], [desc_cargo]) VALUES (2, N'Assistente Administrativo')
INSERT [dbo].[cam_cargos] ([id_cargo], [desc_cargo]) VALUES (3, N'Auxiliar de Serviços Gerais')
INSERT [dbo].[cam_cargos] ([id_cargo], [desc_cargo]) VALUES (4, N'Contador')
INSERT [dbo].[cam_cargos] ([id_cargo], [desc_cargo]) VALUES (5, N'Controlador Interno')
INSERT [dbo].[cam_cargos] ([id_cargo], [desc_cargo]) VALUES (6, N'Diretor Legislativo')
INSERT [dbo].[cam_cargos] ([id_cargo], [desc_cargo]) VALUES (7, N'Procurador Jurídico')
INSERT [dbo].[cam_cargos] ([id_cargo], [desc_cargo]) VALUES (8, N'Secretário Legislativo')
INSERT [dbo].[cam_cargos] ([id_cargo], [desc_cargo]) VALUES (9, N'Técnico em Informática')
INSERT [dbo].[cam_cargos] ([id_cargo], [desc_cargo]) VALUES (10, N'Vigilante')
INSERT [dbo].[cam_cargos] ([id_cargo], [desc_cargo]) VALUES (11, N'Chefe de Gabinete')
INSERT [dbo].[cam_cargos] ([id_cargo], [desc_cargo]) VALUES (12, N'Assessor Parlamentar')
INSERT [dbo].[cam_cargos] ([id_cargo], [desc_cargo]) VALUES (13, N'Assessor Jurídico')
INSERT [dbo].[cam_cargos] ([id_cargo], [desc_cargo]) VALUES (14, N'Motorista')
INSERT [dbo].[cam_cargos] ([id_cargo], [desc_cargo]) VALUES (15, N'Vereador')
INSERT [dbo].[cam_cargos] ([id_cargo], [desc_cargo]) VALUES (16, N'Tesoureiro')
SET IDENTITY_INSERT [dbo].[cam_cargos] OFF
GO
SET IDENTITY_INSERT [dbo].[cam_categoriaLeg] ON 

INSERT [dbo].[cam_categoriaLeg] ([id_categoriaLeg], [descricao]) VALUES (1, N'Projetos de Lei')
INSERT [dbo].[cam_categoriaLeg] ([id_categoriaLeg], [descricao]) VALUES (2, N'Resoluções')
INSERT [dbo].[cam_categoriaLeg] ([id_categoriaLeg], [descricao]) VALUES (3, N'Decretos')
INSERT [dbo].[cam_categoriaLeg] ([id_categoriaLeg], [descricao]) VALUES (4, N'Portarias')
INSERT [dbo].[cam_categoriaLeg] ([id_categoriaLeg], [descricao]) VALUES (5, N'Ofícios')
INSERT [dbo].[cam_categoriaLeg] ([id_categoriaLeg], [descricao]) VALUES (6, N'Leis Municipais')
INSERT [dbo].[cam_categoriaLeg] ([id_categoriaLeg], [descricao]) VALUES (7, N'Lei Orgânica')
INSERT [dbo].[cam_categoriaLeg] ([id_categoriaLeg], [descricao]) VALUES (8, N'Requerimentos')
INSERT [dbo].[cam_categoriaLeg] ([id_categoriaLeg], [descricao]) VALUES (9, N'Atas de Sessões')
INSERT [dbo].[cam_categoriaLeg] ([id_categoriaLeg], [descricao]) VALUES (10, N'Pautas de Sessões')
SET IDENTITY_INSERT [dbo].[cam_categoriaLeg] OFF
GO
SET IDENTITY_INSERT [dbo].[cam_escolaridade] ON 

INSERT [dbo].[cam_escolaridade] ([id_escolaridade], [desc_escolaridade]) VALUES (1, N'Fundamental Incompleto')
INSERT [dbo].[cam_escolaridade] ([id_escolaridade], [desc_escolaridade]) VALUES (2, N'Fundamental Completo')
INSERT [dbo].[cam_escolaridade] ([id_escolaridade], [desc_escolaridade]) VALUES (3, N'Ensino Médio Incompleto')
INSERT [dbo].[cam_escolaridade] ([id_escolaridade], [desc_escolaridade]) VALUES (4, N'Ensino Médio Completo')
INSERT [dbo].[cam_escolaridade] ([id_escolaridade], [desc_escolaridade]) VALUES (5, N'Superior Incompleto')
INSERT [dbo].[cam_escolaridade] ([id_escolaridade], [desc_escolaridade]) VALUES (6, N'Superior Completo')
INSERT [dbo].[cam_escolaridade] ([id_escolaridade], [desc_escolaridade]) VALUES (7, N'Pós-Graduação')
INSERT [dbo].[cam_escolaridade] ([id_escolaridade], [desc_escolaridade]) VALUES (8, N'Mestrado')
INSERT [dbo].[cam_escolaridade] ([id_escolaridade], [desc_escolaridade]) VALUES (9, N'Doutorado')
INSERT [dbo].[cam_escolaridade] ([id_escolaridade], [desc_escolaridade]) VALUES (10, N'Pós-Doutorado')
SET IDENTITY_INSERT [dbo].[cam_escolaridade] OFF
GO
SET IDENTITY_INSERT [dbo].[cam_funcoesLeg] ON 

INSERT [dbo].[cam_funcoesLeg] ([id_funcoes], [desc_funcoes]) VALUES (1, N'Presidente')
INSERT [dbo].[cam_funcoesLeg] ([id_funcoes], [desc_funcoes]) VALUES (2, N'Vice-presidente')
INSERT [dbo].[cam_funcoesLeg] ([id_funcoes], [desc_funcoes]) VALUES (3, N'1 Secretario')
INSERT [dbo].[cam_funcoesLeg] ([id_funcoes], [desc_funcoes]) VALUES (4, N'2 Secretario')
INSERT [dbo].[cam_funcoesLeg] ([id_funcoes], [desc_funcoes]) VALUES (5, N'Membro')
SET IDENTITY_INSERT [dbo].[cam_funcoesLeg] OFF
GO
SET IDENTITY_INSERT [dbo].[cam_legislativo] ON 

INSERT [dbo].[cam_legislativo] ([id_legislativo], [id_vereador], [id_mandato], [id_funcoes], [obs], [statusLeg]) VALUES (7, 7, 1, 1, N'-', 0)
INSERT [dbo].[cam_legislativo] ([id_legislativo], [id_vereador], [id_mandato], [id_funcoes], [obs], [statusLeg]) VALUES (8, 2, 1, 2, N'-', 0)
INSERT [dbo].[cam_legislativo] ([id_legislativo], [id_vereador], [id_mandato], [id_funcoes], [obs], [statusLeg]) VALUES (9, 4, 1, 3, N'-', 0)
INSERT [dbo].[cam_legislativo] ([id_legislativo], [id_vereador], [id_mandato], [id_funcoes], [obs], [statusLeg]) VALUES (10, 5, 1, 4, N'-', 0)
INSERT [dbo].[cam_legislativo] ([id_legislativo], [id_vereador], [id_mandato], [id_funcoes], [obs], [statusLeg]) VALUES (11, 2, 2, 1, N'-', 1)
INSERT [dbo].[cam_legislativo] ([id_legislativo], [id_vereador], [id_mandato], [id_funcoes], [obs], [statusLeg]) VALUES (12, 5, 2, 2, N'-', 1)
INSERT [dbo].[cam_legislativo] ([id_legislativo], [id_vereador], [id_mandato], [id_funcoes], [obs], [statusLeg]) VALUES (13, 9, 2, 3, N'-', 1)
INSERT [dbo].[cam_legislativo] ([id_legislativo], [id_vereador], [id_mandato], [id_funcoes], [obs], [statusLeg]) VALUES (14, 6, 2, 4, N'-', 1)
SET IDENTITY_INSERT [dbo].[cam_legislativo] OFF
GO
SET IDENTITY_INSERT [dbo].[cam_mandatosLeg] ON 

INSERT [dbo].[cam_mandatosLeg] ([id_mandatosLeg], [mandatos]) VALUES (1, N'2021/2022')
INSERT [dbo].[cam_mandatosLeg] ([id_mandatosLeg], [mandatos]) VALUES (2, N'2023/2024')
SET IDENTITY_INSERT [dbo].[cam_mandatosLeg] OFF
GO
SET IDENTITY_INSERT [dbo].[cam_servidor] ON 

INSERT [dbo].[cam_servidor] ([id_servidor], [CPF], [NomeCompleto]) VALUES (1, N'32170252029', N'Cicinho do São João')
INSERT [dbo].[cam_servidor] ([id_servidor], [CPF], [NomeCompleto]) VALUES (2, N'11072948001', N'Elzi')
INSERT [dbo].[cam_servidor] ([id_servidor], [CPF], [NomeCompleto]) VALUES (3, N'58337239069', N'Zelu')
INSERT [dbo].[cam_servidor] ([id_servidor], [CPF], [NomeCompleto]) VALUES (4, N'36230439077', N'Iel do Povo')
INSERT [dbo].[cam_servidor] ([id_servidor], [CPF], [NomeCompleto]) VALUES (5, N'23831672075', N'Junior rezende')
INSERT [dbo].[cam_servidor] ([id_servidor], [CPF], [NomeCompleto]) VALUES (6, N'18857641031', N'Irmão Livan')
INSERT [dbo].[cam_servidor] ([id_servidor], [CPF], [NomeCompleto]) VALUES (7, N'97949531053', N'Ronaldão Guerreiro')
INSERT [dbo].[cam_servidor] ([id_servidor], [CPF], [NomeCompleto]) VALUES (8, N'81472246055', N'Manoel cabeleireiro')
INSERT [dbo].[cam_servidor] ([id_servidor], [CPF], [NomeCompleto]) VALUES (9, N'64209797065', N'carlito bacuri')
SET IDENTITY_INSERT [dbo].[cam_servidor] OFF
GO
SET IDENTITY_INSERT [dbo].[cam_tipoComissao] ON 

INSERT [dbo].[cam_tipoComissao] ([id_tipoComissao], [DescComissao]) VALUES (1, N'Comissão de Constituição Justiça e Redação')
INSERT [dbo].[cam_tipoComissao] ([id_tipoComissao], [DescComissao]) VALUES (2, N'Comissão de Administração, Trabalho, Transporte, Agricultura, Desenvolvimento Urbano e Serviço Público')
INSERT [dbo].[cam_tipoComissao] ([id_tipoComissao], [DescComissao]) VALUES (3, N'Comissão de Finanças, Orçamento, Tributação, fiscalização e Controle')
INSERT [dbo].[cam_tipoComissao] ([id_tipoComissao], [DescComissao]) VALUES (4, N'Comissão de Educação, Cultura e Desporto, Saúde e Meio Ambiente')
SET IDENTITY_INSERT [dbo].[cam_tipoComissao] OFF
GO
SET IDENTITY_INSERT [dbo].[cam_tipoPermissao] ON 

INSERT [dbo].[cam_tipoPermissao] ([id_permissao], [desc_Permissao]) VALUES (1, N'Administrador')
INSERT [dbo].[cam_tipoPermissao] ([id_permissao], [desc_Permissao]) VALUES (2, N'A Câmara')
INSERT [dbo].[cam_tipoPermissao] ([id_permissao], [desc_Permissao]) VALUES (3, N'Diário Oficial')
INSERT [dbo].[cam_tipoPermissao] ([id_permissao], [desc_Permissao]) VALUES (4, N'Notícias')
INSERT [dbo].[cam_tipoPermissao] ([id_permissao], [desc_Permissao]) VALUES (5, N'Licitações')
INSERT [dbo].[cam_tipoPermissao] ([id_permissao], [desc_Permissao]) VALUES (6, N'Compras e Suprimentos')
INSERT [dbo].[cam_tipoPermissao] ([id_permissao], [desc_Permissao]) VALUES (7, N'Legislação')
INSERT [dbo].[cam_tipoPermissao] ([id_permissao], [desc_Permissao]) VALUES (8, N'Execução Orçamentária')
INSERT [dbo].[cam_tipoPermissao] ([id_permissao], [desc_Permissao]) VALUES (9, N'Recursos Humanos')
SET IDENTITY_INSERT [dbo].[cam_tipoPermissao] OFF
GO
SET IDENTITY_INSERT [dbo].[cam_vereador] ON 

INSERT [dbo].[cam_vereador] ([id_vereador], [id_servidor], [apelido], [logo], [ocupacao]) VALUES (1, 1, N'-', N'-', N'-')
INSERT [dbo].[cam_vereador] ([id_vereador], [id_servidor], [apelido], [logo], [ocupacao]) VALUES (2, 2, N'-', N'-', N'-')
INSERT [dbo].[cam_vereador] ([id_vereador], [id_servidor], [apelido], [logo], [ocupacao]) VALUES (3, 3, N'-', N'-', N'-')
INSERT [dbo].[cam_vereador] ([id_vereador], [id_servidor], [apelido], [logo], [ocupacao]) VALUES (4, 4, N'-', N'-', N'-')
INSERT [dbo].[cam_vereador] ([id_vereador], [id_servidor], [apelido], [logo], [ocupacao]) VALUES (5, 5, N'-', N'-', N'-')
INSERT [dbo].[cam_vereador] ([id_vereador], [id_servidor], [apelido], [logo], [ocupacao]) VALUES (6, 6, N'-', N'-', N'-')
INSERT [dbo].[cam_vereador] ([id_vereador], [id_servidor], [apelido], [logo], [ocupacao]) VALUES (7, 7, N'-', N'-', N'-')
INSERT [dbo].[cam_vereador] ([id_vereador], [id_servidor], [apelido], [logo], [ocupacao]) VALUES (8, 8, N'-', N'-', N'-')
INSERT [dbo].[cam_vereador] ([id_vereador], [id_servidor], [apelido], [logo], [ocupacao]) VALUES (9, 9, N'-', N'-', N'-')
SET IDENTITY_INSERT [dbo].[cam_vereador] OFF
GO
ALTER TABLE [dbo].[cam_administradores]  WITH CHECK ADD  CONSTRAINT [FK_cam_administradores_cam_permissaoAcesso] FOREIGN KEY([id_adminPermissao])
REFERENCES [dbo].[cam_permissaoAcesso] ([id])
GO
ALTER TABLE [dbo].[cam_administradores] CHECK CONSTRAINT [FK_cam_administradores_cam_permissaoAcesso]
GO
ALTER TABLE [dbo].[cam_comissao]  WITH CHECK ADD  CONSTRAINT [FK_cam_comissao_cam_funcoesLeg] FOREIGN KEY([id_funcoes])
REFERENCES [dbo].[cam_funcoesLeg] ([id_funcoes])
GO
ALTER TABLE [dbo].[cam_comissao] CHECK CONSTRAINT [FK_cam_comissao_cam_funcoesLeg]
GO
ALTER TABLE [dbo].[cam_comissao]  WITH CHECK ADD  CONSTRAINT [FK_cam_comissao_cam_mandatosLeg] FOREIGN KEY([id_mandato])
REFERENCES [dbo].[cam_mandatosLeg] ([id_mandatosLeg])
GO
ALTER TABLE [dbo].[cam_comissao] CHECK CONSTRAINT [FK_cam_comissao_cam_mandatosLeg]
GO
ALTER TABLE [dbo].[cam_comissao]  WITH CHECK ADD  CONSTRAINT [FK_cam_comissao_cam_tipoComissao] FOREIGN KEY([id_tipoComissao])
REFERENCES [dbo].[cam_tipoComissao] ([id_tipoComissao])
GO
ALTER TABLE [dbo].[cam_comissao] CHECK CONSTRAINT [FK_cam_comissao_cam_tipoComissao]
GO
ALTER TABLE [dbo].[cam_comissao]  WITH CHECK ADD  CONSTRAINT [FK_cam_comissao_cam_vereador] FOREIGN KEY([id_vereador])
REFERENCES [dbo].[cam_vereador] ([id_vereador])
GO
ALTER TABLE [dbo].[cam_comissao] CHECK CONSTRAINT [FK_cam_comissao_cam_vereador]
GO
ALTER TABLE [dbo].[cam_legislativo]  WITH CHECK ADD  CONSTRAINT [FK_cam_legislativo_cam_funcoesLeg] FOREIGN KEY([id_funcoes])
REFERENCES [dbo].[cam_funcoesLeg] ([id_funcoes])
GO
ALTER TABLE [dbo].[cam_legislativo] CHECK CONSTRAINT [FK_cam_legislativo_cam_funcoesLeg]
GO
ALTER TABLE [dbo].[cam_legislativo]  WITH CHECK ADD  CONSTRAINT [FK_cam_legislativo_cam_mandatosLeg] FOREIGN KEY([id_mandato])
REFERENCES [dbo].[cam_mandatosLeg] ([id_mandatosLeg])
GO
ALTER TABLE [dbo].[cam_legislativo] CHECK CONSTRAINT [FK_cam_legislativo_cam_mandatosLeg]
GO
ALTER TABLE [dbo].[cam_legislativo]  WITH CHECK ADD  CONSTRAINT [FK_cam_legislativo_cam_vereador] FOREIGN KEY([id_vereador])
REFERENCES [dbo].[cam_vereador] ([id_vereador])
GO
ALTER TABLE [dbo].[cam_legislativo] CHECK CONSTRAINT [FK_cam_legislativo_cam_vereador]
GO
ALTER TABLE [dbo].[cam_mandatoAnt]  WITH CHECK ADD  CONSTRAINT [FK_cam_mandatoAnt_cam_vereador] FOREIGN KEY([id_vereador])
REFERENCES [dbo].[cam_vereador] ([id_vereador])
GO
ALTER TABLE [dbo].[cam_mandatoAnt] CHECK CONSTRAINT [FK_cam_mandatoAnt_cam_vereador]
GO
ALTER TABLE [dbo].[cam_permissaoAcesso]  WITH CHECK ADD  CONSTRAINT [FK_cam_permissaoAcesso_cam_tipoPermissao] FOREIGN KEY([id_permissao])
REFERENCES [dbo].[cam_tipoPermissao] ([id_permissao])
GO
ALTER TABLE [dbo].[cam_permissaoAcesso] CHECK CONSTRAINT [FK_cam_permissaoAcesso_cam_tipoPermissao]
GO
ALTER TABLE [dbo].[cam_vereador]  WITH CHECK ADD  CONSTRAINT [FK_cam_vereador_cam_servidor] FOREIGN KEY([id_servidor])
REFERENCES [dbo].[cam_servidor] ([id_servidor])
GO
ALTER TABLE [dbo].[cam_vereador] CHECK CONSTRAINT [FK_cam_vereador_cam_servidor]
GO
USE [master]
GO
ALTER DATABASE [PortalAnanas] SET  READ_WRITE 
GO
