USE Kutuphane_Yonetim_Sistemi

INSERT INTO Genres (Genre_Name) VALUES
('Roman'),('Hikaye'),('Bilim Kurgu'),('Fantastik'),('Polisiye'),('Gerilim'),('Dram'),('Tarih'),('Biyografi'),
('Korku'),('Edebiyat'),('Macera'),('Psikoloji'),('Felsefe'),('Deneme');

INSERT INTO Positions (Position_Name)
VALUES
('K�t�phane M�d�r�'),('M�d�r Yard�mc�s�'),('K�t�phaneci'),
('Bilgi Teknolojileri Sorumlusu'),('Teknik Hizmetler Uzman�'),('Dan��ma G�revlisi'),('Temizlik G�revlisi'),
('G�venlik G�revlisi');

INSERT INTO Staff (SFirst_Name, SLast_Name, Position_ID, SPhone_Number)
VALUES
('Burak', 'Aslan', 1, '5311234567'),('Mehmet', 'Kaya', 2, '5322345678'),('Ay�e', 'Demir', 3, '5333456789'),
('Fatma', '�ahin', 4, '5344567890'),('Ali', '�elik', 5, '5355678901'),('Emine', 'Ko�', 6, '5366789012'),
('H�seyin', 'Arslan', 7, '5377890123'),('Zeynep', '�zt�rk', 8, '5388901234'),('Elif', 'Aksoy', 7, '5310123456'),
('Merve', 'Erdo�an', 2, '5332345678'),('Halil', 'G�ne�', 3, '5343456789'),('Hatice', 'Bal', 3, '5354567890'),
('Cem', 'Uslu', 3, '5365678901'),('B��ra', 'Ayd�n', 3, '5376789012'),('Osman', 'Tekin', 4, '5387890123'),
('Sevgi', 'Eren', 6, '5398901234'),('Serkan', 'G�r', 8, '5319012345');

INSERT INTO Cities VALUES 
('01', 'Adana'), ('02', 'Ad�yaman'), ('03', 'Afyon'), ('04', 'A�r�'), ('05', 'Amasya'), ('06', 'Ankara'), ('07', 'Antalya'), ('08', 'Artvin'), ('09', 'Ayd�n'), ('10', 'Bal�kesir'), 
('11', 'Bilecik'), ('12', 'Bing�l'), ('13', 'Bitlis'), ('14', 'Bolu'), ('15', 'Burdur'), ('16', 'Bursa'), ('17', '�anakkale'), ('18', '�ank�r�'), ('19', '�orum'), ('20', 'Denizli'), 
('21', 'Diyarbak�r'), ('22', 'Edirne'), ('23', 'Elaz��'), ('24', 'Erzincan'), ('25', 'Erzurum'), ('26', 'Eski�ehir'), ('27', 'Gaziantep'), ('28', 'Giresun'), ('29', 'G�m��hane'), ('30', 'Hakkari'), 
('31', 'Hatay'), ('32', 'Isparta'), ('33', 'Mersin'), ('34', '�stanbul'), ('35', '�zmir'), ('36', 'Kars'), ('37', 'Kastamonu'), ('38', 'Kayseri'), ('39', 'K�rklareli'), ('40', 'K�r�ehir'), 
('41', 'Kocaeli'), ('42', 'Konya'), ('43', 'K�tahya'), ('44', 'Malatya'), ('45', 'Manisa'), ('46', 'K.Mara�'), ('47', 'Mardin'), ('48', 'Mu�la'), ('49', 'Mu�'), ('50', 'Nev�ehir'), 
('51', 'Ni�de'), ('52', 'Ordu'), ('53', 'Rize'), ('54', 'Sakarya'), ('55', 'Samsun'), ('56', 'Siirt'), ('57', 'Sinop'), ('58', 'Sivas'), ('59', 'Tekirda�'), ('60', 'Tokat'), 
('61', 'Trabzon'), ('62', 'Tunceli'), ('63', '�anl�urfa'), ('64', 'U�ak'), ('65', 'Van'), ('66', 'Yozgat'), ('67', 'Zonguldak'), ('68', 'Aksaray'), ('69', 'Bayburt'), ('70', 'Karaman'), 
('71', 'K�r�kkale'), ('72', 'Batman'), ('73', '��rnak'), ('74', 'Bart�n'), ('75', 'Ardahan'), ('76', 'I�d�r'), ('77', 'Yalova'), ('78', 'Karab�k'), ('79', 'Kilis'), ('80', 'Osmaniye'), ('81', 'D�zce');


