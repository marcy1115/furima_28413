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
- has_one :buys


## items テーブル
| Column         | Type       | Options                        |
|----------------|------------|--------------------------------|
| user           | references | null: false, foreign_key: true |
| name           | string     | null: false                    |
| text           | text       | null: false                    |
| image          | text       | null: false                    |
| price          | integer    | null: false                    |
| category_id    | integer    | null: false                    |
| quality_id     | integer    | null: false                    |
| burden_id      | integer    | null: false                    |
| prefecture_id  | integer    | null: false                    |
| send_id        | integer    | null: false                    |

### Association
- belongs_to :users
- has_one    :buys
- has_one    :deliverys


## buys テーブル
| Column | Type       | Options                        |
|--------|------------|--------------------------------|
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
- belongs_to :users
- belongs_to :items


## destination
| Column        | Type    | Options                        |
|---------------|---------|--------------------------------|
| portal        | string  | null: false                    |
| prefecture_id | integer | null: false                    |
| city          | string  | null: false                    |
| town          | string  | null: false                    |
| building      | string  |                                |
| tel           | string  | null: false                    |

### Association
- belongs_to :items
