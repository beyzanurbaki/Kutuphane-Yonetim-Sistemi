--Sorgular--

--�yeler ve �ehir bilgileri

SELECT 
    m.MFirst_Name + ' ' + m.MLast_Name AS Uye_Adi,
    c.City_Name AS Sehir
FROM Members m
JOIN Cities c ON m.City_ID = c.City_ID;

--Personel ve Pozisyonlar�
SELECT 
    s.SFirst_Name + ' ' + s.SLast_Name AS Personel_Adi,
    p.Position_Name AS Pozisyon
FROM Staff s
JOIN Positions p ON s.Position_ID = p.Position_ID;


--Yazarlar ve Do�um Tarihleri
SELECT 
    a.AFirst_Name + ' ' + a.ALast_Name AS Yazar_Adi,
    a.ABirth_Date AS Dogum_Tarihi
FROM Authors a;



--�yeler ve Personel Telefon Numaralar�

SELECT 
    m.MPhone_Number AS Telefon,
    'Uye' AS Tip
FROM Members m

UNION

SELECT 
    s.SPhone_Number AS Telefon,
    'Personel' AS Tip
FROM Staff s;


--�ye ve Personel Adlar�
SELECT 
    m.MFirst_Name + ' ' + m.MLast_Name AS Ad
FROM Members m

INTERSECT

SELECT 
    s.SFirst_Name + ' ' + s.SLast_Name AS Ad
FROM Staff s;


--Pozisyonlar ve T�rler Birle�imi
SELECT 
    p.Position_Name AS Isim,
    'Pozisyon' AS Tip
FROM Positions p

UNION

SELECT 
    g.Genre_Name AS Isim,
    'Kitap Turu' AS Tip
FROM Genres g;


--Yay�nevleri ve �simleri
SELECT 
    p.Publisher_Name AS Yayinevi,
    p.PPhone_Number AS Telefon
FROM Publishers p;

--�yelerin �ehirleri ve Onlar� Kaydeden �ehirlerin Personeli
SELECT 
    m.MFirst_Name + ' ' + m.MLast_Name AS Uye_Adi,
    c.City_Name AS Sehir,
    s.SFirst_Name + ' ' + s.SLast_Name AS Personel_Adi
FROM Members m
JOIN Cities c ON m.City_ID = c.City_ID
JOIN Staff s ON s.Staff_ID = c.City_ID; -- �ehir ve personel aras�nda hayali ili�ki

--Personel ve Pozisyonlar�n�n Say�s�

SELECT 
    p.Position_Name AS Pozisyon,
    COUNT(s.Staff_ID) AS Personel_Sayisi
FROM Positions p
LEFT JOIN Staff s ON p.Position_ID = s.Position_ID
GROUP BY p.Position_Name;


--1. Yeni bir �ye eklemek
INSERT INTO Members (MFirst_Name, MLast_Name, Membership_Date, MPhone_Number, Email, City_ID)
VALUES ('Ahmet', 'Kaya', '2025-02-01', '5331234567', 'ahmet.kaya@email.com', 3);
SELECT * FROM Members WHERE MFirst_Name = 'Ahmet' AND MLast_Name = 'Kaya';

--2. Yeni bir kitap eklemek
INSERT INTO Books (Title, ISBN, Publicition_Year, Publisher_ID, Book_Status, Genre_ID, Author_ID)
VALUES ('Yeni D�nya', '9789750800000', '2005-01-01', 2, 1, 3, 5);
select * from books where Title= 'Yeni D�nya' ;


--3. Yeni bir personel eklemek:
INSERT INTO Staff (SFirst_Name, SLast_Name, Position_ID, SPhone_Number)
VALUES ('Fatma', 'Y�lmaz', 4, '5321236789');
select * from staff where Position_ID = 4 ;

--4. Yeni bir �ehir eklemek:
INSERT INTO Cities (City_ID, City_Name)
VALUES (9, 'Trabzon');
SELECT City_Name FROM Cities WHERE City_Name LIKE 'T%';


