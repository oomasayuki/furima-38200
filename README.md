# README
# テーブル設計

## users テーブル

Things you may want to cover:
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| surname            | string | null: false               |
| first_name         | string | null: false               |
| surname_kana       | string | null: false               |
| first_name_kana    | string | null: false               |
| date_of_bith       | date   | null: false               |

### Association

- has_many :exhibits
- has_many :purchases


## addresses テーブル

| Column            | Type       | Options                        |
| ------------------| ---------- | ------------------------------ |
| post_code         | string     | null: false                    |
| delivery_area_id  | integer    | null: false                    |
| municipalities    | string     | null: false                    |
| house_number      | string     | null: false                    |
| building          | string     |                                |
| phone_number      | string     | null: false                    |
| purchase          | references | null: false, foreign_key: true |

## Association

- belongs_to :purchases


## exhibits テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| product_name        | string     | null: false                    |
| explanation         | text       | null: false                    |
| detail_category_id  | integer    | null: false                    |
| detail_situation_id | integer    | null: false                    |
| delivery_charge_id  | integer    | null: false                    |
| delivery_area_id    | integer    | null: false                    |
| delivery_day_id     | integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

## Association

- belongs_to :user
- has_one :purchase


## purchases テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| exhibit   | references | null: false, foreign_key: true |

## Association

- belongs_to :user
- belongs_to :exhibit
- has_many :address
