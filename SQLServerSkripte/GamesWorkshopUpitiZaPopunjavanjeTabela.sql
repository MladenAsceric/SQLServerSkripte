USE GamesWorkshop;

--Popunjavanje tabele dbo.KontaktIndo
INSERT INTO dbo.KontaktInfo(NazivDrzave,EmailAdresa,BrojTelefona,PostanskaAdresa)
VALUES('Serbia','GWSerbia@gmail.com','011-333-555','Solunska 22'),
('Germany','GWGermany@gmail.com','232-155-908','Gutten tag 3'),
('United Kingdoms@gmail.com','GWUK','101-202-303','St. King Arthur 46c'),
('France','GWFrance@gmail.com','445-817-1911','Bonjour boulevard 1190'),
('Croatia','GWCroatia@gmail.com','012-444-666','Trg Lepe nase 7a');

UPDATE dbo.KontaktInfo
SET NazivDrzave='United Kingdoms',EmailAdresa='GWUK@gmail.com'
WHERE DrzavaID=4;

SELECT * FROM dbo.KontaktInfo;

--Popunjvanje tabele PaletaBoja
INSERT INTO dbo.PaletaBoja(PaletaBoja)
VALUES('Black,Bone,Bronze,Metal,Flesh,Mauve'),
('Green,Dust,Brown,Red'),
('Blue,White,Red,Black,Silver'),
('Red,Black,Gold,Silver'),
('Bone,Red,Black,Silver'),
('Black,Silver,Red,Flesh'),
('Purple,Bone,Yellow'),
('Black,Neon Green'),
('Green,Yellow,Black,White,Metal'),
('Green,Red,Black,Bone');

DELETE FROM dbo.PaletaBoja
WHERE PaletaID=7;

SELECT * FROM dbo.PaletaBoja;

--Popunjavanje tabele TipOdreda
INSERT INTO dbo.TipOdreda(TipOdredaNaziv,TipOdredaPoeni)
VALUES('Infantry squad',140),
('Riders',270),
('Heavy squad',310),
('Champion',400),
('Flyer',340),
('Bomb squad',290),
('Artillery',440),
('Heavy artillery',500),
('Titan',1200),
('Proba',1000);

SELECT * FROM dbo.TipOdreda;

DELETE FROM dbo.TipOdreda
WHERE TipOdredaID IN (9,10)
AND TipOdredaPoeni < 1200;


--Popunjavanje tabele Popust
INSERT INTO dbo.Popust(PopustKolicinaUProcentima,PopustPocetak,PopustKraj)
VALUES(20,'20191220 00:00:00 AM','20191226 23:59:59 PM'),
(15,'20191230 00:00:00 AM','20200103 23:59:59 PM'),
(25,'20200310 00:00:00 AM','20200325 23:59:59 PM'),
(5,'20191118 00:00:00 AM','20191130 23:59:59 PM'),
(50,'20191113 00:00:00 AM','20191113 23:59:59 PM'),
(10,'20191201 00:00:00 AM','20191208 23:59:59 PM'),
(20,'20191220 00:00:00 AM','20191226 23:59:59 PM'),
(15,'20191230 00:00:00 AM','20200103 23:59:59 PM'),
(25,'20200310 00:00:00 AM','20200325 23:59:59 PM'),
(5,'20191118 00:00:00 AM','20191130 23:59:59 PM'),
(50,'20191113 00:00:00 AM','20191113 23:59:59 PM'),
(10,'20191201 00:00:00 AM','20191208 23:59:59 PM'),
(20,'20191220 00:00:00 AM','20191226 23:59:59 PM'),
(15,'20191230 00:00:00 AM','20200103 23:59:59 PM'),
(25,'20200310 00:00:00 AM','20200325 23:59:59 PM'),
(5,'20191118 00:00:00 AM','20191130 23:59:59 PM'),
(50,'20191113 00:00:00 AM','20191113 23:59:59 PM'),
(10,'20191201 00:00:00 AM','20191208 23:59:59 PM'),
(20,'20191220 00:00:00 AM','20191226 23:59:59 PM'),
(15,'20191230 00:00:00 AM','20200103 23:59:59 PM'),
(25,'20200310 00:00:00 AM','20200325 23:59:59 PM'),
(5,'20191118 00:00:00 AM','20191130 23:59:59 PM'),
(50,'20191113 00:00:00 AM','20191113 23:59:59 PM'),
(10,'20191201 00:00:00 AM','20191208 23:59:59 PM');