--5. Yeni bir yazar eklemek:
INSERT INTO Authors (AFirst_Name, ALast_Name, ABirth_Date)
VALUES ('Elif', '�afak', '1971-10-25');
SELECT ABirth_Date,AFirst_Name from Authors WHERE ABirth_Date LIKE '1971-10-25';

--6. Yeni bir �d�n� alma eklemek:
INSERT INTO Borrowings (Book_ID, Member_ID, Borrow_Date, Due_Date, Return_Date, Staff_ID, Penalty_Amount)
VALUES
(32, 1, '2024-10-21', '2024-11-27', NULL, 11, 0), -- Kitap hen�z iade edilmedi
(33, 2, '2024-10-22', '2024-11-28', NULL, 12, 0), -- Kitap hen�z iade edilmedi
(40, 5, '2024-10-18', '2024-11-24', NULL, 14, 10); -- Hen�z kitap iade edilmedi
SELECT * FROM Borrowings WHERE Member_ID=1 OR Member_ID=2


-- Bir kitab�n durumunu (�d�n� al�nm�� m�?) g�ncellemek:
Select * from Books where Title = 'Yeni D�nya';
UPDATE Books
SET Book_Status = 0 -- �d�n� al�nm��
WHERE Title = 'Yeni D�nya';

--Bir personelin pozisyonunu g�ncellemek:
UPDATE Staff
SET Position_ID = 3 -- Yeni pozisyon
WHERE SFirst_Name = 'Fatma' AND SLast_Name = 'Y�lmaz';
Select * from staff WHERE SFirst_Name = 'Fatma' AND SLast_Name = 'Y�lmaz';

-- Bir yazar�n soyad�n� g�ncellemek:
UPDATE Authors
SET ALast_Name = '�afak-G�l'
WHERE AFirst_Name = 'Elif' AND ALast_Name = '�afak';
select * from authors where AFirst_Name = 'Elif';

--Bir �ehrin ad�n� d�zeltmek:
UPDATE Cities
SET City_Name = '�zmir'
WHERE City_ID = 3;
 select * from Cities where  City_ID = 3;

 --Bir Yazar�n Do�um Tarihini G�ncelleme
 UPDATE Authors
SET ABirth_Date = '1970-01-01'
WHERE AFirst_Name = 'Orhan' AND ALast_Name = 'Pamuk';
 select * from Authors where AFirst_Name = 'Orhan' AND ALast_Name = 'Pamuk';


 -- Bir �yeyi silmek:

 DELETE FROM Members
WHERE MFirst_Name = 'Ahmet' AND MLast_Name = 'Kaya';
SELECT * from members WHERE MFirst_Name = 'Ahmet' AND MLast_Name = 'Kaya';
 
 --kitab� silmek
 DELETE FROM Books
WHERE Title = 'Yeni D�nya' ;
 select * from books WHERE Title = 'Yeni D�nya';

 --Bir kitap silindi�inde, bu kitaba ait t�m cezalar�n da otomatik olarak silinmesi.

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
    SET Book_Status = 0 -- �d�n� al�nm��
    WHERE Book_ID IN (SELECT Book_ID FROM INSERTED);
END;
GO

--DROP TRIGGER trg_DeleteBookPenalties; GO

--DROP TRIGGER trg_UpdateBookStatus; GO


--  Kitaplar�n listesini ve yazar bilgilerini getiren Stored Procedure - 
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

-- View 1: T�rleri ve yazarlar� ile kitaplar�n listesi
CREATE VIEW BooksWithAuthorsGenres AS
SELECT 
    B.Title AS BookTitle,
    A.AFirst_Name + ' ' + A.ALast_Name AS AuthorName,
    G.Genre_Name AS Genre
