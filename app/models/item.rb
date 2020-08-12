class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :quality
  belongs_to_active_hash :burden
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery

  validates :user_id, presence: true

  with_options presence: true do
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
    validates :delivery_id
  end

  belongs_to :users
  has_one    :buys
  has_one    :deliverys
end
