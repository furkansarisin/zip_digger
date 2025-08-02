# zip_digger

`zip_digger.sh`, birbiri içine gömülmüş çok katmanlı `.zip` dosyalarını otomatik olarak açarak, en derindeki `password.txt` dosyasını bulmak için yazılmış bir Bash scriptidir.

## 🎯 Amaç

Sıkıştırılmış `matruşka` tipi `.zip` yapıları içinde kaybolmadan, terminal üzerinden otomatik olarak en derin seviyeye kadar inip `password.txt` dosyasını bulmak.

## ⚙️ Özellikler

- Kendi kendini tekrarlayan zip dosyası açma algoritması
- Varsayılan parola desteği
- Geçici dizin yönetimi
- Hedef dosyaya ulaşıldığında otomatik olarak gösterim

## 💻 Kullanım

```bash
bash zip_digger.sh