FROM Books B
INNER JOIN Authors A ON B.Author_ID = A.Author_ID
INNER JOIN Genres G ON B.Genre_ID = G.Genre_ID;
GO


-- View 2: �yelerin ve �d�n� ald�klar� kitaplar�n listesi
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



-- View 3: Pozisyonlar� ile personel
CREATE VIEW StaffWithPositions AS
SELECT 
    S.SFirst_Name + ' ' + S.SLast_Name AS StaffName,
    P.Position_Name AS Position
FROM Staff S
INNER JOIN Positions P ON S.Position_ID = P.Position_ID;
GO



-- View 4: Cezal� �yeler
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


-- View 5: Yazarlar ve Kitaplar�
CREATE VIEW BooksAndAuthors AS
SELECT 
    Books.Title AS 'Kitap Ad�', 
    Authors.AFirst_Name AS 'Yazar Ad�', 
    Authors.ALast_Name AS 'Yazar Soyad�'
FROM Books
INNER JOIN Authors
ON Books.Author_ID = Authors.Author_ID;


-- EXCEPT Queries

-- 1. Kitap �d�n� alan ancak ceza almayan �yeler
SELECT Member_ID FROM Borrowings
EXCEPT
SELECT Member_ID FROM Penalties;

-- 2.�d�n� al�nan ancak iade edilmeyen kitaplar
SELECT Book_ID FROM Borrowings WHERE Return_Date IS NULL
EXCEPT
SELECT Book_ID FROM Borrowings WHERE Return_Date IS NOT NULL;

-- 3. Ceza alm�� ancak kitap �d�n� almam�� �yeler
SELECT Member_ID FROM Penalties
EXCEPT
SELECT Member_ID FROM Borrowings;
 
-- 4. Bir t�re ait olan ancak �d�n� al�nmayan kitaplar
SELECT Book_ID FROM Books
EXCEPT
SELECT Book_ID FROM Borrowings;

-- 5. G�reve atanan, ancak �d�n� kay�tlar� olmayan personel �yeleri
SELECT Staff_ID FROM Staff
EXCEPT
SELECT Staff_ID FROM Borrowings;

-- 6. �yeleri olan ancak bor�lanmayan �ehirler
SELECT City_ID FROM Members
EXCEPT
SELECT City_ID FROM Borrowings B
INNER JOIN Members M ON B.Member_ID = M.Member_ID;


select * from Members


select * from Members
select * from Borrowings


-- 7. Asla �d�n� al�nmayan kitaplara sahip yay�nc�lar
SELECT Publisher_ID FROM Books
EXCEPT
SELECT Publisher_ID FROM Borrowings B
INNER JOIN Books Bo ON B.Book_ID = Bo.Book_ID;

-- 8. K�t�phanede kitaplar� bulunan ancak �d�n� al�nmayan yazarlar
SELECT Author_ID FROM Books
EXCEPT
SELECT Author_ID FROM Borrowings B
INNER JOIN Books Bo ON B.Book_ID = Bo.Book_ID;

 --ky--

 --Kitaplar�n Yazar �simleriyle Listelenmesi 
SELECT 
    b.Title AS Book_Title, 
    a.AFirst_Name AS Author_First_Name, 
    a.ALast_Name AS Author_Last_Name
FROM 
    Books b
JOIN 
    Authors a ON b.Author_ID = a.Author_ID; 

--Kitaplar ve Yazarlar aras�ndaki ili�kiyi listelemek i�in Authors ve Books tablolar�n� birle�tirir.
SELECT 
    B.Title, 
    A.AFirst_Name, 
    A.ALast_Name 
FROM 
    Books B
JOIN 
	Authors A ON B.Author_ID = A.Author_ID

--Kitap T�rlerini ve Yay�nc� �simlerini Listeleme 
SELECT 
    g.Genre_Name AS Genre, 
    p.Publisher_Name AS Publisher
FROM 
    Books b
JOIN 
    Genres g ON b.Genre_ID = g.Genre_ID
