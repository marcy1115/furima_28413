class ItemsController < ApplicationController
  before_action :move_to_login, only: [:new, :edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :image, :price,
                                 :category_id, :quality_id, :burden_id,
                                 :prefecture_id, :delivery_id).merge(
                                   user_id: current_user.id
                                 )
  end

  def move_to_login
    redirect_to new_user_session_path unless user_signed_in?
  end
end
