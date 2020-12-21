# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# book-house DB設計
## usersテーブル
|Column       |Type   |Options                      |
|-------------|-------|-----------------------------|
|nickname     |string |null: false                  |
|email        |string |null: false, unique: true    |
|password     |string |null: false                  |
|last_name    |string |null: false                  |
|first_name   |string |null: false                  |
### Association
- has_many :columns
- has_many :books
- has_many :comments
- has_many :likes

## booksテーブル
|Column       |Type       |Options                          |
|-------------|-----------|---------------------------------|
|user_id      |references |null: false, foreign_key: true   |
|category_id  |references |null: false,                     |
|title        |string     |null: false                      |
|article      |text       |null: false                      |
|image        |string     |null: false                      |
|likes_count  |integer    |                                 |
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
|user_id      |references   |null: false, foreign_key: true   |
|book_id      |references   |null: false, foreign_key: true   |
### Association
- belongs_to :user
- belongs_to :book, counter_cache: :likes_count

## categoriesテーブル
|Column       |Type         |Options                          |
|-------------|-------------|---------------------------------|
|name         |string       |null: false, unique: true        |
|ancestry     |string       |                                 |
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