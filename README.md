# 📱 iVent Trial - Flutter & GetX Projesi

Bu proje, **GetX mimarisi** kullanarak modern bir Flutter uygulaması geliştirme amacıyla oluşturulmuş bir **trial** projesidir. Proje, event (etkinlik) yönetimi temalı bir uygulama olacak şekilde tasarlanmıştır.

## 🎯 Proje Amacı

`iVent UI` klasöründeki tasarım görselleri baz alınarak, **GetX mimarisi** ve verilen dökümanlar yardımıyla modern bir Flutter uygulaması geliştirilmesi amaçlanmaktadır.

### 📋 Proje Gereksinimleri
- **4 adet sayfa** tasarımının implementasyonu
- **GetX mimarisi** kullanımı (Controller, View, Bindings, Routes)
- Responsive ve modern UI/UX tasarımı
- Temiz kod yapısı ve organizasyonu

## 🛠️ Kullanılan Teknolojiler

### 🔧 Ana Framework
- **Flutter SDK**: ^3.8.1
- **Dart**: Minimum 3.8.1

### 📦 Temel Paketler

#### State Management & Architecture
- **get**: ^4.7.2 - GetX state management, routing ve dependency injection için

#### UI & Assets
- **flutter_svg**: ^2.2.0 - SVG icon desteği için

#### Development
- **flutter_test**: Testing framework
- **flutter_lints**: ^5.0.0 - Kod kalitesi ve linting kuralları

## 🏗️ GetX Mimarisi

Proje, **GetX mimarisi** kullanarak aşağıdaki yapıyı benimser:

### 📱 Kullanılacak GetX Bileşenleri
- `GetMaterialApp()` - Ana uygulama wrapper'ı
- `GetView<>` - Sayfalarda StatefulWidget yerine tercih edilecek
- `Obs()` - Reactive state management
- **GetX Bindings** - Dependency injection
- **GetX Routes** - Routing yönetimi  
- **GetX Controller** - Business logic yönetimi

### 🎨 Hybrid Approach
- **Sayfa yapısı**: `GetView` kullanılacak
- **Widget bileşenleri**: Gerektiğinde `StatefulWidget` veya `StatelessWidget` kullanılabilir
- **Amaç**: GetX mantığını öğrenmek ve pratik yapmak

## 📁 Proje Yapısı

```
lib/
├── constants/              # Sabit değerler ve konfigürasyonlar
│   ├── app_assets.dart     # Asset path'leri
│   ├── app_colors.dart     # Renk paleti
│   ├── app_text_styles.dart # Tipografi stilleri
│   └── hobbies.dart        # Hobi kategorileri data'sı
├── core/                   # Core fonksiyonaliteler
│   ├── enums/             # Enum tanımlamaları
│   │   ├── app_icons.dart # SVG icon enum'ları
│   │   └── usage_example.dart # Kullanım örnekleri
│   └── index.dart         # Core exports
└── main.dart              # Uygulama giriş noktası
```

### 🎨 Design System

#### Renkler (AppColors)
- **Primary**: `#01AEBE` - Marka ana rengi
- **Neutral Palette**: Kapsamlı gri tonları (50-900)
- **Text Colors**: Primary ve secondary text renkleri
- **Semantic Colors**: Error ve diğer durum renkleri

#### Tipografi (AppTextStyles)
- **Font Family**: SF Pro Display (9 farklı weight)
- **Sistemli yaklaşım**: `{weight}{size}{color}` naming convention
- **Responsive font sizes**: 10px'den 32px'e kadar

#### İconlar (AppIcons)
- **SVG tabanlı**: Scalable ve performance optimized
- **Enum yapısı**: Type-safe icon kullanımı
- **Dinamik renklendirme**: ColorFilter desteği
- **11 adet icon**: Communication, Arrow, Warning, Interface, Media, Shape kategorilerinde

### 📱 Assets

#### 🖼️ Görseller
- `ivent_header.png` - Ana header görseli

