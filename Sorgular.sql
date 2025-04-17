--Sorgular--

--Üyeler ve þehir bilgileri

SELECT 
    m.MFirst_Name + ' ' + m.MLast_Name AS Uye_Adi,
    c.City_Name AS Sehir
FROM Members m
JOIN Cities c ON m.City_ID = c.City_ID;

--Personel ve Pozisyonlarý
SELECT 
    s.SFirst_Name + ' ' + s.SLast_Name AS Personel_Adi,
    p.Position_Name AS Pozisyon
FROM Staff s
JOIN Positions p ON s.Position_ID = p.Position_ID;


--Yazarlar ve Doðum Tarihleri
SELECT 
    a.AFirst_Name + ' ' + a.ALast_Name AS Yazar_Adi,
    a.ABirth_Date AS Dogum_Tarihi
FROM Authors a;



--Üyeler ve Personel Telefon Numaralarý

SELECT 
    m.MPhone_Number AS Telefon,
    'Uye' AS Tip
FROM Members m

UNION

SELECT 
    s.SPhone_Number AS Telefon,
    'Personel' AS Tip
FROM Staff s;


--Üye ve Personel Adlarý
SELECT 
    m.MFirst_Name + ' ' + m.MLast_Name AS Ad
FROM Members m

INTERSECT

SELECT 
    s.SFirst_Name + ' ' + s.SLast_Name AS Ad
FROM Staff s;


--Pozisyonlar ve Türler Birleþimi
SELECT 
    p.Position_Name AS Isim,
    'Pozisyon' AS Tip
FROM Positions p

UNION

SELECT 
    g.Genre_Name AS Isim,
    'Kitap Turu' AS Tip
FROM Genres g;


--Yayýnevleri ve Ýsimleri
SELECT 
    p.Publisher_Name AS Yayinevi,
    p.PPhone_Number AS Telefon
FROM Publishers p;

--Üyelerin Þehirleri ve Onlarý Kaydeden Þehirlerin Personeli
SELECT 
    m.MFirst_Name + ' ' + m.MLast_Name AS Uye_Adi,
    c.City_Name AS Sehir,
    s.SFirst_Name + ' ' + s.SLast_Name AS Personel_Adi
FROM Members m
JOIN Cities c ON m.City_ID = c.City_ID
JOIN Staff s ON s.Staff_ID = c.City_ID; -- Þehir ve personel arasýnda hayali iliþki

--Personel ve Pozisyonlarýnýn Sayýsý

SELECT 
    p.Position_Name AS Pozisyon,
    COUNT(s.Staff_ID) AS Personel_Sayisi
FROM Positions p
LEFT JOIN Staff s ON p.Position_ID = s.Position_ID
GROUP BY p.Position_Name;


--1. Yeni bir üye eklemek
INSERT INTO Members (MFirst_Name, MLast_Name, Membership_Date, MPhone_Number, Email, City_ID)
VALUES ('Ahmet', 'Kaya', '2025-02-01', '5331234567', 'ahmet.kaya@email.com', 3);
SELECT * FROM Members WHERE MFirst_Name = 'Ahmet' AND MLast_Name = 'Kaya';

--2. Yeni bir kitap eklemek
INSERT INTO Books (Title, ISBN, Publicition_Year, Publisher_ID, Book_Status, Genre_ID, Author_ID)
VALUES ('Yeni Dünya', '9789750800000', '2005-01-01', 2, 1, 3, 5);
select * from books where Title= 'Yeni Dünya' ;


--3. Yeni bir personel eklemek:
INSERT INTO Staff (SFirst_Name, SLast_Name, Position_ID, SPhone_Number)
VALUES ('Fatma', 'Yýlmaz', 4, '5321236789');
select * from staff where Position_ID = 4 ;

--4. Yeni bir þehir eklemek:
INSERT INTO Cities (City_ID, City_Name)
VALUES (9, 'Trabzon');
SELECT City_Name FROM Cities WHERE City_Name LIKE 'T%';


--5. Yeni bir yazar eklemek:
INSERT INTO Authors (AFirst_Name, ALast_Name, ABirth_Date)
VALUES ('Elif', 'Þafak', '1971-10-25');
SELECT ABirth_Date,AFirst_Name from Authors WHERE ABirth_Date LIKE '1971-10-25';

