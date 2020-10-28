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
#テーブル設計

##usersテーブル

| Column     | Type     | Options     |
| ---------- | -------- | ----------- |
| email      | string   | null: false |
| password   | string   | null: false |
| nickname   | string   | null: false |
| lname      | string   | null: false |
| fname      | string   | null: false |
| lname_kana | string   | null: false |
| fname_kana | string   | null: false |
| birthday   | date     | null: false |

### Association
has_many :items
has_many :order


##itemsテーブル

| Column            | Type        | Options                        |
| ----------------- | ----------- | ------------------------------ |
| name              | string      | null: false                    |
| description       | text        | null: false                    |
| category_id       | integer     | null: false                    |
| status_id         | integer     | null: false                    |
| burden_id         | integer     | null: false                    |
| prefectures_id    | integer     | null: false                    |
| ship_date_id      | integer     | null: false                    |
| selling_price     | integer     | null: false                    |
| user              | references  | null: false, foreign_key: true |


### Association
has_one :order
belongs_to :user


##shipテーブル
| Column              | Type        | Options                            |
| ------------------- | ----------- | ---------------------------------- |
| postalcode          | string      |  null: false,                      |
| prefectures_id      | integer     |  null: false,                      |
| shipaddess          | string      |  null: false,                      |
| shiptoaddess        | string      |  null: false,                      |
| shipbuilding        | string      |                                    |
| mobile              | string      |  null: false,                      |
| order               | references  |  null: false, foreign_key: true    |

### Association
belong_to :order

##orderテーブル
| Column              | Type              | Options                            |
| ------------------- | ----------------- | ---------------------------------- |
| user_id             | references        |  null: false, foreign_key: true    |
| item_id             | references        |  null: false, foreign_key: true    |
### Association
has_one :ship
belong_to :user
belong_to :item