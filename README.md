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
| birthdat   | date     | null: false |

### Association
has_many :items
has_many :purchases


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
has_many :purchase
belongs_to :user


##shipsテーブル
| Column              | Type     | Options                             |
| ------------------- | -------- | ----------------------------------- |
| postalcode          | string   |  null: false,  foreign_key: true    |
| prefectures_id      | integer  |  null: false,  foreign_key: true    |
| shipaddess          | string   |  null: false,  foreign_key: true    |
| shiptoaddess        | string   |  null: false,  foreign_key: true    |
| shipbuilding        | string   |  foreign_key: true                  |
| mobile              | string   |  null: false,  foreign_key: true    |

### Association
belong_to :purchase
belong_to :user
belong_to :item

##purchasesテーブル
| Column              | Type              | Options                            |
| ------------------- | ----------------- | ---------------------------------- |
| user_id             | references        |  null: false, foreign_key: true    |
| item_id             | references        |  null: false, foreign_key: true    |

### Association
has_one :ship