class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :quality

  #空の投稿を保存出来ない様にする
  validates :name, :text, :image, :price, :category_id, :quality_id, presence: true

  #カテゴリーの選択がーーーの時は保存されない様にする
  validates :category_id, numericality: { other_than: 1 }
  #商品状態の選択がーーーの時は保存されない様にする
  validates :quality_id,  numericality: { other_than: 1 }
end
