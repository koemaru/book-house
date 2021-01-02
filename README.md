# book-house
book-houseは本のレビューを閲覧・投稿できるアプリです。<br>
気になる本のレビューを見たり、読んだ本の感想を投稿して楽しめます。<br>
<img width="1400" alt="スクリーンショット 2021-01-02 19 49 42" src="https://user-images.githubusercontent.com/65227841/103455822-b9c07200-4d33-11eb-9132-32f955ad81d3.png">

# URL
http://www.book-houses.com/
<br>
トップページ右上のゲストログインからお試しください。

# 機能一覧
- ユーザ登録、ログイン機能(devise)
- いいね機能(Ajax)
- 星レビュー機能(jQuery,raty)
- アコーディオンメニュー(jQuery)
- カテゴリー(jQuery, Ajax)
- 画像投稿機能(carrierwave,mini_magick)
  - 投稿画像のプレビュー機能(jQuery)
- 無限スクロール(kaminari,jscroll)

# 使用技術
<p align="center">
  <a href="https://www.ruby-lang.org/ja/"><img src="https://user-images.githubusercontent.com/65227841/103456042-baf29e80-4d35-11eb-9a30-434eb6f0aec3.png" height="50px;" /></a>
<a>　</a>
  <a href="https://railsguides.jp/"><img src="https://user-images.githubusercontent.com/65227841/103456219-66502300-4d37-11eb-8ba6-81fbf7c1adca.png" height="50px;" /></a>
<a>　</a>
  <a href="https://www.mysql.com/jp/"><img src="https://user-images.githubusercontent.com/65227841/103456982-9222d700-4d3e-11eb-9d17-fc31f7298ddf.png" height="50px;" /></a>
<a>　</a>
  <a href="https://jquery.com/"><img src="https://user-images.githubusercontent.com/65227841/103457154-fbefb080-4d3f-11eb-869e-b1ea06f16871.png" height="50px;" /></a>
<a>　</a>
  <a href="https://aws.amazon.com/jp/"><img src="https://user-images.githubusercontent.com/65227841/103457279-255d0c00-4d41-11eb-83fc-8831f3bca063.png" height="50px;" /></a>
<a>　</a>
  <a href="https://www.nginx.co.jp/"><img src="https://user-images.githubusercontent.com/65227841/103456943-42dca680-4d3e-11eb-9c96-707cf603dd58.png" height="50px;" /></a>
<a>　</a>
  <a href="#"><img src="https://user-images.githubusercontent.com/65227841/103457370-13c83400-4d42-11eb-8409-ce6db94b0c1a.png" height="50px;" /></a>
<a>　</a>
  <a href="https://capistranorb.com/"><img src="https://user-images.githubusercontent.com/65227841/103457089-81269580-4d3f-11eb-8e9e-3a77529a1394.png" height="50px;" /></a>
</p>
<br>

- Ruby 2.6.5
- Ruby on Rails Rails 6.0.3
- MySQL 5.6.47
- jQuery 1.12.4
- AWS
  - EC2
  - S3
  - Route53
- Nginx 1.18.0
- Unicorn 5.4.1
- Capistrano 3.14.1

# AWS構成図
<img width="900" alt="スクリーンショット 2021-01-02 23 03 19" src="https://user-images.githubusercontent.com/65227841/103458786-c2727180-4d4e-11eb-9809-48ea9a87570e.png">

# テスト
- RSpec
  - 単体テスト（ローカル環境にて実施中。完了後デプロイ予定）
  
# DB設計
## usersテーブル
|Column       |Type   |Options                      |
|-------------|-------|-----------------------------|
|name         |string |null: false, unique: true    |
|email        |string |null: false, unique: true    |
|password     |string |null: false                  |
### Association
- has_many :columns
- has_many :books
- has_many :comments
- has_many :likes

## booksテーブル
|Column           |Type       |Options                          |
|-----------------|-----------|---------------------------------|
|user_id          |integer    |null: false                      |
|category_id      |integer    |null: false                      |
|book_title       |string     |null: false                      |
|article          |text       |null: false                      |
|image            |string     |null: false                      |
|article_title    |string     |null: false                      |
|likes_count      |integer    |                                 |
### Association
- belongs_to :user
- belongs_to :category
- has_many :comments
- has_many :likes, dependent: :destroy
- has_many :liking_users, through: :likes, source: :user
- has_one :review

## commentsテーブル
|Column       |Type         |Options                          |
|-------------|-------------|---------------------------------|
|user_id      |references   |null: false, foreign_key: true   |
|book_id      |references   |null: false, foreign_key: true   |
|comment      |text         |null: false                      |
### Association
- belongs_to :user
- belongs_to :book

## likesテーブル
|Column       |Type         |Options                          |
|-------------|-------------|---------------------------------|
|user_id      |integer      |null: false                      |
|book_id      |integer      |null: false,                     |
### Association
- belongs_to :user
- belongs_to :book, counter_cache: :likes_count

## categoriesテーブル
|Column       |Type         |Options                          |
|-------------|-------------|---------------------------------|
|name         |string       |null: false, unique: true        |
|ancestry     |string       |add_index: true                  |
- has_many :books
- has_ancestry

## reviewsテーブル
|Column       |Type         |Options                          |
|-------------|-------------|---------------------------------|
|book_id      |references   |null: false, foreign_key: true   |
|rate         |float        |                                 |
|score        |string       |null: false                      |
- has_one :book

## columnsテーブル
|Column       |Type         |Options                          |
|-------------|-------------|---------------------------------|
|user_id      |references   |null: false, foreign_key: true   |
|title        |string       |null: false                      |
|column       |text         |null: false                      |
|image        |string       |null: false                      |
|genre_id     |integer      |null: false                      |
### Association
- belongs_to :user
- belongs_to_active_hash :genre
