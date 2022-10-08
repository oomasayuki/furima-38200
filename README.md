# README
# テーブル設計

## users テーブル

Things you may want to cover:
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| name               | string | null: false               |
| name_furigana      | string | null: false               |
| date_of_bith       | string | null: false               |

## comments テーブル

| Column    | Type       | Options                        |
| ----------| ---------- | ------------------------------ |
| content   | text       | null: false                    |
| exhibit   | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

## exhibits テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| product_name        | text       | null: false                    |
| explanation         | text       | null: false                    |
| detail_category     | string     | null: false                    |
| detail_situation    | string     | null: false                    |
| delivery_charge     | string     | null: false                    |
| delivery_area       | string     | null: false                    |
| delivery_days       | string     | null: false                    |
| price               | string     | null: false                    |
| user                | references | null: false, foreign_key: true |