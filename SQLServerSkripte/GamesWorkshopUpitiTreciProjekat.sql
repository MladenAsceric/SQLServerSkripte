USE GamesWorkshop;
GO
--Kreiranje pogleda za prikaz informacija o Odredima
CREATE VIEW OdrediInfo
AS
	SELECT o.OdredNaziv AS 'Naziv odreda',t.TipOdredaNaziv AS 'Tip odreda',COUNT(m.SerijskiBroj) AS 'Broj minijatura',
	r.RasaNaziv AS 'Rasa', f.FakcijaNaziv AS 'Fakcija', i.IgraNaziv AS 'Igra'
	FROM (((((dbo.Minijatura AS m JOIN dbo.Odred AS o ON m.OdredID=o.OdredID)
	JOIN dbo.Rasa AS r ON o.RasaID=r.RasaID)
	JOIN dbo.Fakcija AS f ON f.FakcijaID=r.FakcijaID)
	JOIN dbo.Igra AS i ON i.IgraID=f.IgraID)
	JOIN dbo.TipOdreda as t ON t.TipOdredaID=o.TipOdredaID)
	GROUP BY o.OdredNaziv,t.TipOdredaNaziv,r.RasaNaziv,f.FakcijaNaziv,i.IgraNaziv

GO

SELECT *
FROM dbo.OdrediInfo;

GO

--Kreiranje procedure za upis gresaka u tabelu
CREATE PROCEDURE UpisGresakaUTabelu
AS
	PRINT 'Error Number: ' + CAST(ERROR_NUMBER() AS varchar(10));
	PRINT 'Error Message: ' + ERROR_MESSAGE();
	PRINT 'Error Severity: ' + CAST(ERROR_SEVERITY() AS varchar(10));
	PRINT 'Error State: ' + CAST(ERROR_STATE() AS varchar(10));
	PRINT 'Error Line: ' + CAST(ERROR_LINE() AS varchar(10));

	INSERT INTO dbo.Greska
	VALUES (CAST(ERROR_NUMBER() AS varchar(10)),ERROR_MESSAGE(),CAST(ERROR_SEVERITY() AS varchar(10)),CAST(ERROR_STATE() AS varchar(10)),CAST(ERROR_LINE() AS varchar(10)));
GO

--Ispis gresaka

SELECT * FROM dbo.Greska;
GO

--Kreiranje procedure za unos novih Tipova Odreda

ALTER PROCEDURE TipOdredaUnos
(
	@TipOdredaNaziv nvarchar(40),
	@TipOdredaPoeni int,
	@NoviID int OUTPUT
)
AS
BEGIN
	BEGIN TRY
		IF NOT EXISTS (SELECT * FROM dbo.TipOdreda WHERE TipOdredaNaziv = @TipOdredaNaziv)
			BEGIN
				INSERT INTO dbo.TipOdreda
				VALUES (@TipOdredaNaziv, @TipOdredaPoeni);
				SET @NoviID = SCOPE_IDENTITY();
			END;
		ELSE
			BEGIN
				RAISERROR('Tip %s vec postoji!', 16, 1, @TipOdredaNaziv);
			END;
	END TRY
	BEGIN CATCH
		EXECUTE UpisGresakaUTabelu;
	END CATCH
END;
GO

-- Testiranje procedure
DECLARE	@NoviID int;
EXEC	TipOdredaUnos
		@TipOdredaNaziv = 'Greska',
		@TipOdredaPoeni = 200,
		@NoviID = @NoviID OUTPUT;

SELECT	@NoviID as 'ID novog tipa odreda';
GO

-- Prikaz poslednje unetog Tipa Odreda
SELECT * 
FROM dbo.TipOdreda 
ORDER BY TipOdredaID DESC;
GO

DELETE  FROM dbo.TipOdreda where TipOdredaID in (15)


--Kreiranje procedure za izmenu kolicine Popusta

ALTER PROCEDURE IzmenaPopusta
(
	@PopustID int,
	@PopustKolicinaUProcentima int
)
AS
BEGIN
	BEGIN TRY
		IF NOT EXISTS(SELECT * FROM dbo.Popust WHERE PopustID=@PopustID)
			BEGIN
				RAISERROR('Popust sa ID-jem %d ne postoji!', 16, 1, @PopustID);
			END
		ELSE
			BEGIN
				IF(@PopustKolicinaUProcentima BETWEEN 1 AND 99)
					BEGIN
						UPDATE dbo.Popust
						SET PopustKolicinaUProcentima=@PopustKolicinaUProcentima
						WHERE PopustID=@PopustID
					END
				ELSE
					BEGIN
						RAISERROR('Popust mora biti izmedju 1 i 99!', 16, 1);
					END
			END
	END TRY
	BEGIN CATCH
		EXECUTE UpisGresakaUTabelu;
	END CATCH