INSERT INTO Authors (AFirst_Name, ALast_Name, ABirth_Date) VALUES
('Orhan', 'Pamuk', '1952-06-07'), ('Ya�ar', 'Kemal', '1923-10-06'), ('Naz�m', 'Hikmet', '1902-01-15'), ('Sabahattin', 'Ali', '1907-02-25'),
('Halide Edib', 'Ad�var', '1884-06-09'), ('Re�at Nuri', 'G�ntekin', '1889-11-25'), ('Peyami', 'Safa', '1899-04-02'), ('Z�lf�', 'Livaneli', '1946-06-20'),
('Ahmet', 'Hamdi Tanp�nar', '1901-06-23'), ('Cahit', 'S�tk� Taranc�', '1910-10-04'), ('O�uz', 'Atay', '1934-10-12'), ('�lber', 'Ortayl�', '1947-05-21'),
('Halit', 'Ziya U�akl�gil', '1866-02-06');

INSERT INTO Publishers (Publisher_Name, PPhone_Number) VALUES
('�thaki Yay�nlar�', '2121234567'),
('Do�an Kitap', '2162345678'),
('K�lt�r Yay�nlar�', '2123456789'),
('Yap� Kredi Yay�nlar�', '2124567890'),
('Everest Yay�nlar�', '2125678901'),
('Panama Yay�nc�l�k', '2166789012'),
('�� Bankas� K�lt�r Yay�nlar�', '2127890123'),
('Sel Yay�nc�l�k', '2128901234'),
('Alt�n Kitaplar', '2169012345'),
('Tima� Yay�nlar�', '2120123456');

INSERT INTO Members (MFirst_Name, MLast_Name, Membership_Date, MPhone_Number, Email, City_ID) VALUES
('Ali', 'Y�lmazer', '2025-01-01', '5434567890', 'ali.yilmaz@email.com', 1),
('Ay�e', 'Kaya', '2025-01-02', '5321234567', 'ayse.kaya@email.com', 1),
('Mehmet', 'Demir', '2025-01-03', '5369876543', 'mehmet.demir@email.com', 3),
('Fatma', '�elik', '2025-01-04', '5412345678', 'fatma.celik@email.com', 4),
('Hakan', 'Ayd�n', '2025-01-05', '5056789012', 'hakan.aydin@email.com', 5),
('Zeynep', '�zt�rk', '2025-01-06', '5312345678', 'zeynep.ozturk@email.com', 6),
('Kemal', 'Y�lmaz', '2025-01-07', '5052345678', 'kemal.yilmaz@email.com', 7),
('Elif', '�ahin', '2025-01-08', '5541234567', 'elif.sahin@email.com', 8),
('Murat', 'Kurt', '2025-01-09', '5333456789', 'murat.kurt@email.com', 9),
('Burcu', 'B�y�k', '2025-01-10', '5559876543', 'burcu.buyuk@email.com', 10);

