# テーブル設計

## users テーブル

| Column    | Type   | Options     |
|-----------|--------|-------------|
| name      | string | null: false |
| email     | string | null: false |
| password  | string | null: false |
| nick_name | string | null: false |
| birth_day | string | null: false |

### Association
- has_many :items


## items テーブル
| Column         | Type    | Options                        |
|----------------|---------|--------------------------------|
| item_name      | string  | null: false                    |
| item_text      | text    | null: false                    |
| category       | string  | null: false                    |
| item_condition | string  | null: false                    |
| item_img       | text    | null: false                    |
| use_id         | integer | null: false, foreign_key: true |
| buy_id         | integer | null: false, foreign_key: true |

### Association
- belongs_to :users
- belongs_to :buys


## buys テーブル
| Column    | Type    | Options     |
|-----------|---------|-------------|
| price     | integer | null: false |

### Association
- has_many :items
- has_one  :deliverys


## deliverys
| Column    | Type    | Options                        |
|-----------|---------|--------------------------------|
| portal    | string  | null: false                    |
| address   | string  | null: false                    |
| tel       | string  | null: false                    |
| buy_id    | integer | null: false, foreign_key: true |

### Association
- belongs_to :buys