--6. Yeni bir ödünç alma eklemek:
INSERT INTO Borrowings (Book_ID, Member_ID, Borrow_Date, Due_Date, Return_Date, Staff_ID, Penalty_Amount)
VALUES
(32, 1, '2024-10-21', '2024-11-27', NULL, 11, 0), -- Kitap henüz iade edilmedi
(33, 2, '2024-10-22', '2024-11-28', NULL, 12, 0), -- Kitap henüz iade edilmedi
(40, 5, '2024-10-18', '2024-11-24', NULL, 14, 10); -- Henüz kitap iade edilmedi
SELECT * FROM Borrowings WHERE Member_ID=1 OR Member_ID=2


-- Bir kitabýn durumunu (ödünç alýnmýþ mý?) güncellemek:
Select * from Books where Title = 'Yeni Dünya';
UPDATE Books
SET Book_Status = 0 -- Ödünç alýnmýþ
WHERE Title = 'Yeni Dünya';

--Bir personelin pozisyonunu güncellemek:
UPDATE Staff
SET Position_ID = 3 -- Yeni pozisyon
WHERE SFirst_Name = 'Fatma' AND SLast_Name = 'Yýlmaz';
Select * from staff WHERE SFirst_Name = 'Fatma' AND SLast_Name = 'Yýlmaz';

-- Bir yazarýn soyadýný güncellemek:
UPDATE Authors
SET ALast_Name = 'Þafak-Gül'
WHERE AFirst_Name = 'Elif' AND ALast_Name = 'Þafak';
select * from authors where AFirst_Name = 'Elif';

--Bir þehrin adýný düzeltmek:
UPDATE Cities
SET City_Name = 'Ýzmir'
WHERE City_ID = 3;
 select * from Cities where  City_ID = 3;

 --Bir Yazarýn Doðum Tarihini Güncelleme
 UPDATE Authors
SET ABirth_Date = '1970-01-01'
WHERE AFirst_Name = 'Orhan' AND ALast_Name = 'Pamuk';
 select * from Authors where AFirst_Name = 'Orhan' AND ALast_Name = 'Pamuk';


 -- Bir üyeyi silmek:

 DELETE FROM Members
WHERE MFirst_Name = 'Ahmet' AND MLast_Name = 'Kaya';
SELECT * from members WHERE MFirst_Name = 'Ahmet' AND MLast_Name = 'Kaya';
 
 --kitabý silmek
 DELETE FROM Books
WHERE Title = 'Yeni Dünya' ;
 select * from books WHERE Title = 'Yeni Dünya';

 --Bir kitap silindiðinde, bu kitaba ait tüm cezalarýn da otomatik olarak silinmesi.

CREATE TRIGGER trg_DeleteBookPenalties
ON Books
AFTER DELETE
AS
BEGIN
    DELETE FROM Penalties
    WHERE Book_ID IN (SELECT Book_ID FROM DELETED);
END;
GO

CREATE TRIGGER trg_UpdateBookStatus
ON Borrowings
AFTER INSERT
AS
BEGIN
    UPDATE Books
    SET Book_Status = 0 -- Ödünç alýnmýþ
    WHERE Book_ID IN (SELECT Book_ID FROM INSERTED);
END;
GO

--DROP TRIGGER trg_DeleteBookPenalties; GO

--DROP TRIGGER trg_UpdateBookStatus; GO


--  Kitaplarýn listesini ve yazar bilgilerini getiren Stored Procedure - 
CREATE PROCEDURE GetBooksAndAuthors
AS
BEGIN
    SELECT 
        Books.Title AS Kitap_Adi, 
        Authors.AFirst_Name AS Yazar_Adi, 
        Authors.ALast_Name AS Yazar_Soyadi
    FROM Books
    INNER JOIN Authors ON Books.Author_ID = Authors.Author_ID;
END
GO
--EXEC GetBooksAndAuthors;

-- View 1: Türleri ve yazarlarý ile kitaplarýn listesi
CREATE VIEW BooksWithAuthorsGenres AS
SELECT 
    B.Title AS BookTitle,
    A.AFirst_Name + ' ' + A.ALast_Name AS AuthorName,
    G.Genre_Name AS Genre
FROM Books B
INNER JOIN Authors A ON B.Author_ID = A.Author_ID
INNER JOIN Genres G ON B.Genre_ID = G.Genre_ID;
GO


-- View 2: Üyelerin ve ödünç aldýklarý kitaplarýn listesi
CREATE VIEW MembersWithBorrowedBooks AS
SELECT 
    M.MFirst_Name + ' ' + M.MLast_Name AS MemberName,
    B.Title AS BookTitle,
    Bo.Borrow_Date AS BorrowDate,
    Bo.Due_Date AS DueDate