#### 🎨 İkonlar (SVG)
- **Communication**: Bell, Chat Circle, Mail
- **Navigation**: Chevron Left
- **Help & Info**: Circle Help, Info, Triangle Warning
- **Interface**: Exit, Lock Open
- **Media**: Headphones
- **Security**: Shield

#### 🔤 Fontlar
- **SF Pro Display** ailesi - Apple'ın modern tipografisi
- **9 farklı weight**: Ultralight (100) - Black (900)
- **Professional appearance**: Modern ve okunabilir

### 📊 Data Structures

#### Hobi Kategorileri
Uygulama içinde kullanılacak hobi kategorileri önceden tanımlanmıştır:
- **Sanat & Kültür**: 20 farklı alan (Tiyatro, Opera, Resim vb.)
- **Müzik**: 20 farklı tür (Rock, Pop, Caz, Klasik vb.)
- **Spor**: 20 farklı spor dalı (Futbol, Basketbol, Yüzme vb.)

## 🚀 Gelişim Durumu

### ✅ Tamamlanan
- [x] Proje kurulumu ve initial setup
- [x] Design system implementasyonu (colors, typography, icons)
- [x] Asset yönetimi ve organizasyonu
- [x] Core enum yapıları
- [x] Constants ve helper sınıfları

### 🔄 Geliştirilecek
- [ ] GetX controller'ları
- [ ] UI sayfalarının implementasyonu (4 sayfa)
- [ ] GetX routing sisteminin kurulumu
- [ ] Binding'lerin oluşturulması
- [ ] Reactive state management implementasyonu

## 📱 Hedeflenen Ekranlar

`iVent UI` klasöründeki 8 tasarım görseli (Bilgiler 1-8.png) referans alınarak **4 ana sayfa** geliştirilecektir:

1. **Ana Sayfa / Dashboard**
2. **Etkinlik Listesi**
3. **Etkinlik Detayı**
4. **Profil / Ayarlar**

## 🔧 Kurulum ve Çalıştırma

### Önkoşullar
- Flutter SDK 3.8.1 veya üzeri
- Dart SDK 3.8.1 veya üzeri
- Android Studio / VS Code
- Git

### Adımlar

1. **Projeyi klonlayın**
```bash
git clone [repository-url]
cd ivent_trial
```

2. **Bağımlılıkları yükleyin**
```bash
flutter pub get
```

3. **Uygulamayı çalıştırın**
```bash
flutter run
```

## 📝 Geliştirme Notları

### Code Style
- **Clean Architecture** prensiplerine uygun kod organizasyonu
- **SOLID principles** uygulaması
- **Type-safe** yaklaşım (enum'lar, strongly-typed classes)
- **Consistent naming** conventions

### Performance
- **SVG optimizasyonu** - vector tabanlı iconlar
- **Asset management** - efficient loading
- **GetX optimization** - minimal rebuilds

### Accessibility
- **SF Pro Display** - excellent readability
- **Color contrast** - WCAG guidelines compliance
- **Scalable fonts** - responsive typography

## 🎯 Öğrenme Hedefleri

Bu proje ile aşağıdaki konularda pratik yapılması hedeflenmektedir:

1. **GetX State Management** - Reactive programming
2. **GetX Routing** - Declarative navigation
3. **GetX Dependency Injection** - Clean architecture
4. **Flutter UI Development** - Modern widget composition
5. **Design System Implementation** - Consistent theming
6. **Asset Management** - Optimized resource handling

## 🤝 Katkıda Bulunma

Bu bir öğrenme projesi olduğu için:
- Clean code principles'a dikkat edin
- GetX best practices'i uygulayın
- Commit mesajlarını açıklayıcı yazın
- Code review sürecine katılın

## 📄 Lisans

Bu proje eğitim amaçlı geliştirilmiştir ve açık kaynak kodludur.

---

**Not**: Bu README, projenin mevcut durumunu yansıtmaktadır. Geliştirme süreci ilerledikçe güncellenecektir.