SELECT * FROM dbo.Popust;

UPDATE dbo.Popust
SET PopustKolicinaUProcentima +=5
WHERE PopustID=17;

--Popunjavanje tabele Slika
INSERT INTO dbo.Slika(SlikaURL,SlikaNaziv)
VALUES('https://www.warhammer-community.com/wp-content/themes/gw-community/library/force-download.php?file=/dom17890/wp-content/uploads/2018/01/WHAoSLogoNEW2018-web.png','Warhammer Age of Sigmar'),
('https://www.google.com/imgres?imgurl=https%3A%2F%2Fwww.trzcacak.rs%2Fmyfile%2Fdetail%2F229-2295701_warhammer-40k-logo-png.png&imgrefurl=https%3A%2F%2Fwww.trzcacak.rs%2Fimgm%2FioTRTRx_warhammer-40k-logo-png%2F&docid=lWCSTiFZ_T7aSM&tbnid=TuncGl0c3S4TwM%3A&vet=10ahUKEwj6pKyA7fPlAhUOLewKHWTuBd0QMwhFKAMwAw..i&w=920&h=250&bih=913&biw=1280&q=warhammer%2040k%20logo&ved=0ahUKEwj6pKyA7fPlAhUOLewKHWTuBd0QMwhFKAMwAw&iact=mrc&uact=8','Warhammer 40.000'),
('https://www.google.com/imgres?imgurl=https%3A%2F%2Fwww.warhammer-community.com%2Fwp-content%2Fuploads%2F2018%2F06%2FUKExpo-June1-MiddleEarth4bh.jpg&imgrefurl=https%3A%2F%2Fwww.warhammer-community.com%2F2018%2F08%2F09%2F9th-aug-middle-earth-dice-measurers-and-a-warlords-updatefw-homepage-post-2%2F&docid=DW-4hDoUp_IpDM&tbnid=dgv1yNLKYWQxbM%3A&vet=10ahUKEwjUlM-k7fPlAhVDqaQKHVp-ALIQMwhLKAkwCQ..i&w=800&h=206&bih=913&biw=1280&q=middle%20earth%20strategy%20battle%20game%20logo&ved=0ahUKEwjUlM-k7fPlAhVDqaQKHVp-ALIQMwhLKAkwCQ&iact=mrc&uact=8','Middle-earth Stategy Battle Game');

INSERT INTO dbo.Slika(SlikaURL,SlikaNaziv)
VALUES('https://www.google.com/imgres?imgurl=https%3A%2F%2Fwww.warhammer-community.com%2Fwp-content%2Fuploads%2F2019%2F07%2FWarCryPreview-Jul14-WarcryHeader21yhdw.jpg&imgrefurl=https%3A%2F%2Fwww.bleedingcool.com%2F2019%2F08%2F09%2Fbleeding-cool-reviews-games-workshops-age-of-sigmar-warcry%2F&docid=sN60ZoyQ0bxYlM&tbnid=_pM9ohnEDyTU0M%3A&vet=10ahUKEwjC757v9vPlAhWE-6QKHWdKAdcQMwg_KAMwAw..i&w=1000&h=345&bih=913&biw=1280&q=warcry%20logo&ved=0ahUKEwjC757v9vPlAhWE-6QKHWdKAdcQMwg_KAMwAw&iact=mrc&uact=8','Warcry vest');

INSERT INTO dbo.Slika(SlikaURL,SlikaNaziv)
VALUES('https://www.google.com/imgres?imgurl=https%3A%2F%2Fcdn4.iconfinder.com%2Fdata%2Ficons%2Fchristmas-special-vol-2%2F100%2Fchristmas_exclusive_discount_marketing_advertising_branding-512.png&imgrefurl=https%3A%2F%2Fwww.iconfinder.com%2Ficons%2F763692%2Fadvertising_branding_christmas_discount_exclusive_marketing_icon&docid=pMBvVtvSxSrUbM&tbnid=WPnklPKYAD1PyM%3A&vet=10ahUKEwibqPnL9_PlAhUE-aQKHSj1AqwQMwhTKAowCg..i&w=512&h=512&bih=913&biw=1280&q=christmas%20discount&ved=0ahUKEwibqPnL9_PlAhUE-aQKHSj1AqwQMwhTKAowCg&iact=mrc&uact=8','Christmas Discount');

