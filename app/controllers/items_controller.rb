class ItemsController < ApplicationController
  before_action :move_to_login, only: [ :new, :edit, :update, :destroy ]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new( item_params )
  end

  private

  def item_params
    params.require(:item).permit( :user, :name, :text, :image, :price,
                                  :category_id, :quality_id, :burden_id,
                                  :prefecture_id, :delivery_id )
  end

  def move_to_login
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

end
