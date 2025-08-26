# iVent Trial

## 🎯 Amaç
`iVent UI` klasöründeki görselleri baz alarak, **GetX mimarisi** ve verilen dökümanlar yardımıyla tasarımları koda dökmen gerekiyor.  
- Görseller, sayfaların akışını sırayla gösteriyor.  
- Toplamda **4 sayfa** var.  
- İstersen her sayfa için ayrı bir **controller** yazabilir, istersen de tek bir controller ile ilerleyebilirsin.  
- Sayfaların birebir aynı olması şart değil; önemli olan verilen yapıyı ve deneyimi doğru yakalamak.  

## 🛠️ Kullanacağımız Araçlar
- `GetMaterialApp()`
- `GetView<>` → Sayfalarda StatefulWidget yerine tercih edeceğiz
- `Obs()`
- **GetX Bindings**
- **GetX Routes**
- **GetX Controller**

## ⚡ Küçük Not
Burada amacımız tamamen **GetX** ile pratik yapmak.  
Ama küçük parçaları (bireysel widgetlar) yazarken **StatefulWidget** kullanabilirsin.  
Yani: sayfa yapısı `GetView` olacak, fakat içindeki parçaları ister stateless ister stateful şekilde yazabilirsin. 🎨  
Sadece GetX mantığını öğrenmeye ve kullanmaya odaklanıyoruz.  
