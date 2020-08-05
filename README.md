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


## items テーブル
| Column         | Type    | Options                        |
|----------------|---------|--------------------------------|
| item_name      | string  | null: false                    |
| item_text      | text    | null: false                    |
| item_img       | text    | null: false                    |
| price          | integer | null: false                    |

### Association


## buys テーブル
| Column    | Type    | Options     |
|-----------|---------|-------------|

### Association
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
- belongs_to :buys
