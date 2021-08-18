# README

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association
* has_many :answers
* has_many :questions

## questions テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| url      | string     | null: false                    |
| time     | string     | null: false                    |
| text     | string     | null: false                    |
| category | integer    | null: false                    |
| user     | references | null: false, foreign_key: true |

### Association
* belongs_to :user
* has_many :answers

## answers テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| text     | text       | null: false                    |
| user     | references | null: false, foreign_key: true |
| question | references | null: false, foreign_key: true |

### Association
* belongs_to :user
* belongs_to :question