# ZaminOS — arxitektura

ZaminOS — Zamin Phone uchun konvergent operatsion tizim. Bitta o'rnatish,
ikki yuz:

- **Mobile rejim** — foydalanuvchi telefonni qo'lida ushlab turganda.
- **Desktop rejim** — telefon ekran, klaviatura yoki sichqonchaga ulanganda.

## Qatlamlar

```
┌────────────────────────────────────────────────────────────┐
│  ZaminOS qobig'i                                           │
│  ─ MobileShell      ─ DesktopShell                         │
└──────────────┬─────────────────────────────────────────────┘
               │ org.zaminos.FormFactor1
┌──────────────┴─────────────────────────────────────────────┐
│  zamin-formfactord  (tizim xizmati)                        │
│  kuzatadi: tashqi ekran, klaviatura, sichqoncha            │
└──────────────┬─────────────────────────────────────────────┘
               │
┌──────────────┴─────────────────────────────────────────────┐
│  ZaminOS oynalar boshqaruvchisi                            │
└──────────────┬─────────────────────────────────────────────┘
               │
┌──────────────┴─────────────────────────────────────────────┐
│  Zamin Phone qurilma qo'llab-quvvatlash qatlami            │
│  ─ tashqi ekran ulanishi                                   │
│  ─ USB orqali tashqi qurilmalar                            │
└────────────────────────────────────────────────────────────┘
```

## Konvergensiya oqimi

1. Foydalanuvchi Zamin Phone'ga ekran-klaviatura ulagichini ulaydi.
2. Qurilma qatlami yangi tashqi ekranni aniqlaydi.
3. Tizim `zamin-formfactord` xizmatini xabardor qiladi.
4. Xizmat ulangan kirish qurilmalarini tekshiradi va `Mode::Desktop` ga
   o'tishni hal qiladi, so'ng `org.zaminos.FormFactor1.ModeChanged("desktop")`
   signalini yuboradi.
5. Qobiq signalni qabul qiladi va `MobileShell` dan `DesktopShell` ga
   almashtiradi. Oynalar boshqaruvchisi ekranlarni qaytadan sozlaydi.
6. Kabel uzilganda hammasi ~1 soniyada teskari yo'nalishda qaytadi.

## Tezkor qarash — papkalar

| Yo'l            | Mazmuni                                                     |
|-----------------|-------------------------------------------------------------|
| `iso/`          | O'rnatish tasvirini yig'ish profili                         |
| `packages/`     | ZaminOS paketlari uchun yig'ish retseptlari                 |
| `shell/`        | ZaminOS konvergent qobig'i                                  |
| `formfactord/`  | Forma-faktor aniqlash xizmati                               |
| `kernel/`       | Zamin Phone qurilma qatlami sozlamalari                     |
| `scripts/`      | Yig'ish va flash skriptlari                                 |
| `docs/`         | Hujjatlar                                                   |