JOIN 
    Publishers p ON b.Publisher_ID = p.Publisher_ID;

--Her yazar�n ka� kitab� oldu�unu ��renmek i�in Books ve Authors tablolar�n� grupland�rarak yazar baz�nda kitap say�s�n� listeler.

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

--EXISTS kullanarak cezal� �yeleri listeleme

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

--IN: Belirli Bir �ehirdeki �yelerin Listesi 
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

--UNION: Farkl� �ehirlerdeki Personel ve �yeleri Listeleme 
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


--INTERSECT: Ceza Alm�� �yelerin Listesi 
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

--1. Members Tablosu i�in Telefon Numaras� �ndeksi:
CREATE INDEX idx_members_phone_number ON Members(MPhone_Number);
--2. Penalties Tablosu i�in Ceza Durumu ve �ye Kimli�i �ndeksi:
CREATE INDEX idx_penalties_status_member ON Penalties(Penalty_Status, Member_ID);
--3. Authors Tablosu i�in Yazar Ad� ve Soyad� �ndeksi:
CREATE INDEX idx_authors_full_name ON Authors(AFirst_Name, ALast_Name);
--4. Borrowings Tablosu i�in �ye ve Kitap �ndeksi:
CREATE INDEX idx_borrowings_member_book ON Borrowings(Member_ID, Book_ID);
--5. Publishers Tablosu i�in Yay�nevi Ad� �ndeksi:
CREATE INDEX idx_publishers_name ON Publishers(Publisher_Name);


--Kitaplar� belirli bir t�re g�re listeleyen stored procedure kodu 
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
--�yelerin ald�klar� kitap say�s�n� ve toplam gecikme cezalar�n� hesaplay�p bu �yelerden toplam ceza miktar� 5 TL den fazla olanlar
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


--Her yay�nc�n�n yay�nlad��� kitap say�s�n� g�steren bir sorgu:
SELECT 
    P.Publisher_Name,
    COUNT(B.Book_ID) AS Total_Books
FROM 
    Publishers P
INNER JOIN Books B ON P.Publisher_ID = B.Publisher_ID
GROUP BY 
    P.Publisher_Name


--Her t�rdeki kitaplar�n mevcut durumu ve toplam say�s�:
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

--Her personelin kontrol etti�i kitap say�s�n� listeleyen bir sorgu:
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

--hangi ilden daha �ok �ye oldu�unu g�steren select sorgusu
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

--Borcu Olanlar�n Hangi �llerde Oturdu�u
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


--Her �ehirde Ka� �ye Oldu�unu ve Toplam Ceza Miktar�n� G�steren Sorgu
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


--Hangi Yazar Daha �ok Kitap Yazm��
SELECT
A.AFirst_Name +' ' +A.ALast_Name AS Author_Name,
COUNT(B.Book_ID) AS Total_Books_Written
FROM Authors A
INNER JOIN Books B ON A.Author_ID = B.Author_ID
GROUP BY
A.AFirst_Name, A.ALast_Name
ORDER BY
Total_Books_Written ASC;

--Kitab�n �d�n� al�nma, kitap durumunun g�ncellenmesi ve �d�n� alma kayd�n�n eklenmesini i�eren transaction
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
        	THROW 50001, 'Kitap zaten �d�n�te.', 1;
    	END
    	INSERT INTO Borrowings (Book_ID, Member_ID, Borrow_Date, Due_Date, Staff_ID)
    	VALUES (@BookID, @MemberID, @BorrowDate, @DueDate, @StaffID);
    	COMMIT TRANSACTION;
    	PRINT 'Kitap �d�n� alma i�lemi ba�ar�l� bir �ekilde tamamland�.';
	END TRY
	BEGIN CATCH
    	ROLLBACK TRANSACTION;
    	PRINT 'Hata olu�tu: ��lem geri al�nd�.';
    	THROW; 
	END CATCH
END;
