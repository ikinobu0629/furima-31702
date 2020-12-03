# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| first_name         | string  | null: false |
| family_name        | string  | null: false |
| first_name_kana    | string  | null: false |
| family_name_kana   | string  | null: false |
| birth_date         | date    | null: false |


### Association

- has_many :items
- has_many :item_purchases


## items テーブル

| Column      | Type      | Options                        |
| ----------- | --------- | ------------------------------ |
| name        | string    | null: false                    |
| detail      | text      | null: false                    |
| status_id   | integer   | null: false                    |
| cost_id     | integer   | null: false                    |
| area_id     | integer   | null: false                    |
| day_id      | integer   | null: false                    |
| price       | integer   | null: false                    |
| user        | reference | null: false, foreign_key: true |
| category_id | integer   | null: false                    |

### Association

- belongs_to :user
- has_one :item_purchase


## purchases テーブル

| Column         | Type      | Options                        |
| -------------- | --------- | ------------------------------ |
| postal_code    | string    | null: false                    |
| area_id        | integer   | null: false                    |
| city           | string    | null: false                    |
| address        | string    | null: false                    |
| phone_number   | string    | null: false                    |
| building_name  | string    |                                |
| item_purchase  | reference | null: false, foreign_key: true |

### Association

- belongs_to :item_purchase

## item_purchases テーブル

| Column  | Type       | Options                       |
| --------| ---------- | ----------------------------- |
| user    | reference  | null: false, foreign_key: true|
| item    | reference  | null: false, foreign_key: true|

### Association

- belongs_to :item
- belongs_to :user
- has_one :purchase
