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
1. Register (Optional Feature)
    Fitur ini memungkinkan pengguna untuk melakukan registrasi.
    * URI `127.0.0.1:3000/register`
    * Keys `name`, `username`, `password`, `password_confirmation`, `email`
    * Method `POST`
    
2. Login (Optional Feature)
    Fitur ini memungkinkan pengguna untuk melakukan login dan mendapatkan `token` untuk authorization
    * URI `127.0.0.1:3000/register`
    * Keys `name`, `username`, `password`, `password_confirmation`, `email`
    * Method `POST`
    
3. Authorization (Optional Feature)
    Fitur ini berguna untuk mengizinkan pengguna mengakses API dengan menggunakan `token` yang didapatkan disaat melakukan login.
    Tambahkan key `Authorization` pada `Header` dengan value `token` yang didapatkan saat melakukan login.
    * URIs yang memerlukan `Authorization`
    1. `127.0.0.1:3000/users` method `GET`
    2. `127.0.0.1:3000/chat` method `GET`
    3. `127.0.0.1:3000/chat/send` method `POST`
    4. `127.0.0.1:3000/chat/open/{id}` method `GET`
    
4. Show User List (Optional Feature)
    Fitur ini berguna untuk mengambil daftar user yang tersedia.
    Fitur ini membutuhkan `Authorization`
    
    * URI `127.0.0.1:3000/register`
    * Keys `name`, `username`, `password`, `password_confirmation`, `email`
    * Method `POST`