FROM Members M
INNER JOIN Borrowings Bo ON M.Member_ID = Bo.Member_ID
INNER JOIN Books B ON Bo.Book_ID = B.Book_ID;
GO



-- View 3: Pozisyonlarý ile personel
CREATE VIEW StaffWithPositions AS
SELECT 
    S.SFirst_Name + ' ' + S.SLast_Name AS StaffName,
    P.Position_Name AS Position
FROM Staff S
INNER JOIN Positions P ON S.Position_ID = P.Position_ID;
GO



-- View 4: Cezalý üyeler
CREATE VIEW MembersWithPenalties AS
SELECT 
    M.MFirst_Name + ' ' + M.MLast_Name AS MemberName,
    B.Title AS BookTitle,
    Pe.Penalty_Amount AS PenaltyAmount,
    Pe.Due_Date AS DueDate,
    Pe.Return_Date AS ReturnDate
FROM Members M
INNER JOIN Penalties Pe ON M.Member_ID = Pe.Member_ID
INNER JOIN Books B ON Pe.Book_ID = B.Book_ID;
GO


-- View 5: Yazarlar ve Kitaplarý
CREATE VIEW BooksAndAuthors AS
SELECT 
    Books.Title AS 'Kitap Adý', 
    Authors.AFirst_Name AS 'Yazar Adý', 
    Authors.ALast_Name AS 'Yazar Soyadý'
FROM Books
INNER JOIN Authors
ON Books.Author_ID = Authors.Author_ID;


-- EXCEPT Queries

-- 1. Kitap ödünç alan ancak ceza almayan üyeler
SELECT Member_ID FROM Borrowings
EXCEPT
SELECT Member_ID FROM Penalties;

-- 2.Ödünç alýnan ancak iade edilmeyen kitaplar
SELECT Book_ID FROM Borrowings WHERE Return_Date IS NULL
EXCEPT
SELECT Book_ID FROM Borrowings WHERE Return_Date IS NOT NULL;

-- 3. Ceza almýþ ancak kitap ödünç almamýþ üyeler
SELECT Member_ID FROM Penalties
EXCEPT
SELECT Member_ID FROM Borrowings;
 
-- 4. Bir türe ait olan ancak ödünç alýnmayan kitaplar
SELECT Book_ID FROM Books
EXCEPT
SELECT Book_ID FROM Borrowings;

-- 5. Göreve atanan, ancak ödünç kayýtlarý olmayan personel üyeleri
SELECT Staff_ID FROM Staff
EXCEPT
SELECT Staff_ID FROM Borrowings;

-- 6. Üyeleri olan ancak borçlanmayan þehirler
SELECT City_ID FROM Members
EXCEPT
SELECT City_ID FROM Borrowings B
INNER JOIN Members M ON B.Member_ID = M.Member_ID;


select * from Members


select * from Members
select * from Borrowings


-- 7. Asla ödünç alýnmayan kitaplara sahip yayýncýlar
SELECT Publisher_ID FROM Books
EXCEPT
SELECT Publisher_ID FROM Borrowings B
INNER JOIN Books Bo ON B.Book_ID = Bo.Book_ID;

-- 8. Kütüphanede kitaplarý bulunan ancak ödünç alýnmayan yazarlar
SELECT Author_ID FROM Books
EXCEPT
SELECT Author_ID FROM Borrowings B
INNER JOIN Books Bo ON B.Book_ID = Bo.Book_ID;

 --ky--

 --Kitaplarýn Yazar Ýsimleriyle Listelenmesi 
SELECT 
    b.Title AS Book_Title, 
    a.AFirst_Name AS Author_First_Name, 
    a.ALast_Name AS Author_Last_Name
FROM 
    Books b
JOIN 
    Authors a ON b.Author_ID = a.Author_ID; 

--Kitaplar ve Yazarlar arasýndaki iliþkiyi listelemek için Authors ve Books tablolarýný birleþtirir.
SELECT 
    B.Title, 
    A.AFirst_Name, 
    A.ALast_Name 
FROM 
    Books B
JOIN 
	Authors A ON B.Author_ID = A.Author_ID

--Kitap Türlerini ve Yayýncý Ýsimlerini Listeleme 
SELECT 
    g.Genre_Name AS Genre, 
    p.Publisher_Name AS Publisher
FROM 
    Books b
JOIN 
    Genres g ON b.Genre_ID = g.Genre_ID