INSERT INTO dbo.Slika(SlikaURL,SlikaNaziv)
VALUES('https://www.games-workshop.com/resources/catalog/product/920x950/99120204016_TreeRevenant01.jpg','Tree-Revenants'),
('https://www.games-workshop.com/resources/catalog/product/920x950/60010799005_ShadespireENG03.jpg','Easy To Build: Steelheart’s Champions'),
('https://www.games-workshop.com/resources/catalog/product/920x950/99120212014_DaughtersofKhaineCoven05.jpg','Sisters of Slaughter'),
('https://www.games-workshop.com/resources/catalog/product/920x950/99120219011_NamartiThralls01.jpg','Namarti Thralls'),
('https://www.games-workshop.com/resources/catalog/product/920x950/99120205015_FyreslayersVulkiteBerzerkers01.jpg','Vulkite Berzerkers'),
('https://www.games-workshop.com/resources/catalog/product/920x950/99120216009_BoCBrayherdGors01.jpg','Gors'),
('https://www.games-workshop.com/resources/catalog/product/920x950/99120201042_KhorneWrathmongers01.jpg','Wrathmongers'),
('https://www.games-workshop.com/resources/catalog/product/920x950/99810216005_CentigorHerdNEW01.jpg','Centigors'),
('https://www.games-workshop.com/resources/catalog/product/920x950/99120207033_FleshEaterCryptHorrors01.jpg','Crypt Horrors'),
('https://www.games-workshop.com/resources/catalog/product/920x950/99120207029_DeathLordsNagashSupremelordoftheUndead01.jpg','Nagash, Supreme Lord of the Undead'),
('https://www.games-workshop.com/resources/catalog/product/920x950/99120207066_BladegheistRevenants01.jpg','Bladegheist Revenants'),
('https://www.games-workshop.com/resources/catalog/product/920x950/99120209050_GloomspiteGitzManglerSquigs01.jpg','Mangler Squigs'),
('https://www.games-workshop.com/resources/catalog/product/920x950/99120213016_RaidersonThundertusk01.jpg','Thundertusk Beastriders'),
('https://www.games-workshop.com/resources/catalog/product/920x950/99120101122_BATacticalSquad01.jpg','Blood Angels Tactical Squad'),
('https://www.games-workshop.com/resources/catalog/product/920x950/99810101061_GrimaldusRetinueNEW_01.jpg','Black Templars Chaplain Grimaldus & Retinue'),
('https://www.games-workshop.com/resources/catalog/product/920x950/99120101263_SMPrimarisInfiltrators01.jpg','Primaris Infiltrators'),
('https://www.games-workshop.com/resources/catalog/product/920x950/99129915045_GreatUncleanOne01.jpg','Great Unclean One'),
('https://www.games-workshop.com/resources/catalog/product/920x950/99120102063_RubicMarines02.jpg','Rubric Marines'),
('https://www.games-workshop.com/resources/catalog/product/920x950/99020102057_CSMMastersofRuin.jpg','Masters of Ruin');

