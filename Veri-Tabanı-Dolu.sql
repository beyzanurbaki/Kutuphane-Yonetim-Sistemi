USE Kutuphane_Yonetim_Sistemi

INSERT INTO Genres (Genre_Name) VALUES
('Roman'),('Hikaye'),('Bilim Kurgu'),('Fantastik'),('Polisiye'),('Gerilim'),('Dram'),('Tarih'),('Biyografi'),
('Korku'),('Edebiyat'),('Macera'),('Psikoloji'),('Felsefe'),('Deneme');

INSERT INTO Positions (Position_Name)
VALUES
('Kütüphane Müdürü'),('Müdür Yardýmcýsý'),('Kütüphaneci'),
('Bilgi Teknolojileri Sorumlusu'),('Teknik Hizmetler Uzmaný'),('Danýþma Görevlisi'),('Temizlik Görevlisi'),
('Güvenlik Görevlisi');

INSERT INTO Staff (SFirst_Name, SLast_Name, Position_ID, SPhone_Number)
VALUES
('Burak', 'Aslan', 1, '5311234567'),('Mehmet', 'Kaya', 2, '5322345678'),('Ayþe', 'Demir', 3, '5333456789'),
('Fatma', 'Þahin', 4, '5344567890'),('Ali', 'Çelik', 5, '5355678901'),('Emine', 'Koç', 6, '5366789012'),
('Hüseyin', 'Arslan', 7, '5377890123'),('Zeynep', 'Öztürk', 8, '5388901234'),('Elif', 'Aksoy', 7, '5310123456'),
('Merve', 'Erdoðan', 2, '5332345678'),('Halil', 'Güneþ', 3, '5343456789'),('Hatice', 'Bal', 3, '5354567890'),
('Cem', 'Uslu', 3, '5365678901'),('Büþra', 'Aydýn', 3, '5376789012'),('Osman', 'Tekin', 4, '5387890123'),
('Sevgi', 'Eren', 6, '5398901234'),('Serkan', 'Gür', 8, '5319012345');

INSERT INTO Cities VALUES 
('01', 'Adana'), ('02', 'Adýyaman'), ('03', 'Afyon'), ('04', 'Aðrý'), ('05', 'Amasya'), ('06', 'Ankara'), ('07', 'Antalya'), ('08', 'Artvin'), ('09', 'Aydýn'), ('10', 'Balýkesir'), 
('11', 'Bilecik'), ('12', 'Bingöl'), ('13', 'Bitlis'), ('14', 'Bolu'), ('15', 'Burdur'), ('16', 'Bursa'), ('17', 'Çanakkale'), ('18', 'Çankýrý'), ('19', 'Çorum'), ('20', 'Denizli'), 
('21', 'Diyarbakýr'), ('22', 'Edirne'), ('23', 'Elazýð'), ('24', 'Erzincan'), ('25', 'Erzurum'), ('26', 'Eskiþehir'), ('27', 'Gaziantep'), ('28', 'Giresun'), ('29', 'Gümüþhane'), ('30', 'Hakkari'), 
('31', 'Hatay'), ('32', 'Isparta'), ('33', 'Mersin'), ('34', 'Ýstanbul'), ('35', 'Ýzmir'), ('36', 'Kars'), ('37', 'Kastamonu'), ('38', 'Kayseri'), ('39', 'Kýrklareli'), ('40', 'Kýrþehir'), 
('41', 'Kocaeli'), ('42', 'Konya'), ('43', 'Kütahya'), ('44', 'Malatya'), ('45', 'Manisa'), ('46', 'K.Maraþ'), ('47', 'Mardin'), ('48', 'Muðla'), ('49', 'Muþ'), ('50', 'Nevþehir'), 
('51', 'Niðde'), ('52', 'Ordu'), ('53', 'Rize'), ('54', 'Sakarya'), ('55', 'Samsun'), ('56', 'Siirt'), ('57', 'Sinop'), ('58', 'Sivas'), ('59', 'Tekirdað'), ('60', 'Tokat'), 
('61', 'Trabzon'), ('62', 'Tunceli'), ('63', 'Þanlýurfa'), ('64', 'Uþak'), ('65', 'Van'), ('66', 'Yozgat'), ('67', 'Zonguldak'), ('68', 'Aksaray'), ('69', 'Bayburt'), ('70', 'Karaman'), 
('71', 'Kýrýkkale'), ('72', 'Batman'), ('73', 'Þýrnak'), ('74', 'Bartýn'), ('75', 'Ardahan'), ('76', 'Iðdýr'), ('77', 'Yalova'), ('78', 'Karabük'), ('79', 'Kilis'), ('80', 'Osmaniye'), ('81', 'Düzce');


