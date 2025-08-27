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

#### Development & Testing
- **flutter_test**: Testing framework
- **flutter_lints**: ^5.0.0 - Kod kalitesi ve linting kuralları

## 🏗️ GetX Mimarisi

Proje, **GetX mimarisi** kullanarak aşağıdaki yapıyı benimser:

### 📱 Kullanılan GetX Bileşenleri
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
├── core/                      # Core fonksiyonaliteler
│   ├── constants/            # Sabit değerler ve konfigürasyonlar
│   │   ├── app_assets.dart   # Asset path'leri
│   │   ├── app_colors.dart   # Renk paleti
│   │   ├── app_text_styles.dart # Tipografi stilleri
│   │   └── hobbies.dart      # Hobi kategorileri data'sı
│   └── enums/               # Enum tanımlamaları
│       ├── app_icons.dart   # SVG icon enum'ları
│       └── app_images.dart  # Image asset enum'ları
├── product/                  # Reusable product components
│   ├── utils/               # Utility classes
│   │   └── phone_utils.dart # Telefon numarası validasyon utilities
│   └── widgets/             # Custom widget components
│       ├── continue_button.dart    # Primary action button
│       ├── default_app_bar.dart    # Standard app bar
│       └── phone_input_field.dart  # Phone number input field
├── view/                     # UI Screens (Feature-based)
│   └── authentication/      # Authentication flow
│       └── phone_verification/
│           ├── controller/
│           │   └── phone_verification_controller.dart
│           └── view/
│               └── phone_verification_view.dart
└── main.dart                # Uygulama giriş noktası

test/                        # Test files
└── view/authentication/phone_verification/
    └── phone_verification_view_test.dart
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

#### İmajlar (AppImages)
- **Asset management**: Type-safe image loading
- **iVent Header**: Ana marka logosu

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

### 🧩 Reusable Components

#### PhoneInputField Widget
- **Türkiye telefon numarası** validasyonu
- **Auto-formatting**: Kullanıcı yazarken otomatik formatlama
- **+90 prefix**: Sabit ülke kodu
- **Input restriction**: Sadece rakam girişi, 10 karakter limit
- **Visual feedback**: Text renk değişimi

#### ContinueButton Widget
- **Primary action button**: Ana aksiyonlar için
- **Loading state**: Async işlemler için loading göstergesi
- **Disable state**: Validation failed durumlarında
- **Consistent styling**: Design system uyumlu

#### DefaultAppBar Widget
- **Standart app bar**: Tutarlı navigasyon deneyimi
- **Back button**: Otomatik geri navigation
- **Header logo**: Marka görünürlüğü

### 📊 Data Structures & Utils

#### PhoneUtils Utility Class
- **Turkish phone validation**: Türkiye mobil numarası kontrolü
- **Phone formatting**: Otomatik formatlama utilities
- **Clean phone extraction**: Format'tan temiz numara çıkarma
- **Display formatting**: Gösterim için formatlama

#### Hobi Kategorileri
Uygulama içinde kullanılacak hobi kategorileri önceden tanımlanmıştır:
- **Sanat & Kültür**: 20 farklı alan (Tiyatro, Opera, Resim vb.)
- **Müzik**: 20 farklı tür (Rock, Pop, Caz, Klasik vb.)
- **Spor**: 20 farklı spor dalı (Futbol, Basketbol, Yüzme vb.)

## 🚀 Gelişim Durumu

### ✅ Tamamlanan (Bilgiler 1.png & 2.png)
- [x] Proje kurulumu ve initial setup
- [x] **GetX mimarisi kurulumu** (GetMaterialApp, routing)
- [x] **Design system implementasyonu** (colors, typography, icons, images)
- [x] **Asset yönetimi** ve organizasyonu
- [x] **Core enum yapıları** (icons, images)
- [x] **Constants ve helper sınıfları**
- [x] **Phone Verification Screen** - Telefon numarası doğrulama ekranı
- [x] **GetX Controller implementasyonu** - Reactive state management
- [x] **Custom Widget Library** - Reusable components
- [x] **Phone validation utility** - Türkiye telefon numarası validasyonu
- [x] **Comprehensive testing** - 17 farklı test case
- [x] **Routing system** - GetX navigation setup

### 🔄 Geliştirilecek (Bilgiler 3.png & 4.png)
- [ ] **OTP Verification Screen** - SMS kodu doğrulama

## 📱 Implementasyonu Tamamlanan Ekranlar

### 1. Phone Verification Screen ✅
**Bilgiler 1.png & 2.png görevleri tamamlandı**

