class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :quality, :burden,
                         :prefecture, :send

  with_options puresence: true do
    validates :user_id, foreign_key: true
    validates :name
    validates :text
    validates :image
    validates :price
  end

  with_options presence: true, numericality: {other_than: 1 } do
    validates :category_id
    validates :quality_id
    validates :burden_id
    validates :prefecture_id
    validates :send_id
  end
end