JOIN 
    Publishers p ON b.Publisher_ID = p.Publisher_ID;

--Her yazarýn kaç kitabý olduðunu öðrenmek için Books ve Authors tablolarýný gruplandýrarak yazar bazýnda kitap sayýsýný listeler.

SELECT 
    A.AFirst_Name, 
    A.ALast_Name, 
    COUNT(B.Book_ID) AS Book_Count
FROM 
    Books B
JOIN 
    Authors A ON B.Author_ID = A.Author_ID
GROUP BY 
    A.AFirst_Name, A.ALast_Name;

--EXISTS kullanarak cezalý üyeleri listeleme

SELECT 
    MFirst_Name, 
    MLast_Name
FROM 
    Members m
WHERE 
    EXISTS (
        SELECT 1
        FROM Penalties p
        WHERE p.Member_ID = m.Member_ID
        AND p.Penalty_Status = 1      
);

--IN: Belirli Bir Þehirdeki Üyelerin Listesi 
SELECT 
    MFirst_Name, 
    MLast_Name, 
    Email
FROM 
    Members
WHERE 
    City_ID IN (
        SELECT City_ID 
        FROM Cities 
        WHERE City_Name = 'Ankara'
    );

--UNION: Farklý Þehirlerdeki Personel ve Üyeleri Listeleme 
SELECT 
    MFirst_Name AS First_Name, 
    MLast_Name AS Last_Name, 
    'Member' AS Role
FROM 
    Members
WHERE 
    City_ID = 1
UNION
(SELECT 
    SFirst_Name AS First_Name, 
    SLast_Name AS Last_Name, 
    'Staff' AS Role
FROM 
    Staff
WHERE 
    Position_ID = 2);


--INTERSECT: Ceza Almýþ Üyelerin Listesi 
SELECT Member_ID FROM 
    Borrowings 
WHERE 
    Penalty_Amount > 0
INTERSECT
SELECT 
    Member_ID 
FROM 
    Penalties 
WHERE 
    Penalty_Status = 1;

--1. Members Tablosu için Telefon Numarasý Ýndeksi:
CREATE INDEX idx_members_phone_number ON Members(MPhone_Number);
--2. Penalties Tablosu için Ceza Durumu ve Üye Kimliði Ýndeksi:
CREATE INDEX idx_penalties_status_member ON Penalties(Penalty_Status, Member_ID);
--3. Authors Tablosu için Yazar Adý ve Soyadý Ýndeksi:
CREATE INDEX idx_authors_full_name ON Authors(AFirst_Name, ALast_Name);
--4. Borrowings Tablosu için Üye ve Kitap Ýndeksi:
CREATE INDEX idx_borrowings_member_book ON Borrowings(Member_ID, Book_ID);
--5. Publishers Tablosu için Yayýnevi Adý Ýndeksi:
CREATE INDEX idx_publishers_name ON Publishers(Publisher_Name);


--Kitaplarý belirli bir türe göre listeleyen stored procedure kodu 
CREATE PROCEDURE GetBooksByGenre 
@genreName NVARCHAR(50) 
AS BEGIN
 SELECT b.Title, b.Publicition_Year, g.Genre_Name
 FROM Books b JOIN Genres g 
ON b.Genre_ID = g.Genre_ID 
WHERE g.Genre_Name = @genreName; 
END

--EXEC GetBooksByGenre @genreName = 'Roman';



--bb--
--Üyelerin aldýklarý kitap sayýsýný ve toplam gecikme cezalarýný hesaplayýp bu üyelerden toplam ceza miktarý 5 TL den fazla olanlar
SELECT
	M.Member_ID, M.MFirst_Name + ' ' + M.MLast_Name AS Member_Name,
 	COUNT(B.Book_ID) AS Total_Borrowed_Books,
  	SUM(P.Penalty_Amount) AS Total_Penalty
FROM Members M
LEFT JOIN Borrowings B ON M.Member_ID = B.Member_ID
LEFT JOIN Penalties P ON M.Member_ID = P.Member_ID
GROUP BY
	M.Member_ID, M.MFirst_Name, M.MLast_Name
HAVING
            SUM(P.Penalty_Amount) > 5; 


--Her yayýncýnýn yayýnladýðý kitap sayýsýný gösteren bir sorgu:
SELECT 
    P.Publisher_Name,
    COUNT(B.Book_ID) AS Total_Books
FROM 
    Publishers P
INNER JOIN Books B ON P.Publisher_ID = B.Publisher_ID
GROUP BY 
    P.Publisher_Name