INSERT INTO dbo.Slika(SlikaURL,SlikaNaziv)
VALUES('https://www.games-workshop.com/resources/catalog/product/920x950/99120204016_TreeRevenant01.jpg','Slika 1'),
('https://www.games-workshop.com/resources/catalog/product/920x950/99020102057_CSMMastersofRuin.jpg','Slika 2'),
('https://www.games-workshop.com/resources/catalog/product/920x950/99120219011_NamartiThralls01.jpg','Slika 3'),
('https://www.games-workshop.com/resources/catalog/product/920x950/99120205015_FyreslayersVulkiteBerzerkers01.jpg','Slika 4'),
('https://www.games-workshop.com/resources/catalog/product/920x950/99120213016_RaidersonThundertusk01.jpg','Slika 5'),
('https://www.games-workshop.com/resources/catalog/product/920x950/99120219011_NamartiThralls01.jpg','Slika 6'),
('https://www.games-workshop.com/resources/catalog/product/920x950/99120205015_FyreslayersVulkiteBerzerkers01.jpg','Slika 7'),
('https://www.games-workshop.com/resources/catalog/product/920x950/99120213016_RaidersonThundertusk01.jpg','Slika 8'),
('https://www.games-workshop.com/resources/catalog/product/920x950/99120213016_RaidersonThundertusk01.jpg','Slika 9'),
('https://www.games-workshop.com/resources/catalog/product/920x950/99120219011_NamartiThralls01.jpg','Slika 10'),
('https://www.games-workshop.com/resources/catalog/product/920x950/99120205015_FyreslayersVulkiteBerzerkers01.jpg','Slika 11'),
('https://www.games-workshop.com/resources/catalog/product/920x950/99810216005_CentigorHerdNEW01.jpg','Slika 12'),
('https://www.games-workshop.com/resources/catalog/product/920x950/99120102063_RubicMarines02.jpg','Slika 13'),
('https://www.games-workshop.com/resources/catalog/product/920x950/99120213016_RaidersonThundertusk01.jpg','Slika 14'),
('https://www.games-workshop.com/resources/catalog/product/920x950/99120205015_FyreslayersVulkiteBerzerkers01.jpg','Slika 15'),
('https://www.games-workshop.com/resources/catalog/product/920x950/99120219011_NamartiThralls01.jpg','Slika 16'),
('https://www.games-workshop.com/resources/catalog/product/920x950/99120213016_RaidersonThundertusk01.jpg','Slika 17'),
('https://www.games-workshop.com/resources/catalog/product/920x950/99120205015_FyreslayersVulkiteBerzerkers01.jpg','Slika 18'),
('https://www.games-workshop.com/resources/catalog/product/920x950/99120213016_RaidersonThundertusk01.jpg','Slika 19'),
('https://www.games-workshop.com/resources/catalog/product/920x950/99810216005_CentigorHerdNEW01.jpg','Slika 20'),
('https://www.games-workshop.com/resources/catalog/product/920x950/99120213016_RaidersonThundertusk01.jpg','Slika 21'),
('https://www.games-workshop.com/resources/catalog/product/920x950/99120205015_FyreslayersVulkiteBerzerkers01.jpg','Slika 22'),
('https://www.games-workshop.com/resources/catalog/product/920x950/99120219011_NamartiThralls01.jpg','Slika 23'),
('https://www.games-workshop.com/resources/catalog/product/920x950/99120102063_RubicMarines02.jpg','Slika 24'),
('https://www.games-workshop.com/resources/catalog/product/920x950/99120213016_RaidersonThundertusk01.jpg','Slika 25'),
('https://www.games-workshop.com/resources/catalog/product/920x950/99120213016_RaidersonThundertusk01.jpg','Slika 26'),
('https://www.games-workshop.com/resources/catalog/product/920x950/99120205015_FyreslayersVulkiteBerzerkers01.jpg','Slika 27'),
('https://www.games-workshop.com/resources/catalog/product/920x950/99120219011_NamartiThralls01.jpg','Slika 28'),
('https://www.games-workshop.com/resources/catalog/product/920x950/99120213016_RaidersonThundertusk01.jpg','Slika 29'),
('https://www.games-workshop.com/resources/catalog/product/920x950/99120213016_RaidersonThundertusk01.jpg','Slika 30'),
('https://www.games-workshop.com/resources/catalog/product/920x950/99120205015_FyreslayersVulkiteBerzerkers01.jpg','Slika 31');

SELECT dbo.Slika.SlikaID,dbo.Slika.SlikaNaziv FROM dbo.Slika;

--Popunjavanje tabele Igra
INSERT INTO dbo.Igra(IgraNaziv,IgraOpis,SlikaID)
VALUES('Warhammer Age of Sigmar','Medieval fantasy, strategy, miniature game',1),
('Warhammer 40.000','Sci-Fi strategy, miniature game',2),
('Middle-earth Strategy Battle Game','Medieval fantasy, strategy, miniature game, based on a Lord of the Ring franchise',3);

SELECT * FROM dbo.Igra;

--Popunjavanje tabele Fakcija
INSERT INTO dbo.Fakcija(FakcijaNaziv,IgraID)
VALUES ('Grand Alliance Order',1),
('Grand Alliance Chaos',1),
('Grand Alliance Death',1),
('Grand Alliance Destruction',1),
('Armies of the Imperium',2),
('Armies of Chaos',2),
('Xenos Armies',2),
('Armies of Chaos',2),
('Good',3),
('Evil',3);

