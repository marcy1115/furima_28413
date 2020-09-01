class BuysController < ApplicationController
  before_action :buy_wall, only: [:index]

  def index
    @item = Item.find(params[:id])
    @buy = BuyForm.new(order_params)
  end

  def new
  end

  def create
    @item = Item.find(params[:id])
    @buy = BuyForm.new(order_params)
    if @buy.valid?
      pay_item
      @buy.save
      @item.update(sold: true)
      return redirect_to root_path
    else
     render 'index' 
    end
  end

  private

  def order_params
    params.permit(:portal,:prefecture_id,
                  :city,:town,:building,:tel,:token).merge(
                    user_id: current_user.id, item_id: params[:id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end

  def buy_wall
    @item = Item.find(params[:id])
    unless current_user.id != @item.id && user_signed_in? #商品投稿ユーザーとログインユーザーが不一致、ログイン済みなら unless内を読みこむ
      redirect_to root_path
    end
  end
end