INSERT INTO Authors (AFirst_Name, ALast_Name, ABirth_Date) VALUES
('Orhan', 'Pamuk', '1952-06-07'), ('Yaþar', 'Kemal', '1923-10-06'), ('Nazým', 'Hikmet', '1902-01-15'), ('Sabahattin', 'Ali', '1907-02-25'),
('Halide Edib', 'Adývar', '1884-06-09'), ('Reþat Nuri', 'Güntekin', '1889-11-25'), ('Peyami', 'Safa', '1899-04-02'), ('Zülfü', 'Livaneli', '1946-06-20'),
('Ahmet', 'Hamdi Tanpýnar', '1901-06-23'), ('Cahit', 'Sýtký Tarancý', '1910-10-04'), ('Oðuz', 'Atay', '1934-10-12'), ('Ýlber', 'Ortaylý', '1947-05-21'),
('Halit', 'Ziya Uþaklýgil', '1866-02-06');

INSERT INTO Publishers (Publisher_Name, PPhone_Number) VALUES
('Ýthaki Yayýnlarý', '2121234567'),
('Doðan Kitap', '2162345678'),
('Kültür Yayýnlarý', '2123456789'),
('Yapý Kredi Yayýnlarý', '2124567890'),
('Everest Yayýnlarý', '2125678901'),
('Panama Yayýncýlýk', '2166789012'),
('Ýþ Bankasý Kültür Yayýnlarý', '2127890123'),
('Sel Yayýncýlýk', '2128901234'),
('Altýn Kitaplar', '2169012345'),
('Timaþ Yayýnlarý', '2120123456');

INSERT INTO Members (MFirst_Name, MLast_Name, Membership_Date, MPhone_Number, Email, City_ID) VALUES
('Ali', 'Yýlmazer', '2025-01-01', '5434567890', 'ali.yilmaz@email.com', 1),
('Ayþe', 'Kaya', '2025-01-02', '5321234567', 'ayse.kaya@email.com', 1),
('Mehmet', 'Demir', '2025-01-03', '5369876543', 'mehmet.demir@email.com', 3),
('Fatma', 'Çelik', '2025-01-04', '5412345678', 'fatma.celik@email.com', 4),
('Hakan', 'Aydýn', '2025-01-05', '5056789012', 'hakan.aydin@email.com', 5),
('Zeynep', 'Öztürk', '2025-01-06', '5312345678', 'zeynep.ozturk@email.com', 6),
('Kemal', 'Yýlmaz', '2025-01-07', '5052345678', 'kemal.yilmaz@email.com', 7),
('Elif', 'Þahin', '2025-01-08', '5541234567', 'elif.sahin@email.com', 8),
('Murat', 'Kurt', '2025-01-09', '5333456789', 'murat.kurt@email.com', 9),
('Burcu', 'Büyük', '2025-01-10', '5559876543', 'burcu.buyuk@email.com', 10);

