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
- has_many :transactions


## items テーブル

| Column    | Type      | Options                        |
| --------- | --------- | ------------------------------ |
| name      | string    | null: false                    |
| detail    | text      | null: false                    |
| status_id | integer   | null: false                    |
| cost_id   | integer   | null: false                    |
| area_id   | integer   | null: false                    |
| day_id    | integer   | null: false                    |
| price     | integer   | null: false                    |
| user      | reference | null: false, foreign_key: true |
| category  | integer   | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :transactions


## purchases テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| postal_code   | integer | null: false |
| prefecture    | string  | null: false |
| city          | string  | null: false |
| address       | integer | null: false |
| phone_number  | string  | null: false |
| building_name | string  |             |

### Association

- belongs_to :transaction

## transactions テーブル

| Column  | Type       | Options                       |
| --------| ---------- | ----------------------------- |
| user_id | reference  | null: false, foreign_key: true|
| item_id | reference  | null: false, foreign_key: true|

### Association

- belongs_to :item
- belongs_to :user
- belongs_to :purchase
