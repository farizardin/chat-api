# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version '2.6.6'

* Configuration
=> Pastikan menggunakan Ruby 2.6.6
=> Jalankan perintah `gem install bundler` di cmd/terminal untuk mengupgrade ke versi 2.x.x
=> Jalankan `bundle install` di cmd/terminal pada directory app untuk menginstall dependencies pada Gemfile

* Database creation
=> Dengan Migration
    1. buatlah database dengan nama bebas di MySQL (default nama database app ini adalah `chat-api`)
    2. konfigurasikan database di file `config/database.yml`
    3. jalankan perintah `rails db:migrate` untuk melakukan migrasi tabel yang telah disiapkan
=> Dengan file SQL
    1. import file `chat-api.sql` yang terletak pada app ke MySQL (file ini menggunakan auto database creation. jika diimport akan auto create database dengan nama `chat-api`)
    2. konfigurasikan database di file `config/database.yml`

* Services (job queues, cache servers, search engines, etc.)
=> Register (Optional Feature)
=> 

* Deployment instructions

* ...
