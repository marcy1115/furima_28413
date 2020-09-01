class BuyForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :portal, :prefecture_id, :city, :town, :building, :tel, :token, :id

  portal  = /\A\d{3}[-]\d{4}\z/
  tel     = /\A\d{10,11}\z/

  with_options presence: true do
    validates :portal,        format: { with: portal }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :town
    validates :tel, format: { with: tel }
    validates :token
  end

  def save
    # item idを取得する
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Destination.create(portal: portal, prefecture_id: prefecture_id, city: city, town: town, building: building, tel: tel, buy_id: buy.id)
  end
end