SELECT * FROM dbo.Fakcija;

--Ppopunjavanje tabele Vesti
INSERT INTO dbo.Vest(VestNaslov,VestTekst,SlikaID,IgraID)
VALUES('Warcry','Explore new Warhammer Age of Sigmar tactical game and build your battle bands!',4,1),
('Christmas discount','Hurry up and order your sets now and save up to 20%!',5,1),
('Christmas discount','Hurry up and order your sets now and save up to 20%!',5,2),
('Christmas discount','Hurry up and order your sets now and save up to 20%!',5,3);

--Popunjavanje tabele Rasa
INSERT INTO dbo.Rasa(RasaNaziv,FakcijaID)
VALUES('Cities of Sigar',1),
('Daughters of Khaine',1),
('Fyreslayers',1),
('Idoneth Deepkin',1),
('Beasts of Chaos',2),
('Blades of Khorne',2),
('Creatures of Chaos',2),
('Flesh-eater Courts',3),
('Legions of Nagash',3),
('Nighthaunt',3),
('Gloomspite Gitz',4),
('Ogor Mawtribes',4),
('Black templars',5),
('Blood angels',5),
('Iron hands',5),
('Chaos Daemons',6),
('Chaos Space Marines',6),
('Thousand Sons',6),
('Craftworlds',7),
('Drikhari',7),
('Necrons',7);

SELECT * FROM dbo.Rasa;

--Popunjavanje tabele Odred
INSERT INTO dbo.Odred(OdredNaziv,OdredBrojMinijatura,OdredCena,OdredStanjeNaLageru,TipOdredaID,RasaID,SlikaID)
VALUES('Tree-Revenants',5,25,27,1,2,6),
('Easy To Build: Steelheart’s Champions',3,21,13,1,1,7),
('Sisters of Slaughter',7,27,20,1,3,8),
('Namarti Thralls',4,19,0,1,4,9),
('Vulkite Berzerkers',8,29,15,3,5,10),
('Gors',5,25,30,7,6,11),
('Wrathmongers',6,21,20,1,7,12),
('Centigors',5,30,17,2,8,13),
('Crypt Horrors',3,19,0,1,9,14),
('Nagash, Supreme Lord of the Undead',1,49,3,4,9,15),
('Bladegheist Revenants',5,27,5,1,9,16),
('Mangler Squigs',2,17,0,2,10,17),
('Thundertusk Beastriders',1,32,19,2,11,18),
('Blood Angels Tactical Squad',8,26,50,1,13,19),
('Black Templars Chaplain Grimaldus & Retinue',3,39,38,4,12,20),
('Primaris Infiltrators',5,20,20,1,14,21),
('Great Unclean One',1,49,39,4,15,22),
('Rubric Marines',8,36,10,1,17,23),
('Masters of Ruin',5,34,0,1,16,24);

SELECT * FROM dbo.Odred;


--Popunjavanje tabele Kodeks
INSERT INTO dbo.Kodeks(KodeksNaziv,KodeksBrojStrana,KodeksCena,KodeksStanjeNaLageru,RasaID,SlikaID)
VALUES('Codex: Cities of Sigar',150,13,20,1,10),
('Codex: Daughters of Khaine',150,13,20,2,11),
('Codex: Fyreslayers',150,13,20,3,13),
('Codex: Idoneth Deepkin',150,13,20,4,14),
('Codex: Beasts of Chaos',150,13,20,5,15),
('Codex: Blades of Khorne',150,13,20,6,16),
('Codex: Creatures of Chaos',150,13,20,7,17),
('Codex: Flesh-eater Courts',150,13,20,8,18),
('Codex: Legions of Nagash',150,13,20,9,19),
('Codex: Nighthaunt',150,13,20,10,20),
('Codex: Gloomspite Gitz',150,13,20,11,15),
('Codex: Ogor Mawtribes',150,13,20,12,15),
('Codex: Black templars',150,13,20,13,15),
('Codex: Blood angels',150,13,20,14,15),
('Codex: Iron hands',150,13,20,15,15),
('Codex: Chaos Daemons',150,13,20,16,15),
('Codex: Chaos Space Marines',150,13,20,17,15),
('Codex: Thousand Sons',150,13,20,18,15),
('Codex: Craftworlds',150,13,20,19,15),
('Codex: Drikhari',150,13,20,20,15),
('Codex: Necrons',150,13,20,21,15);

