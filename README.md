# テーブル設計

## users テーブル

| Column      | Type   | Options     |
|-------------|--------|-------------|
| nick_name   | string | null: false |
| family_name | string | null: false |
| first_name  | string | null: false |
| family_kana | string | null: false |
| first_kana  | string | null: false |
| email       | string | null: false |
| password    | string | null: false |
| birth_day   | date   | null: false |

### Association
- has_many :items
- has_many :buys


## items テーブル
| Column         | Type    | Options                        |
|----------------|---------|--------------------------------|
| name           | string  | null: false                    |
| text           | text    | null: false                    |
| image          | text    | null: false                    |
| price          | integer | null: false                    |
| fee            | integer | null: false                    |
| gain           | integer | null: false                    |

### Association
- belong_to :users
- belong_to :buys


## buys テーブル
| Column    | Type    | Options                        |
|-----------|---------|--------------------------------|
| user_id   | integer | null: false, foreign_key: true |
| item_id   | integer | null: false, foreign_key: true |

### Association
- has_many :user, through
- has_many :items
- has_one  :deliverys


## deliverys
| Column    | Type    | Options                        |
|-----------|---------|--------------------------------|
| portal    | string  | null: false                    |
| state     | string  | null: false                    |
| city      | string  | null: false                    |
| town      | string  | null: false                    |
| building  | string  | null: false                    |
| tel       | string  | null: false                    |

### Association
- belongs_to :items