--Her türdeki kitaplarýn mevcut durumu ve toplam sayýsý:
SELECT 
    G.Genre_Name,
    SUM(CASE WHEN B.Book_Status = 1 THEN 1 ELSE 0 END) AS Available_Books,
    SUM(CASE WHEN B.Book_Status = 0 THEN 1 ELSE 0 END) AS Borrowed_Books,
    COUNT(B.Book_ID) AS Total_Books
FROM 
    Genres G
LEFT JOIN Books B ON G.Genre_ID = B.Genre_ID
GROUP BY 
    G.Genre_Name
HAVING 
    COUNT(B.Book_ID) > 0; 

--Her personelin kontrol ettiði kitap sayýsýný listeleyen bir sorgu:
SELECT 
    S.Staff_ID,
    S.SFirst_Name + ' ' + S.SLast_Name AS Staff_Name,
    COUNT(DISTINCT B.Book_ID) AS Processed_Books
FROM 
    Staff S
INNER JOIN Borrowings B ON S.Staff_ID = B.Staff_ID
GROUP BY 
    S.Staff_ID, S.SFirst_Name, S.SLast_Name
HAVING 
    COUNT(DISTINCT B.Book_ID) > 2; 

--hangi ilden daha çok üye olduðunu gösteren select sorgusu
SELECT 
    C.City_Name,
    COUNT(M.Member_ID) AS Total_Members
FROM 
    Cities C
LEFT JOIN Members M ON C.City_ID = M.City_ID
GROUP BY 
    C.City_Name
ORDER BY 
    Total_Members DESC;

--Borcu Olanlarýn Hangi Ýllerde Oturduðu
SELECT 
    C.City_Name,
    COUNT(DISTINCT M.Member_ID) AS Total_Borrowing_Members,
    SUM(P.Penalty_Amount) AS Total_Penalty_Amount
FROM 
    Cities C
INNER JOIN Members M ON C.City_ID = M.City_ID
INNER JOIN Penalties P ON M.Member_ID = P.Member_ID
WHERE 
    P.Penalty_Amount > 0
GROUP BY 
    C.City_Name
ORDER BY 
    Total_Penalty_Amount DESC; 


--Her Þehirde Kaç Üye Olduðunu ve Toplam Ceza Miktarýný Gösteren Sorgu
SELECT 
    C.City_Name,
    COUNT(M.Member_ID) AS Total_Members,
    SUM(P.Penalty_Amount) AS Total_Penalties
FROM 
    Cities C
LEFT JOIN Members M ON C.City_ID = M.City_ID
LEFT JOIN Penalties P ON M.Member_ID = P.Member_ID
GROUP BY 
    C.City_Name
ORDER BY 
    Total_Members DESC; 


--Hangi Yazar Daha Çok Kitap Yazmýþ
SELECT
A.AFirst_Name +' ' +A.ALast_Name AS Author_Name,
COUNT(B.Book_ID) AS Total_Books_Written
FROM Authors A
INNER JOIN Books B ON A.Author_ID = B.Author_ID
GROUP BY
A.AFirst_Name, A.ALast_Name
ORDER BY
Total_Books_Written ASC;

--Kitabýn ödünç alýnma, kitap durumunun güncellenmesi ve ödünç alma kaydýnýn eklenmesini içeren transaction
CREATE PROCEDURE BorrowBook
	@BookID INT,
	@MemberID INT,
	@StaffID INT,
	@BorrowDate DATETIME2,
	@DueDate DATETIME2
AS
BEGIN
	BEGIN TRANSACTION;
 
	BEGIN TRY
    	UPDATE Books
    	SET Book_Status = 0
    	WHERE Book_ID = @BookID;
    	IF EXISTS (SELECT 1 FROM Books WHERE Book_ID = @BookID AND Book_Status = 0)
    	BEGIN
        	THROW 50001, 'Kitap zaten ödünçte.', 1;
    	END
    	INSERT INTO Borrowings (Book_ID, Member_ID, Borrow_Date, Due_Date, Staff_ID)
    	VALUES (@BookID, @MemberID, @BorrowDate, @DueDate, @StaffID);
    	COMMIT TRANSACTION;
    	PRINT 'Kitap ödünç alma iþlemi baþarýlý bir þekilde tamamlandý.';
	END TRY
	BEGIN CATCH
    	ROLLBACK TRANSACTION;
    	PRINT 'Hata oluþtu: Ýþlem geri alýndý.';
    	THROW; 
	END CATCH
END;