SELECT * FROM dbo.Kodeks;

--Ppopunjavanje tabele Paket
INSERT INTO dbo.Paket(PaketNaziv,PakeBrojOdreda,PaketCena,PaketStanjeNaLageru,OdredID,KodeksID,SlikaID)
VALUES('Bundle: Chaos',2,80,7,7,18,2),
('Bundle: Fyreslayers',3,90,17,19,3,1),
('Bundle: Necrons',5,130,11,8,21,2),
('Bundle: Drikhari',3,69,2,17,20,2);


--Popunjavanje tabele Minijatura
INSERT INTO dbo.Minijatura(MinijaturaNaziv,MinijaturaCena,MinijaturaStanjeNaLageru,OdredID,PopustID,SlikaID,PaletaID)
VALUES('Garrett',15,15,7,14,7,3),
('Kareem',15,50,18,15,31,4),
('Travis',13,60,13,14,29,4),
('Gabriel',24,25,8,17,16,5),
('Sylvester',13,24,11,15,16,3),
('Grant',16,48,4,14,5,5),
('Giacomo',22,62,19,18,8,5),
('Marsden',24,8,11,14,34,5),
('Ryder',17,21,7,16,37,4),
('Ray',25,56,19,13,55,6),
('Brennan',25,51,10,14,13,6),
('Honorato',18,22,7,15,1,5),
('Ulric',20,44,8,16,51,3),
('Nasim',25,37,17,13,22,1),
('Yuli',22,38,18,15,12,3),
('Slade',13,15,13,16,37,2),
('Dieter',21,55,3,15,8,4),
('Curran',14,58,19,15,45,3),
('Murphy',10,18,8,18,49,1),
('Clinton',14,17,2,18,53,4),
('Calvin',26,65,6,16,26,5),
('Nasim',23,36,4,17,45,3),
('Ronan',14,34,8,18,47,3),
('Mohammad',14,28,10,18,38,1),
('Palmer',16,42,17,18,33,6),
('Brenden',22,10,14,13,34,2),
('Levi',22,7,11,18,39,3),
('Josiah',13,16,7,15,40,5),
('Beck',23,24,15,18,40,6),
('Talon',23,17,5,16,28,2),
('Jamal',15,8,10,17,3,3),
('Ali',13,22,15,13,15,3),
('Wallace',22,16,16,17,22,2),
('Neville',23,35,2,14,24,5),
('Paul',24,52,14,16,8,1),
('Fuller',24,23,18,13,5,3),
('Wing',10,37,9,15,15,6),
('Sebastian',11,29,13,16,32,3),
('Clark',18,39,10,15,41,6),
('Hedley',9,41,2,17,38,6),
('Yardley',25,57,5,16,27,4),
('Brandon',19,38,8,16,7,2),
('Reece',23,15,14,18,17,3),
('Bruno',15,9,19,14,15,2),
('Robert',26,27,5,13,7,2),
('Beck',15,25,16,15,47,2),
('Carson',17,57,5,15,8,3),
('Adam',19,50,16,15,9,5),
('Jin',15,13,16,18,43,2),
('Dolan',19,44,1,14,34,6),
('Slade',10,49,9,15,26,5),
('Brett',18,26,13,18,51,4),
('Amal',15,29,3,14,51,1),
('Herman',19,61,11,16,42,2),
('Keefe',18,55,4,14,12,1),
('Rashad',9,65,5,14,3,3),
('Ezekiel',14,59,16,13,5,5),
('Honorato',21,10,12,18,26,1),
('John',16,20,17,17,17,3),
('Aquila',18,38,13,17,52,6),
('Eagan',14,10,9,13,6,2),
('Austin',25,61,3,13,34,6),
('Hayden',13,42,15,15,52,5),
('Merritt',26,39,11,16,30,2),
('Len',18,60,3,15,5,1),
('Isaac',25,13,9,16,39,5),
('Cody',14,6,3,18,54,4);

SELECT * FROM dbo.Minijatura;
