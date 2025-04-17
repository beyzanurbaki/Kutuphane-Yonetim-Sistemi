1. Kapsam Tanımı
Kütüphane yönetim sistemi, kitap envanterinin dijital olarak takibi, kullanıcı hesaplarının yönetimi, ödünç alma ve iade süreçlerinin izlenmesi, cezai işlemlerin kaydedilmesi gibi temel işlemleri kapsar.
Kütüphane üyeleri kitapların durumunu kontrol edebilir, işlem geçmişlerini görebilir. Personel envanteri ve kullanıcıları yönetebilir.

1.1 Sistem Gereksinimleri
Kullanıcılar kayıt olabilir ve giriş yapabilir.

Her bir kitaptan yalnızca bir adet bulunur.

Kitap bilgileri sisteme kaydedilir.

Ödünç alma/iade işlemleri kayıt altına alınır.

Kullanıcı işlem geçmişi görüntülenebilir.

Personel kitap ekleyip silebilir.

1.2 Ana Kısıtlar
Veri Tutarlılığı
Aynı kitap birden fazla kişiye aynı anda verilemez.

Uyumluluk
Sistem webde kullanılabilir.

Ceza Sistemi
Cezası olan kullanıcı kitap alamaz.

30 günü geçen iadelerde her gün için 5 TL ceza.

Veritabanı Kısıtları
Kitap sadece 1 türe ve yazara ait olabilir.

İadesi yapılmamış kitap varken yeni kitap alınamaz.

1.3 Kavramsal Tasarım
Varlıklar:

Üyeler (Members)

Kitaplar (Books)

Yazarlar (Authors)

Türler (Genres)

İşlem Geçmişi (Borrowings)

Personel (Staff)

Cezalar (Penalties)

Şehirler (Cities)

Yayınevleri (Publishers)

Pozisyonlar (Positions)

(Her bir varlığın detaylarını da madde madde yazdığın gibi ekleyebiliriz.)

1.4 Potansiyel Kullanıcılar
Kütüphane Personeli: Envanter ve raporlama işlemleri

Yönetim: Sistem denetimi ve genel raporlar
