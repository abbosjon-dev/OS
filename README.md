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

- **Konvergensiya** — bir qurilma, ikki ish rejimi.
- **Mahalliy o'zbek tili** — interfeys, klaviatura va ovozli yordamchi.
- **Yangi dizayn** — toza tipografika, haqiqiy vektor ikonkalar (Phosphor
  to'plami, 130+ belgi), Inter shrift, yumshoq gradientlar.
- **Maxfiylik** — ma'lumotlaringiz qurilmangizda qoladi.

## Mobile ekranlar

| Lockscreen | Bosh ekran | Bildirishnomalar |
|:---:|:---:|:---:|
| ![lockscreen](shell/preview/out/zaminos-lockscreen.png) | ![home](shell/preview/out/zaminos-home.png) | ![notifications](shell/preview/out/zaminos-notifications.png) |

| Boshqaruv markazi | Ilovalar almashtirgich | Telefon (qo'ng'iroq) |
|:---:|:---:|:---:|
| ![controlcenter](shell/preview/out/zaminos-controlcenter.png) | ![appswitcher](shell/preview/out/zaminos-appswitcher.png) | ![phonecall](shell/preview/out/zaminos-phonecall.png) |

| Sozlamalar | Sozlamalar — Wi-Fi | Klaviatura (Xabarlar) |
|:---:|:---:|:---:|
| ![settings](shell/preview/out/zaminos-settings.png) | ![settings-wifi](shell/preview/out/zaminos-settings-wifi.png) | ![keyboard](shell/preview/out/zaminos-keyboard.png) |

| Hisoblash | Eslatmalar |
|:---:|:---:|
| ![calculator](shell/preview/out/zaminos-calculator.png) | ![notes](shell/preview/out/zaminos-notes.png) |

## Desktop ekranlar

### Kirish va bosh stol

| Kirish | Bosh stol (Sozlamalar + Eslatma) |
|:---:|:---:|
| ![login](shell/preview/out/zaminos-desktop-login.png) | ![desktop](shell/preview/out/zaminos-desktop.png) |

### Ilovalar

| Fayllar | Pochta |
|:---:|:---:|
| ![files](shell/preview/out/zaminos-desktop-files.png) | ![mail](shell/preview/out/zaminos-desktop-mail.png) |

| Brauzer | Taqvim |
|:---:|:---:|
| ![browser](shell/preview/out/zaminos-desktop-browser.png) | ![calendar](shell/preview/out/zaminos-desktop-calendar.png) |

| Musiqa | Mission Control |
|:---:|:---:|
| ![music](shell/preview/out/zaminos-desktop-music.png) | ![mission](shell/preview/out/zaminos-desktop-mission.png) |

### Spotlight

| Qidiruv |
|:---:|
| ![spotlight](shell/preview/out/zaminos-spotlight.png) |

## Loyiha tuzilmasi

| Yo'l                    | Vazifasi                                                              |
|-------------------------|-----------------------------------------------------------------------|
| `shell/qml/`            | ZaminOS qobig'i (har bir ekran alohida `.qml` fayl)                   |
| `shell/qml/components/` | Qayta ishlatiladigan UI bloklari (Icon, Button, Switch, ListRow, Window_, DesktopChrome, …) |
| `shell/qml/icons/`      | 130+ vektor ikonka — regular / fill / bold variantlari (Phosphor)     |
| `shell/preview/`        | Dizayn ko'rib chiqish vositasi va chiqarilgan PNG'lar                 |
| `formfactord/`          | Tashqi qurilmalarni aniqlovchi tizim xizmati                          |
| `packages/`             | ZaminOS paketlarining yig'ish retseptlari                             |
| `iso/`                  | Zamin Phone uchun o'rnatish tasvirini tayyorlash profili              |
| `kernel/`               | Zamin Phone qurilmasini qo'llab-quvvatlash sozlamalari                |
| `scripts/`              | `build-iso.sh`, `flash-zaminphone.sh`, `render-mockup.sh`             |
| `docs/`                 | Loyiha hujjatlari                                                     |

## Ekranlarni qayta chiqarish

```bash
./scripts/render-mockup.sh
# 21 ta PNG → shell/preview/out/
```

## Holati

Boshlang'ich bosqich. Konvergent qobiq dizayni 21 ta ekran uchun tayyor:

- **Mobile (11 ta):** lockscreen, bosh ekran, bildirishnomalar markazi,
  boshqaruv markazi, ilovalar almashtirgich, telefon qo'ng'irog'i,
  sozlamalar, sozlamalar→Wi-Fi, klaviatura (xabarlar), hisoblash, eslatmalar.
- **Desktop (9 ta):** kirish, bosh stol, fayllar, pochta, brauzer, taqvim,
  musiqa, mission control, spotlight.

Tizim xizmatlari va yig'ish skriptlari skelet ko'rinishida.

## Litsenziya

GPL-3.0-or-later.