END
GO

-- Testiranje procedure
EXEC	IzmenaPopusta
		@PopustID=3,
		@PopustKolicinaUProcentima=1;

SELECT * FROM dbo.Popust WHERE PopustID=3;

--Kreiranje procedure za brisanje Kontakt Informacija

ALTER PROCEDURE BrisanjeKontakata
(
	@DrzavaID int

)
AS
BEGIN
	BEGIN TRY
		IF NOT EXISTS(SELECT * FROM dbo.KontaktInfo WHERE DrzavaID=@DrzavaID)
			BEGIN
				RAISERROR('Zadate kontakt informacije ne postoje!', 16, 1);
			END
		ELSE
			BEGIN
				DELETE FROM dbo.KontaktInfo
				WHERE DrzavaID=@DrzavaID
			END
	END TRY
	BEGIN CATCH
		EXECUTE UpisGresakaUTabelu;
	END CATCH
END
GO

-- Testiranje procedure
EXEC	BrisanjeKontakata
		@DrzavaID=5;
		

SELECT * FROM dbo.KontaktInfo;
GO

--Procedura za stranicenje Minijatura

ALTER PROCEDURE StranicenjeMinijatura
(
	@BrojRedova bigint = 9223372036854775807,
	@BrojStranice int = 1
)
AS
BEGIN
	BEGIN TRY
		IF(@BrojRedova<1 OR @BrojStranice<1)
			BEGIN
				RAISERROR('Broj redova i stranice mora biti veci od 0!', 16, 1);
			END
		ELSE
			BEGIN
				SELECT *
				FROM dbo.Minijatura
				ORDER BY SerijskiBroj
				OFFSET (((@BrojStranice-1)*@BrojRedova)+1) ROWS FETCH next @BrojRedova ROWS ONLY;
				
			END
	END TRY
	BEGIN CATCH
		EXECUTE UpisGresakaUTabelu
	END CATCH
	
END;
GO

--Testiranje
EXEC	StranicenjeMinijatura
		@BrojRedova=20,
		@BrojStranice=3;
GO

--Skalarna funkcija za izracunavanje pdv-a na cenu
ALTER FUNCTION dbo.RacunanjePDVa(@cena float)
RETURNS money
AS
 BEGIN
	RETURN (@cena/10)
 END
GO

SELECT SerijskiBroj,MinijaturaNaziv,MinijaturaCena,dbo.RacunanjePDVa(MinijaturaCena) AS 'PDV(10%)'
FROM dbo.Minijatura
GO

--Inline table-valued funkcija za ispisivanje Minijatura koje pripadaju Odredu sa ID-jem koji unesemo

ALTER FUNCTION dbo.MinijaturePoOdredu(@OdredID int)
RETURNS TABLE
AS
RETURN (SELECT *
		FROM dbo.Minijatura
		WHERE OdredID=@OdredID);

--Testiranje

SELECT * FROM dbo.MinijaturePoOdredu(2)
GO

--AFTER okidac koji proverava ispravnost datuma u tabeli Popust

ALTER TRIGGER DatumiPopust
ON dbo.Popust
AFTER INSERT,UPDATE
AS
BEGIN
	IF EXISTS( SELECT * FROM dbo.Popust AS p WHERE p.PopustKraj < p.PopustPocetak) 
	BEGIN
		PRINT 'Datum isteka mora biti veci od datuma pocetka trajanja popusta!';
 		if @@TRANCOUNT > 0 ROLLBACK TRAN;
	END;
END
GO

--Testiranje okidaca

INSERT INTO dbo.Popust(PopustKolicinaUProcentima,PopustPocetak,PopustKraj)
VALUES(20,'20191227 00:00:00 AM','20191226 23:59:59 PM')

SELECT * FROM dbo.Popust

GO

--INSTEAD OF okidac

ALTER TRIGGER ZabranaIzmeneKodeksa
ON dbo.Kodeks
INSTEAD OF DELETE,UPDATE,INSERT
AS
BEGIN
	PRINT 'Izmena tabele Kodeks nije dozvoljena!'
	if @@TRANCOUNT > 0 ROLLBACK TRAN;
END



--Testiranje okidaca

DELETE FROM dbo.Kodeks WHERE KodeksID=1;
SELECT * FROM dbo.Kodeks

GO

--DDL okidac za sprecavanje brisanja tabela

ALTER TRIGGER NemaBrisanjaTabelaJedvaSamIhNapisao
ON DATABASE
FOR DROP_TABLE
AS
	PRINT 'Brisanje tabela nije dozvoljeno!'
	if @@TRANCOUNT > 0 ROLLBACK TRAN;

GO

--Testiranje okidaca

DROP TABLE dbo.KontaktInfo