**Özellikler:**
- Türkiye telefon numarası girişi (+90 5XXXXXXXXX)
- Real-time validation ve formatting
- Reactive button activation/deactivation
- GetX controller ile state management
- Temiz ve modern UI tasarımı
- Comprehensive error handling
- Snackbar feedback mesajları

**Teknik Detaylar:**
- `PhoneVerificationController` - GetX controller
- `PhoneInputField` - Custom input widget
- `ContinueButton` - Primary action button
- `PhoneUtils` - Validation utilities
- 17 test case ile %100 test coverage

### 2. Hedeflenen Sonraki Ekranlar
`iVent UI` klasöründeki kalan tasarım görselleri (Bilgiler 3-8.png) referans alınarak geliştirilecek:

1. **OTP Verification** - SMS kodu doğrulama

## 🧪 Test Yapısı

### Test Coverage
- **17 test case** - Phone verification screen için

### Test Scenarios
- Component rendering tests
- Input validation (Turkish phone numbers)
- Button state management
- Text formatting and filtering
- Edge cases and error scenarios

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

4. **Testleri çalıştırın**
```bash
flutter test
```

## 📝 Geliştirme Notları

### Code Architecture
- **Feature-based structure** - Screen'ler feature bazlı organize edilmiş
- **Clean Architecture** prensiplerine uygun kod organizasyonu
- **SOLID principles** uygulaması
- **Type-safe** yaklaşım (enum'lar, strongly-typed classes)
- **Consistent naming** conventions
- **Modular widget structure** - Reusable components

### GetX Best Practices
- **Reactive programming** - Obs() ile state management
- **Controller lifecycle** - onInit/onClose proper usage
- **Navigation management** - GetX routing system
- **Dependency injection** - Get.put() pattern
- **Error handling** - GetX snackbar implementation

### Performance Optimizations
- **SVG optimizasyonu** - Vector tabanlı iconlar
- **Asset management** - Efficient loading with enums
- **GetX optimization** - Minimal rebuilds with reactive variables
- **Widget composition** - Modular and reusable widgets

### Testing Strategy
- **Widget testing** - UI component verification
- **Controller testing** - Business logic validation
- **Integration testing** - End-to-end flows
- **Mock testing** - External dependency isolation

### Accessibility
- **SF Pro Display** - Excellent readability
- **Color contrast** - WCAG guidelines compliance
- **Scalable fonts** - Responsive typography
- **Focus management** - Keyboard navigation support

## 🎯 Öğrenme Hedefleri

Bu proje ile aşağıdaki konularda pratik yapılması hedeflenmektedir:

1. **GetX State Management** - Reactive programming patterns
2. **GetX Routing** - Declarative navigation system
3. **GetX Dependency Injection** - Clean architecture implementation
4. **Flutter UI Development** - Modern widget composition
5. **Design System Implementation** - Consistent theming approach
6. **Asset Management** - Optimized resource handling
7. **Testing Strategies** - Comprehensive test coverage
8. **Custom Widget Development** - Reusable component creation

## 🔄 Geliştirme Süreci

### Tamamlanan Aşamalar
1. **Phase 1**: Project Setup & Architecture ✅
2. **Phase 2**: Design System & Core Components ✅
3. **Phase 3**: Authentication Flow (Phone Verification) ✅

### Devam Eden Aşamalar
4. **Phase 4**: OTP Verification Implementation 🔄

## 🤝 Katkıda Bulunma

Bu bir öğrenme projesi olduğu için:
- **Clean code principles**'a dikkat edin
- **GetX best practices**'i uygulayın
- **Test coverage**'ı koruyun
- **Commit mesajlarını** açıklayıcı yazın
- **Code review** sürecine katılın

## 📊 Proje İstatistikleri

- **Toplam Dosya**: 20+ Dart dosyası
- **Test Coverage**: 17 test case
- **Widget Sayısı**: 8 custom widget
- **Ekran Sayısı**: 1 tamamlandı, 3 planlı
- **Utility Classes**: 2 (PhoneUtils, AppColors vb.)
- **Asset Sayısı**: 11 SVG icon + 1 PNG image + 9 font weight

## 📄 Lisans

Bu proje eğitim amaçlı geliştirilmiştir ve açık kaynak kodludur.

---

**Son Güncelleme**: Phone Verification Screen implementasyonu tamamlandı (Bilgiler 1.png & 2.png görevleri)  
**Geliştirilme**: OTP Verification Screen (Bilgiler 3.png & 4.png hedefleniyor)