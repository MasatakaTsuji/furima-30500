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
has_many :furimas
has_many :purchases


##furimasテーブル

| Column            | Type        | Options                        |
| ----------------- | ----------- | ------------------------------ |
| item_name         | string      | null: false                    |
| item_description  | text        | null: false                    |
| integer           | shipping_id | null: false                    |
| selling_price     | integer     | null: false                    |
| user              | references  | null: false, foreign_key: true |


### Association
has_many :card
belongs_to :user


##shipsテーブル
| Column              | Type              | Options           |
| ------------------- | ----------------- | ----------------- |
| postalcode          | string            |  null: false      |
| integer             | prefectures_id    |  null: false      |
| shipaddess          | string            |  null: false      |
| shiptoaddess        | string            |  null: false      |
| shipbuilding        | string            |                   |
| mobile              | string            |  null: false      |

### Association
hase_one :purchases

##purchasesテーブル
| Column              | Type              | Options           |
| ------------------- | ----------------- | ----------------- |
| user_id             | string            |  null: false      |
| furimas_id          | string            |  null: false      |

### Association
belong_to :users
belomg_to :furimas
belong_to :ships