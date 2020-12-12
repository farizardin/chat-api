# README

# Konfigurasi Dependensi
1. Pastikan menggunakan Ruby dengan versi 2.6.6
2. Jalankan perintah `gem install bundler` di cmd/terminal untuk mengupgrade ke versi 2.x.x
3. Jalankan `bundle install` di cmd/terminal pada directory app untuk menginstall dependencies pada Gemfile

# Database Creation
Terdapat 2 cara yaitu menggunakan Migration atau mengimport file SQL
* Dengan Migration
    1. buatlah database dengan nama bebas di MySQL (default nama database app ini adalah `chat-api`)
    2. konfigurasikan database di file `config/database.yml`
    3. jalankan perintah `rails db:migrate` untuk melakukan migrasi tabel yang telah disiapkan
* Dengan file SQL
    1. import file `chat-api.sql` yang terletak pada app ke MySQL (file ini menggunakan auto database creation. jika diimport akan auto create database dengan nama `chat-api`)
    2. konfigurasikan database di file `config/database.yml`
    
# Menjalankan Aplikasi
* Ketik `rails s` di cmd/terminal pada directory app

# Fitur Aplikasi
* Register (Optional Feature)
