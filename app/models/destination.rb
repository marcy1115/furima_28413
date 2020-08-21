class Destination < ApplicationRecord
  portal = /\A\d{3}[-]\d{4}\z/
  tel    = /\d{10,11}/
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  with_options presences: true do
    validates :portal, format: { with: portal }
    validates :city
    validates :town
    validates :tel,    format: { with: tel }
  end

  belongs_to :items
end
