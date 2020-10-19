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
| birthdat   | datetime | null: false |

### Association
has_many :furimas
has_many :card


##furimasテーブル

| Column                    | Type       | Options                        |
| ------------------------- | ---------- | ------------------------------ |
| product_name              | string     | null: false                    |
| product_description       | string     | null: false                    |
| product_details_category  | string     | null: false                    |
| product_details_status    | text       | null: false                    |
| shipping_burden           | string     | null: false                    |
| shipment_scuree           | string     | null: false                    |
| shipping_days             | datetime   | null: false                    |
| selling_price             | integer    | null: false                    |
| fee                       | integer    | null: false                    |
| profit                    | integer    | null: false                    |
| user                      | references | null: false, foreign_key: true |


### Association
has_many :card
belongs_to :user

##cardsテーブル
| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| card_information    | integer    |  null: false                   |
| exmonth             | integer    |  null: false                   |
| exyear              | integer    |  null: false                   |
| security_code       | integer    |  null: false                   |
| user                | references | null: false, foreign_key: true |
| prototype           | references | null: false, foreign_key: true |

### Association
belong_to :users
belomg_to :furimas
belong_to :ship

##shipsテーブル
| Column              | Type       | Options           |
| ------------------- | ---------- | ----------------- |
| postalcode          | integer    |  null: false      |
| shipcity            | string     |  null: false      |
| shipaddess          | text       |  null: false      |
| shiptoaddess        | text       |  null: false      |
| shipbuilding        | text       |  null: false      |
| mobile              | integer    |  null: false      |

### Association
belong_one :card
