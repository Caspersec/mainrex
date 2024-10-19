#!/bin/bash

# Nama domain yang akan dilakukan bypass dari Imunify
DOMAIN="skena.co.id"

# Fungsi untuk menonaktifkan Imunify360
disable_imunify360() {
    echo "Menonaktifkan Imunify360..."
    systemctl stop imunify360
    if [ $? -eq 0 ]; then
        echo "Imunify360 berhasil dinonaktifkan."
    else
        echo "Gagal menonaktifkan Imunify360."
        exit 1
    fi
}

# Fungsi untuk mengaktifkan kembali Imunify360
enable_imunify360() {
    echo "Mengaktifkan kembali Imunify360..."
    systemctl start imunify360
    if [ $? -eq 0 ]; then
        echo "Imunify360 berhasil diaktifkan kembali."
    else
        echo "Gagal mengaktifkan Imunify360."
        exit 1
    fi
}

# Fungsi untuk menjalankan tugas pada domain yang di-bypass
run_domain_task() {
    echo "Menjalankan tugas pada domain $DOMAIN..."
    # Masukkan tugas yang diperlukan di sini, misalnya memperbarui file atau konfigurasi
    # Contoh navigasi ke direktori website dan menjalankan perintah
    cd /var/www/$DOMAIN || exit
    # Menjalankan perintah atau tugas tambahan yang diperlukan untuk domain
    echo "Proses domain $DOMAIN selesai."
}

# Menonaktifkan Imunify360 sebelum menjalankan tugas
disable_imunify360

# Menjalankan tugas untuk domain
run_domain_task

# Mengaktifkan kembali Imunify360 setelah tugas selesai
enable_imunify360

echo "Proses selesai."
