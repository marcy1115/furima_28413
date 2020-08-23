class BuysController < ApplicationController
  def index
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.find(params[:id])
    @buy = Buy.new(price: order_params[:price])
    if @buy.valid?
      pay_item
      @buy.save
      return redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def order_params
    params.permit(:image, :name, :price, :token, :portal, :prefecture_id,
                  :city, :town, :building, :tel)
  end

  def pay_item
    Payjp.api_key = 'sk_test_47716e19f2788d5ef00c2262'
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
