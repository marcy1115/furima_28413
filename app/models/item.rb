class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :quality, :burden, :prefecture

  #空の投稿を保存出来ない様にする
  validates :name, :text, :image, :price, :category_id, :quality_id,
    :burden_id, :prefecture_id
    presence: true

  #ActiveHashの選択がーーーの時は保存されない様にする
  validates :category_id  , numericality: { other_than: 1 }
  validates :quality_id   , numericality: { other_than: 1 }
  validates :burden_id    , mumericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
end
