# ZaminOS

**ZaminOS** — Zamin Phone uchun zamonaviy, konvergent operatsion tizim.

Bitta tizim — ikki ko'rinish:

- **Mobile rejim** — telefonni qo'lingizda ushlaganingizda. Sezgir, sodda,
  bir qo'l bilan boshqariladigan interfeys.
- **Desktop rejim** — Zamin Phone'ga tashqi ekran, klaviatura yoki sichqoncha
  ulanganda avtomatik ravishda yoqiladi. Yuqori panel, oynalar, vazifalar
  paneli — to'liq ish stoli tajribasi, bitta qurilmadan.

> *Zamin* (o'zbek tilida: "yer, asos") — har kuni qiladigan ishlaringiz
> tagidagi mustahkam asos.

## Xususiyatlar

- **Konvergensiya** — bir qurilma, ikki ish rejimi. Ulang — desktop bo'ladi,
  uzing — telefon bo'ladi. Hech qanday qayta yuklash, hech qanday sozlash.
- **Mahalliy o'zbek tili** — interfeys, klaviatura va ovozli yordamchi
  o'zbek tilida.
- **Yangi dizayn** — toza tipografika, haqiqiy vektor ikonkalar, yumshoq
  gradientlar, silliq animatsiyalar.
- **Maxfiylik** — ma'lumotlaringiz qurilmangizda qoladi.

## Ekranlar

Hammasi `./scripts/render-mockup.sh` orqali qayta chiqariladi. Har bir
ekran alohida PNG sifatida `shell/preview/out/` ichida saqlanadi.

### Mobile

| Lockscreen | Bosh ekran | Bildirishnomalar |
|:---:|:---:|:---:|
| ![lockscreen](shell/preview/out/zaminos-lockscreen.png) | ![home](shell/preview/out/zaminos-home.png) | ![notifications](shell/preview/out/zaminos-notifications.png) |

| Boshqaruv markazi | Ilovalar almashtirgich | Spotlight |
|:---:|:---:|:---:|
| ![controlcenter](shell/preview/out/zaminos-controlcenter.png) | ![appswitcher](shell/preview/out/zaminos-appswitcher.png) | *Desktop'da* |

### Sozlamalar

| Sozlamalar — bosh sahifa | Sozlamalar — Wi-Fi |
|:---:|:---:|
| ![settings](shell/preview/out/zaminos-settings.png) | ![settings-wifi](shell/preview/out/zaminos-settings-wifi.png) |

### Ilovalar

| Telefon (qo'ng'iroq) | Klaviatura (Xabarlar) |
|:---:|:---:|
| ![phonecall](shell/preview/out/zaminos-phonecall.png) | ![keyboard](shell/preview/out/zaminos-keyboard.png) |

| Hisoblash | Eslatmalar |
|:---:|:---:|
| ![calculator](shell/preview/out/zaminos-calculator.png) | ![notes](shell/preview/out/zaminos-notes.png) |

### Desktop rejim

| Desktop (Sozlamalar + Eslatma oynalari) |
|:---:|
| ![desktop](shell/preview/out/zaminos-desktop.png) |

| Spotlight qidiruv |
|:---:|
| ![spotlight](shell/preview/out/zaminos-spotlight.png) |

## Loyiha tuzilmasi

| Yo'l           | Vazifasi                                                      |
|----------------|---------------------------------------------------------------|
| `shell/qml/`   | ZaminOS qobig'i (har bir ekran alohida `.qml` fayl)           |
| `shell/qml/components/` | Qayta ishlatiladigan UI bloklari (Icon, Button, Switch, ListRow, …) |
| `shell/qml/icons/`      | 88 ta vektor ikonka — regular / fill / bold variantlari       |
| `shell/preview/`        | Dizayn ko'rib chiqish vositasi va chiqarilgan PNG'lar         |
| `formfactord/`          | Tashqi qurilmalarni aniqlovchi tizim xizmati                  |
| `packages/`             | ZaminOS paketlarining yig'ish retseptlari                     |
| `iso/`                  | Zamin Phone uchun o'rnatish tasvirini tayyorlash profili      |
| `kernel/`               | Zamin Phone qurilmasini qo'llab-quvvatlash sozlamalari        |
| `scripts/`              | `build-iso.sh`, `flash-zaminphone.sh`, `render-mockup.sh`     |
| `docs/`                 | Loyiha hujjatlari                                             |

## Holati

Boshlang'ich bosqich. Konvergent qobiq dizayni 13 ta ekran uchun tayyor
(lockscreen, bosh ekran, bildirishnomalar markazi, boshqaruv markazi,
ilovalar almashtirgich, sozlamalar, sozlamalar→Wi-Fi, qo'ng'iroq, klaviatura,
hisoblash, eslatmalar, desktop, spotlight). Tizim xizmatlari va yig'ish
skriptlari skelet ko'rinishida.

## Litsenziya

GPL-3.0-or-later.
