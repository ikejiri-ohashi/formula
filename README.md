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
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |

### Association
* belongs_to :user
* has_many :questions
* has_many :categories

## answers テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| text     | text       | null: false                    |
| user     | references | null: false, foreign_key: true |
| question | references | null: false, foreign_key: true |

### Association
* belongs_to :user
* belongs_to :question

## categories テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| name    | string     | null: false                    |

### Association
* has_many questions

## questions_categories テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| question  | references | null: false, foreign_key: true |
| category  | references | null: false, foreign_key: true |

### Association
* belongs_to :question
* belongs_to :categories