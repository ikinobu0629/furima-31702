# テーブル設計

## users テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| nickname         | string  | null: false |
| email            | string  | null: false |
| password         | string  | null: false |
| first_name       | string  | null: false |
| family_name      | string  | null: false |
| first_name_kana  | string  | null: false |
| family_name_kana | string  | null: false |
| birth_year       | integer | null: false |
| birth_month      | integer | null: false |
| birth_day        | integer | null: false |


### Association

- has_many :items
- belongs_to :purchase
- belongs_to :card

## items テーブル

| Column   | Type      | Options                        |
| -------- | --------- | ------------------------------ |
| name     | string    | null: false                    |
| detail   | staring   | null: false                    |
| status   | staring   | null: false                    |
| cost     | staring   | null: false                    |
| area     | staring   | null: false                    |
| days     | integer   | null: false                    |
| price    | integer   | null: false                    |
| user     | reference | null: false, foreign_key: true |
| category | reference | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :category
- has_many :images

## categories テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ------------|
| category_name | staring    | null: false |


### Association

- has_many :items

## images テーブル

| Column   | Type       | Options                        |
| ---------| ---------- | ------------------------------ |
| image    | integer    | null: false                    |
| items_id | references | null: false, foreign_key: true |


### Association

- belongs_to :item

## purchases テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| postal_code   | integer | null: false |
| prefecture    | staring | null: false |
| city          | staring | null: false |
| address       | integer | null: false |
| phone_number  | integer | null: false |
| building_name | staring |             |

### Association

- belongs_to :user

## cards テーブル

| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| card_id     | integer | null: false |
| date_id     | integer | null: false |
| security_id | integer | null: false |

### Association

- belongs_to :user

