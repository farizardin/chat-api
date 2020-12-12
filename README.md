# README
Aplikasi Chat API ini dibuat menggunakan Ruby on Rails

# Konfigurasi Dependensi
1. Pastikan menggunakan Ruby dengan versi 2.6.6
2. Jalankan perintah `gem install bundler` di cmd/terminal untuk mengupgrade ke versi 2.x.x
3. Jalankan `bundle install` di cmd/terminal pada directory project untuk menginstall dependencies pada Gemfile

# Database Creation
Terdapat 2 cara yaitu menggunakan Migration atau mengimport file SQL

* Dengan Migration
    1. buatlah database dengan nama bebas di MySQL (default nama database app ini adalah `chat-api`)
    2. konfigurasikan database di file `config/database.yml`
    3. jalankan perintah `rails db:migrate` untuk melakukan migrasi tabel yang telah disiapkan

* Dengan file SQL
    1. import file `chat-api.sql` yang terletak pada root project ke MySQL (file ini menggunakan auto database creation. jika diimport akan auto create database dengan nama `chat-api`)
    2. konfigurasikan database di file `config/database.yml`
    
# Menjalankan Aplikasi
* Ketik `rails s` di cmd/terminal pada directory project
* rails akan berjalan di `127.0.0.1:3000`
* Pengujian dapat dilakukan menggunakan aplikasi Postman

# URI List
1. `127.0.0.1:3000/register`method `POST`
2. `127.0.0.1:3000/login` method `POST`
3. `127.0.0.1:3000/users` method `GET`
4. `127.0.0.1:3000/chat` method `GET`
5. `127.0.0.1:3000/chat/send` method `POST`
6. `127.0.0.1:3000/chat/open/{id}` method `GET`

# Fitur Aplikasi
1. Register (Optional Feature)
    Fitur ini memungkinkan pengguna untuk melakukan registrasi.
    * URI `127.0.0.1:3000/register`
    * Body form-data keys `name`, `username`, `password`, `password_confirmation`, `email`
    * Method `POST`
    ![alt text](https://github.com/farizardin/chat-api/blob/master/readme/1.png?raw=true)
    
2. Login (Optional Feature).
    Fitur ini memungkinkan pengguna untuk melakukan login dan mendapatkan `token` untuk authorization
    * URI `127.0.0.1:3000/login`
    * Body form-data keys `username`, `password`
    * Method `POST`
    ![alt text](https://github.com/farizardin/chat-api/blob/master/readme/2.png?raw=true)
3. Authorization (Optional Feature).
    Fitur ini berguna untuk mengizinkan pengguna mengakses API dengan menggunakan `token` yang didapatkan disaat melakukan login.
    Tambahkan key `Authorization` pada `Header` dengan value `token` yang didapatkan saat melakukan login.
    * URIs yang memerlukan `Authorization`
    1. `127.0.0.1:3000/users` method `GET`
    2. `127.0.0.1:3000/chat` method `GET`
    3. `127.0.0.1:3000/chat/send` method `POST`
    4. `127.0.0.1:3000/chat/open/{id}` method `GET`
    ![alt text](https://github.com/farizardin/chat-api/blob/master/readme/3.png?raw=true)
4. Show User List (Optional Feature).
    Fitur ini berguna untuk mengambil daftar user yang tersedia selain anda.
    * Fitur ini membutuhkan `Authorization`
    
    * URI `127.0.0.1:3000/users`
    * Method `GET`
    ![alt text](https://github.com/farizardin/chat-api/blob/master/readme/4.png?raw=true)
5. Send Message to Another User (Soal nomor 1).
    Fitur ini berguna untuk mengirimkan pesan ke user lain dengan key parameter `destination` dan `message`.
    * Fitur ini membutuhkan `Authorization`
    
    * URI `127.0.0.1:3000/chat/send`
    * Keys `destination` (user id), `message` (Pesan yang akan dikirim)
    * Method `POST`

    * Berikut adalah contoh mengirim ke user id 2
    1.  Hai, apa kabar?
    ![alt text](https://github.com/farizardin/chat-api/blob/master/readme/5.png?raw=true)
    
    2.  Apakah baik-baik saja?
    ![alt text](https://github.com/farizardin/chat-api/blob/master/readme/5b.png?raw=true)
6. Reply Conversation (Soal nomor 3).
    Fitur ini sama dengan fitur `Send Message` (poin 5) dengan melakukan reply ke pengguna yang mengirim pesan sebelumnya dengan key parameter `destination` dan `message`.
    * Fitur ini membutuhkan `Authorization`
    
    * Keys `destination` (user id), `message` (Pesan yang akan dikirim)
    * URI `127.0.0.1:3000/chat/send`
    * Method `POST`
    ![alt text](https://github.com/farizardin/chat-api/blob/master/readme/6.png?raw=true)

7. Show Conversation Message (Soal nomor 2).
    Fitur ini berguna untuk mengambil pesan berdasarkan `room id`.
    * Fitur ini membutuhkan `Authorization`
    
    * URI `127.0.0.1:3000/open/{id}`
    * Method `GET`
    * (`id` merupakan `room id`, untuk melihat `room id` terdapat pada fitur poin 8)
    ![alt text](https://github.com/farizardin/chat-api/blob/master/readme/7.png?raw=true)
    
 8. Conversation List (Soal nomor 4).
    Fitur ini berguna untuk melihat daftar chat kepada user lain atau dari user lain.
    * Fitur ini membutuhkan `Authorization`
    
    * Fitur ini menampilkan pesan terakhir (soal 4.a) dan jumlah yang belum dibaca (soal 4.b)
    * `room id` digunakan untuk membuka percakapan menggunakan langkah poin 7

    * URI `127.0.0.1:3000/chat`
    * Method `GET`
    ![alt text](https://github.com/farizardin/chat-api/blob/master/readme/8.png?raw=true)