INSERT INTO Books (Title, ISBN, Publicition_Year, Publisher_ID, Book_Status, Genre_ID, Author_ID) VALUES
('Kara Kitap', '9789750726676', '1990-01-01', 1, 1, 1, 1),  -- Roman
('Ýnce Memed', '9789758425296', '1955-01-01', 2, 1, 1, 2),  -- Roman
('Ýstanbul Hatýralarý', '9786051422812', '2012-01-01', 3, 1, 2, 3),  -- Hikaye
('Madonna', '9789753122211', '1943-01-01', 4, 1, 2, 4),  -- Hikaye
('Aþk', '9789750702617', '2009-01-01', 5, 1, 3, 5),  -- Bilim Kurgu
('Çalýkuþu', '9789751415175', '1922-01-01', 6, 1, 4, 6),  -- Fantastik
('Yalnýzýz', '9789750700965', '1949-01-01', 7, 1, 5, 7),  -- Polisiye
('Bir Düðün Gecesi', '9789750707408', '2000-01-01', 8, 1, 6, 8),  -- Gerilim
('Saatleri Ayarlama Enstitüsü', '9789750800871', '1961-01-01', 9, 1, 7, 9),  -- Dram
('Körlük', '9788535912738', '1995-01-01', 10, 1, 10, 10),  -- Korku
('Fahrenheit 451', '9780679405158', '1953-01-01', 1, 1, 3, 11),  -- Bilim Kurgu
('Savaþ ve Barýþ', '9780198800543', '1869-01-01', 2, 1, 8, 12),  -- Tarih
('Don Kiþot', '9788401600498', '1605-01-01', 3, 1, 11, 13),  -- Edebiyat
('Büyük Umutlar', '9780141439563', '1861-01-01', 4, 1, 11, 1),  -- Edebiyat
('1984', '9780451524935', '1949-01-01', 5, 1, 3, 2),  -- Bilim Kurgu
('Beyaz Zambaklar Ülkesi', '9789753136127', '1940-01-01', 6, 1, 8, 3),  -- Tarih
('Ýki Þehrin Hikayesi', '9781853261190', '1859-01-01', 7, 1, 2, 4),  -- Hikaye
('Küçük Prens', '9780156012195', '1943-01-01', 8, 1, 12, 5),  -- Macera
('Yüzyýllýk Yalnýzlýk', '9780060883287', '1967-01-01', 9, 1, 1, 6),  -- Roman
('Çift Baþlý Kartal', '9780385518594', '2003-01-01', 10, 1, 5, 7),  -- Polisiye
('Kayýp Zamanýn Peþinde', '9780375761397', '2001-01-01', 1, 1, 7, 8),  -- Dram
('Karanlýkta', '9780805090497', '2006-01-01', 2, 1, 10, 9),  -- Korku
('Serenad', '9786052036027', '2011-01-01', 3, 1, 6, 10),  -- Gerilim
('Rüzgarýn Gölgesi', '9789750706066', '2004-01-01', 4, 1, 2, 11),  -- Hikaye
('Tutunamayanlar', '9789750715336', '1972-01-01', 5, 1, 1, 12);  -- Roman


INSERT INTO Borrowings (Book_ID, Member_ID, Borrow_Date, Due_Date, Return_Date, Staff_ID, Penalty_Amount) VALUES
(21, 1, '2024-10-10', '2024-11-15', '2024-11-14', 11, 0), -- Kitap zamanýnda iade edildi
(22, 1, '2024-10-11', '2024-11-16', '2024-11-17', 11, 5), -- 1 gün geç iade
(23, 2, '2024-10-12', '2024-11-17', '2024-11-19', 11, 10), -- 2 gün geç iade
(24, 3, '2024-10-13', '2024-11-19', '2024-11-20', 11, 5), -- 1 gün geç iade
(25, 4, '2024-10-14', '2024-11-20', '2024-11-20', 11, 0), -- Kitap zamanýnda iade edildi
(26, 5, '2024-10-15', '2024-11-21', '2024-11-22', 12, 0), -- Kitap zamanýnda iade edildi
(27, 6, '2024-10-16', '2024-11-22', '2024-11-23', 13, 5), -- 1 gün geç iade
(28, 7, '2024-10-17', '2024-11-23', '2024-11-24', 13, 0), -- Kitap zamanýnda iade edildi
(29, 8, '2024-10-18', '2024-11-24', '2024-11-25', 14, 5), -- 1 gün geç iade
(30, 9, '2024-10-19', '2024-11-25', '2024-11-26', 12, 5), -- 1 gün geç iade
(31, 10, '2024-10-20', '2024-11-26', '2024-11-27', 11, 0); -- Kitap zamanýnda iade edildi


INSERT INTO Penalties (Member_ID, Book_ID, Due_Date, Return_Date, Penalty_Amount, Penalty_Status) VALUES
(1, 22, '2024-11-16', '2024-11-17', 5.00, 1), -- 1 gün geç iade, 1*5 = 5 ceza
(2, 23, '2024-11-17', '2024-11-19', 10.00, 1), -- 2 gün geç iade, 2*5 = 10 ceza
(3, 24, '2024-11-19', '2024-11-20', 5.00, 1), -- 1 gün geç iade, 1*5 = 5 ceza
(6, 27, '2024-11-22', '2024-11-23', 5.00, 1), -- 1 gün geç iade, 1*5 = 5 ceza
(8, 29, '2024-11-24', '2024-11-25', 5.00, 1), -- 1 gün geç iade, 1*5 = 5 ceza
(9, 30, '2024-11-25', '2024-11-26', 5.00, 1); -- 1 gün geç iade, 1*5 = 5 ceza




