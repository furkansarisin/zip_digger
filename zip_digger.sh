#!/bin/bash

# 1. Geçici klasör oluştur
mkdir -p workdir
cp 10000.zip workdir/
cd workdir

# 2. İlk zip'in adı
current_zip="10000.zip"

# 3. Her zipi sırayla aç
while true; do
    echo "[*] Açılıyor: $current_zip"
    
    # Eğer zip dosyası yoksa bitir
    if [[ ! -f "$current_zip" ]]; then
        echo "❌ Zip dosyası bulunamadı: $current_zip"
        break
    fi

    # Zipi çıkar
    unzip -qq "$current_zip"

    # Eski zip'i sil
    rm "$current_zip"

    # Yeni zip dosyası var mı? Varsa ilkini seç
    next_zip=$(find . -maxdepth 1 -name '*.zip' | head -n 1)

    # Eğer artık zip yoksa ve password.txt varsa
    if [[ -z "$next_zip" ]]; then
        echo "🎯 Zip zinciri sona erdi."

        if [[ -f "password.txt" ]]; then
            echo "🔑 password.txt içeriği:"
            cat password.txt
        else
            echo "📄 password.txt bulunamadı ama son zip açıldı."
            ls -al
        fi
        break
    fi

    # Yeni zip dosyasını sıradaki işlem için ata
    current_zip="${next_zip:2}"  # ./prefix'ini sil
done