INSERT INTO Books (Title, ISBN, Publicition_Year, Publisher_ID, Book_Status, Genre_ID, Author_ID) VALUES
('Kara Kitap', '9789750726676', '1990-01-01', 1, 1, 1, 1),  -- Roman
('�nce Memed', '9789758425296', '1955-01-01', 2, 1, 1, 2),  -- Roman
('�stanbul Hat�ralar�', '9786051422812', '2012-01-01', 3, 1, 2, 3),  -- Hikaye
('Madonna', '9789753122211', '1943-01-01', 4, 1, 2, 4),  -- Hikaye
('A�k', '9789750702617', '2009-01-01', 5, 1, 3, 5),  -- Bilim Kurgu
('�al�ku�u', '9789751415175', '1922-01-01', 6, 1, 4, 6),  -- Fantastik
('Yaln�z�z', '9789750700965', '1949-01-01', 7, 1, 5, 7),  -- Polisiye
('Bir D���n Gecesi', '9789750707408', '2000-01-01', 8, 1, 6, 8),  -- Gerilim
('Saatleri Ayarlama Enstit�s�', '9789750800871', '1961-01-01', 9, 1, 7, 9),  -- Dram
('K�rl�k', '9788535912738', '1995-01-01', 10, 1, 10, 10),  -- Korku
('Fahrenheit 451', '9780679405158', '1953-01-01', 1, 1, 3, 11),  -- Bilim Kurgu
('Sava� ve Bar��', '9780198800543', '1869-01-01', 2, 1, 8, 12),  -- Tarih
('Don Ki�ot', '9788401600498', '1605-01-01', 3, 1, 11, 13),  -- Edebiyat
('B�y�k Umutlar', '9780141439563', '1861-01-01', 4, 1, 11, 1),  -- Edebiyat
('1984', '9780451524935', '1949-01-01', 5, 1, 3, 2),  -- Bilim Kurgu
('Beyaz Zambaklar �lkesi', '9789753136127', '1940-01-01', 6, 1, 8, 3),  -- Tarih
('�ki �ehrin Hikayesi', '9781853261190', '1859-01-01', 7, 1, 2, 4),  -- Hikaye
('K���k Prens', '9780156012195', '1943-01-01', 8, 1, 12, 5),  -- Macera
('Y�zy�ll�k Yaln�zl�k', '9780060883287', '1967-01-01', 9, 1, 1, 6),  -- Roman
('�ift Ba�l� Kartal', '9780385518594', '2003-01-01', 10, 1, 5, 7),  -- Polisiye
('Kay�p Zaman�n Pe�inde', '9780375761397', '2001-01-01', 1, 1, 7, 8),  -- Dram
('Karanl�kta', '9780805090497', '2006-01-01', 2, 1, 10, 9),  -- Korku
('Serenad', '9786052036027', '2011-01-01', 3, 1, 6, 10),  -- Gerilim
('R�zgar�n G�lgesi', '9789750706066', '2004-01-01', 4, 1, 2, 11),  -- Hikaye
('Tutunamayanlar', '9789750715336', '1972-01-01', 5, 1, 1, 12);  -- Roman


INSERT INTO Borrowings (Book_ID, Member_ID, Borrow_Date, Due_Date, Return_Date, Staff_ID, Penalty_Amount) VALUES
(21, 1, '2024-10-10', '2024-11-15', '2024-11-14', 11, 0), -- Kitap zaman�nda iade edildi
(22, 1, '2024-10-11', '2024-11-16', '2024-11-17', 11, 5), -- 1 g�n ge� iade
(23, 2, '2024-10-12', '2024-11-17', '2024-11-19', 11, 10), -- 2 g�n ge� iade
(24, 3, '2024-10-13', '2024-11-19', '2024-11-20', 11, 5), -- 1 g�n ge� iade
(25, 4, '2024-10-14', '2024-11-20', '2024-11-20', 11, 0), -- Kitap zaman�nda iade edildi
(26, 5, '2024-10-15', '2024-11-21', '2024-11-22', 12, 0), -- Kitap zaman�nda iade edildi
(27, 6, '2024-10-16', '2024-11-22', '2024-11-23', 13, 5), -- 1 g�n ge� iade
(28, 7, '2024-10-17', '2024-11-23', '2024-11-24', 13, 0), -- Kitap zaman�nda iade edildi
(29, 8, '2024-10-18', '2024-11-24', '2024-11-25', 14, 5), -- 1 g�n ge� iade
(30, 9, '2024-10-19', '2024-11-25', '2024-11-26', 12, 5), -- 1 g�n ge� iade
(31, 10, '2024-10-20', '2024-11-26', '2024-11-27', 11, 0); -- Kitap zaman�nda iade edildi


INSERT INTO Penalties (Member_ID, Book_ID, Due_Date, Return_Date, Penalty_Amount, Penalty_Status) VALUES
(1, 22, '2024-11-16', '2024-11-17', 5.00, 1), -- 1 g�n ge� iade, 1*5 = 5 ceza
(2, 23, '2024-11-17', '2024-11-19', 10.00, 1), -- 2 g�n ge� iade, 2*5 = 10 ceza
(3, 24, '2024-11-19', '2024-11-20', 5.00, 1), -- 1 g�n ge� iade, 1*5 = 5 ceza
(6, 27, '2024-11-22', '2024-11-23', 5.00, 1), -- 1 g�n ge� iade, 1*5 = 5 ceza
(8, 29, '2024-11-24', '2024-11-25', 5.00, 1), -- 1 g�n ge� iade, 1*5 = 5 ceza
(9, 30, '2024-11-25', '2024-11-26', 5.00, 1); -- 1 g�n ge� iade, 1*5 = 5 ceza




