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
| birth_date       | date    | null: false |


### Association

- has_many :items
- belongs_to :purchase


## items テーブル

| Column   | Type      | Options                        |
| -------- | --------- | ------------------------------ |
| name     | string    | null: false                    |
| detail   | string    | null: false                    |
| status   | string    | null: false                    |
| cost     | string    | null: false                    |
| area     | string    | null: false                    |
| days     | integer   | null: false                    |
| price    | integer   | null: false                    |
| user     | reference | null: false, foreign_key: true |
| category | reference | null: false, foreign_key: true |

### Association

- belongs_to :users


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

- belongs_to :user


