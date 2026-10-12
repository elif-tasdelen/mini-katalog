# Mini Katalog Uygulaması

Software Persona Mesleki Gelişim Programı – **Mobil Uygulama Geliştirme; Android / iOS** eğitimi kapsamında Flutter ile geliştirilen mini ürün katalog uygulamasıdır.

## Kısa Açıklama

Uygulamada ürünler bir REST API'den çekilerek GridView ile listelenir. Ürüne tıklandığında detay sayfası açılır ve ürün sepete eklenebilir. Sepet sayfasında eklenen ürünler görüntülenir ve sepetten çıkarılabilir. Sepet işlemleri simülasyon amaçlıdır.

**Özellikler**
- Ana sayfa: arama ile filtreleme, banner, GridView ile ürün kartları
- Ürün detay sayfası: görsel, açıklama, özellikler, fiyat, sepete ekleme
- Sepet sayfası: ürün listeleme, ürün çıkarma, boş sepet ekranı
- Named Routes ve Route Arguments ile sayfalar arası veri taşıma
- JSON verisinin model sınıfına (fromJson / toJson) dönüştürülmesi
- İnternet bağlantısı olmadığında `assets/data/products.json` dosyasından yerel veri okuma
- Asset yönetimi (görsel ve JSON)

**Veri Kaynakları (eğitim ve demo amaçlı)**
- Ürün verileri: https://wantapi.com/products.php
- Banner görseli: https://wantapi.com/assets/banner.png

## Kullanılan Flutter Sürümü

Flutter FLUTTER_SURUMU (Dart DART_SURUMU)

## Proje Yapısı

```
lib/
├── main.dart
├── components/   # Tekrar kullanılan arayüz parçaları
├── models/       # Ürün modeli ve route argümanları
├── services/     # API servisi
└── views/        # Ana sayfa, ürün detay, sepet
assets/
├── images/
└── data/
```

## Çalıştırma Adımları

```bash
git clone https://github.com/elif-tasdelen/mini-katalog.git
cd mini-katalog
flutter pub get
flutter run
```

## Ekran Görüntüleri

| Ana Sayfa | Ürün Detay | Sepet | Boş Sepet |
|---|---|---|---|
| ![Ana Sayfa](screenshots/home.png) | ![Ürün Detay](screenshots/detail.png) | ![Sepet](screenshots/cart.png) | ![Boş Sepet](screenshots/empty_cart.png) |
