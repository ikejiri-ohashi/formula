# README

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

## questions テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| url    | string     | null: false                    |
| time   | integer    | null: false                    |
| text   | string     | null: false                    |
| user   | references | null: false, foreign_key: true |

## answers テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| text     | string     | null: false                    |
| user     | references | null: false, foreign_key: true |
| question | references | null: false, foreign_key: true |

## categories テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| name    | string     | null: false                    |

## questions_categories テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| question  | references | null: false, foreign_key: true |
| category  | references | null: false, foreign_key: true |