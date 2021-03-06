USE [GamesWorkshop]
GO
/****** Object:  Table [dbo].[Fakcija]    Script Date: 12-Jan-20 20:45:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fakcija](
	[FakcijaID] [int] IDENTITY(1,1) NOT NULL,
	[FakcijaNaziv] [nvarchar](50) NOT NULL,
	[IgraID] [int] NOT NULL,
 CONSTRAINT [PK_Fakcija] PRIMARY KEY CLUSTERED 
(
	[FakcijaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Greska]    Script Date: 12-Jan-20 20:45:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Greska](
	[GreskaID] [int] IDENTITY(1,1) NOT NULL,
	[GreskaBroj] [varchar](10) NOT NULL,
	[GreskaPoruka] [nvarchar](max) NOT NULL,
	[GreskaSeverity] [varchar](10) NOT NULL,
	[GreskaState] [varchar](10) NOT NULL,
	[GreskaRed] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Greske] PRIMARY KEY CLUSTERED 
(
	[GreskaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Igra]    Script Date: 12-Jan-20 20:45:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Igra](
	[IgraID] [int] IDENTITY(1,1) NOT NULL,
	[IgraNaziv] [nvarchar](50) NOT NULL,
	[IgraOpis] [nvarchar](max) NOT NULL,
	[SlikaID] [int] NOT NULL,
 CONSTRAINT [PK_Igra] PRIMARY KEY CLUSTERED 
(
	[IgraID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kodeks]    Script Date: 12-Jan-20 20:45:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kodeks](
	[KodeksID] [int] IDENTITY(1,1) NOT NULL,
	[KodeksNaziv] [nvarchar](40) NOT NULL,
	[KodeksBrojStrana] [int] NULL,
	[KodeksCena] [money] NOT NULL,
	[KodeksStanjeNaLageru] [int] NOT NULL,
	[RasaID] [int] NOT NULL,
	[SlikaID] [int] NOT NULL,
 CONSTRAINT [PK_Kodeks] PRIMARY KEY CLUSTERED 
(
	[KodeksID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KontaktInfo]    Script Date: 12-Jan-20 20:45:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KontaktInfo](
	[DrzavaID] [int] IDENTITY(1,1) NOT NULL,
	[NazivDrzave] [nvarchar](30) NOT NULL,
	[EmailAdresa] [nvarchar](30) NOT NULL,
	[BrojTelefona] [nvarchar](20) NOT NULL,
	[PostanskaAdresa] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Minijatura]    Script Date: 12-Jan-20 20:45:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Minijatura](
	[SerijskiBroj] [int] IDENTITY(1,1) NOT NULL,
	[MinijaturaNaziv] [nvarchar](15) NOT NULL,
	[MinijaturaCena] [money] NOT NULL,
	[MinijaturaStanjeNaLageru] [int] NOT NULL,
	[OdredID] [int] NOT NULL,
	[PopustID] [int] NULL,
	[SlikaID] [int] NOT NULL,
	[PaletaID] [int] NULL,
 CONSTRAINT [PK_Minijatura] PRIMARY KEY CLUSTERED 
(
	[SerijskiBroj] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Odred]    Script Date: 12-Jan-20 20:45:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Odred](
	[OdredID] [int] IDENTITY(1,1) NOT NULL,
	[OdredNaziv] [nvarchar](50) NOT NULL,
	[OdredBrojMinijatura] [int] NOT NULL,
	[OdredCena] [int] NOT NULL,
	[OdredStanjeNaLageru] [int] NOT NULL,
	[TipOdredaID] [int] NOT NULL,
	[RasaID] [int] NOT NULL,
	[PopustID] [int] NULL,
	[SlikaID] [int] NOT NULL,
 CONSTRAINT [PK_Odred] PRIMARY KEY CLUSTERED 
(
	[OdredID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paket]    Script Date: 12-Jan-20 20:45:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paket](
	[PaketID] [int] IDENTITY(1,1) NOT NULL,
	[PaketNaziv] [nvarchar](25) NOT NULL,
	[PakeBrojOdreda] [int] NOT NULL,
	[PaketCena] [money] NOT NULL,
	[PaketStanjeNaLageru] [int] NOT NULL,
	[OdredID] [int] NOT NULL,
	[KodeksID] [int] NOT NULL,
	[PopustID] [int] NULL,
	[SlikaID] [int] NOT NULL,
 CONSTRAINT [PK_Paket] PRIMARY KEY CLUSTERED 
(
	[PaketID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaletaBoja]    Script Date: 12-Jan-20 20:45:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaletaBoja](
	[PaletaID] [int] IDENTITY(1,1) NOT NULL,
	[PaletaBoja] [nchar](40) NOT NULL,
 CONSTRAINT [PK_PaletaBoja] PRIMARY KEY CLUSTERED 
(
	[PaletaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Popust]    Script Date: 12-Jan-20 20:45:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Popust](
	[PopustID] [int] IDENTITY(1,1) NOT NULL,
	[PopustKolicinaUProcentima] [int] NOT NULL,
	[PopustPocetak] [datetime] NOT NULL,
	[PopustKraj] [datetime] NOT NULL,
 CONSTRAINT [PK_Popust] PRIMARY KEY CLUSTERED 
(
	[PopustID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rasa]    Script Date: 12-Jan-20 20:45:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rasa](
	[RasaID] [int] IDENTITY(1,1) NOT NULL,
	[RasaNaziv] [nvarchar](40) NOT NULL,
	[FakcijaID] [int] NOT NULL,
 CONSTRAINT [PK_Rasa] PRIMARY KEY CLUSTERED 
(
	[RasaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slika]    Script Date: 12-Jan-20 20:45:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slika](
	[SlikaID] [int] IDENTITY(1,1) NOT NULL,
	[SlikaURL] [nvarchar](max) NOT NULL,
	[SlikaNaziv] [nvarchar](50) NULL,
 CONSTRAINT [PK_Slika] PRIMARY KEY CLUSTERED 
(
	[SlikaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipOdreda]    Script Date: 12-Jan-20 20:45:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipOdreda](
	[TipOdredaID] [int] IDENTITY(1,1) NOT NULL,
	[TipOdredaNaziv] [nvarchar](20) NOT NULL,
	[TipOdredaPoeni] [int] NOT NULL,
 CONSTRAINT [PK_TipOdreda] PRIMARY KEY CLUSTERED 
(
	[TipOdredaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vest]    Script Date: 12-Jan-20 20:45:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vest](
	[VestID] [int] IDENTITY(1,1) NOT NULL,
	[VestNaslov] [nvarchar](50) NOT NULL,
	[VestTekst] [nvarchar](max) NOT NULL,
	[SlikaID] [int] NOT NULL,
	[IgraID] [int] NOT NULL,
 CONSTRAINT [PK_Vest] PRIMARY KEY CLUSTERED 
(
	[VestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Fakcija]  WITH CHECK ADD  CONSTRAINT [FK_Fakcija_Igra] FOREIGN KEY([IgraID])
REFERENCES [dbo].[Igra] ([IgraID])
GO
ALTER TABLE [dbo].[Fakcija] CHECK CONSTRAINT [FK_Fakcija_Igra]
GO
ALTER TABLE [dbo].[Igra]  WITH CHECK ADD  CONSTRAINT [FK_Igra_Slika] FOREIGN KEY([SlikaID])
REFERENCES [dbo].[Slika] ([SlikaID])
GO
ALTER TABLE [dbo].[Igra] CHECK CONSTRAINT [FK_Igra_Slika]
GO
ALTER TABLE [dbo].[Kodeks]  WITH CHECK ADD  CONSTRAINT [FK_Kodeks_Rasa] FOREIGN KEY([RasaID])
REFERENCES [dbo].[Rasa] ([RasaID])
GO
ALTER TABLE [dbo].[Kodeks] CHECK CONSTRAINT [FK_Kodeks_Rasa]
GO
ALTER TABLE [dbo].[Kodeks]  WITH CHECK ADD  CONSTRAINT [FK_Kodeks_Slika] FOREIGN KEY([SlikaID])
REFERENCES [dbo].[Slika] ([SlikaID])
GO
ALTER TABLE [dbo].[Kodeks] CHECK CONSTRAINT [FK_Kodeks_Slika]
GO
ALTER TABLE [dbo].[Minijatura]  WITH CHECK ADD  CONSTRAINT [FK_Minijatura_Odred] FOREIGN KEY([OdredID])
REFERENCES [dbo].[Odred] ([OdredID])
GO
ALTER TABLE [dbo].[Minijatura] CHECK CONSTRAINT [FK_Minijatura_Odred]
GO
ALTER TABLE [dbo].[Minijatura]  WITH CHECK ADD  CONSTRAINT [FK_Minijatura_PaletaBoja] FOREIGN KEY([PaletaID])
REFERENCES [dbo].[PaletaBoja] ([PaletaID])
GO
ALTER TABLE [dbo].[Minijatura] CHECK CONSTRAINT [FK_Minijatura_PaletaBoja]
GO
ALTER TABLE [dbo].[Minijatura]  WITH CHECK ADD  CONSTRAINT [FK_Minijatura_Popust] FOREIGN KEY([PopustID])
REFERENCES [dbo].[Popust] ([PopustID])
GO
ALTER TABLE [dbo].[Minijatura] CHECK CONSTRAINT [FK_Minijatura_Popust]
GO
ALTER TABLE [dbo].[Minijatura]  WITH CHECK ADD  CONSTRAINT [FK_Minijatura_Slika] FOREIGN KEY([SlikaID])
REFERENCES [dbo].[Slika] ([SlikaID])
GO
ALTER TABLE [dbo].[Minijatura] CHECK CONSTRAINT [FK_Minijatura_Slika]
GO
ALTER TABLE [dbo].[Odred]  WITH CHECK ADD  CONSTRAINT [FK_Odred_Popust] FOREIGN KEY([PopustID])
REFERENCES [dbo].[Popust] ([PopustID])
GO
ALTER TABLE [dbo].[Odred] CHECK CONSTRAINT [FK_Odred_Popust]
GO
ALTER TABLE [dbo].[Odred]  WITH CHECK ADD  CONSTRAINT [FK_Odred_Rasa] FOREIGN KEY([RasaID])
REFERENCES [dbo].[Rasa] ([RasaID])
GO
ALTER TABLE [dbo].[Odred] CHECK CONSTRAINT [FK_Odred_Rasa]
GO
ALTER TABLE [dbo].[Odred]  WITH CHECK ADD  CONSTRAINT [FK_Odred_Slika] FOREIGN KEY([SlikaID])
REFERENCES [dbo].[Slika] ([SlikaID])
GO
ALTER TABLE [dbo].[Odred] CHECK CONSTRAINT [FK_Odred_Slika]
GO
ALTER TABLE [dbo].[Odred]  WITH CHECK ADD  CONSTRAINT [FK_Odred_TipOdreda] FOREIGN KEY([TipOdredaID])
REFERENCES [dbo].[TipOdreda] ([TipOdredaID])
GO
ALTER TABLE [dbo].[Odred] CHECK CONSTRAINT [FK_Odred_TipOdreda]
GO
ALTER TABLE [dbo].[Paket]  WITH CHECK ADD  CONSTRAINT [FK_Paket_Kodeks] FOREIGN KEY([KodeksID])
REFERENCES [dbo].[Kodeks] ([KodeksID])
GO
ALTER TABLE [dbo].[Paket] CHECK CONSTRAINT [FK_Paket_Kodeks]
GO
ALTER TABLE [dbo].[Paket]  WITH CHECK ADD  CONSTRAINT [FK_Paket_Odred] FOREIGN KEY([OdredID])
REFERENCES [dbo].[Odred] ([OdredID])
GO
ALTER TABLE [dbo].[Paket] CHECK CONSTRAINT [FK_Paket_Odred]
GO
ALTER TABLE [dbo].[Paket]  WITH CHECK ADD  CONSTRAINT [FK_Paket_Popust] FOREIGN KEY([PopustID])
REFERENCES [dbo].[Popust] ([PopustID])
GO
ALTER TABLE [dbo].[Paket] CHECK CONSTRAINT [FK_Paket_Popust]
GO
ALTER TABLE [dbo].[Paket]  WITH CHECK ADD  CONSTRAINT [FK_Paket_Slika] FOREIGN KEY([SlikaID])
REFERENCES [dbo].[Slika] ([SlikaID])
GO
ALTER TABLE [dbo].[Paket] CHECK CONSTRAINT [FK_Paket_Slika]
GO
ALTER TABLE [dbo].[Rasa]  WITH CHECK ADD  CONSTRAINT [FK_Rasa_Fakcija] FOREIGN KEY([FakcijaID])
REFERENCES [dbo].[Fakcija] ([FakcijaID])
GO
ALTER TABLE [dbo].[Rasa] CHECK CONSTRAINT [FK_Rasa_Fakcija]
GO
ALTER TABLE [dbo].[Vest]  WITH CHECK ADD  CONSTRAINT [FK_Vest_Igra] FOREIGN KEY([IgraID])
REFERENCES [dbo].[Igra] ([IgraID])
GO
ALTER TABLE [dbo].[Vest] CHECK CONSTRAINT [FK_Vest_Igra]
GO
ALTER TABLE [dbo].[Vest]  WITH CHECK ADD  CONSTRAINT [FK_Vest_Slika] FOREIGN KEY([SlikaID])
REFERENCES [dbo].[Slika] ([SlikaID])
GO
ALTER TABLE [dbo].[Vest] CHECK CONSTRAINT [FK_Vest_Slika]
GO
