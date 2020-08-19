class ItemsController < ApplicationController
  before_action :move_to_login, only: [:new, :create]
  before_action :set_item, only: [:show, :destroy, :edit, :update]

  def index
    @items = Item.all
    @items = Item.order('created_at DESC')
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

  def show
  end

  def edit
  end

  def destroy
    begin
      @item.destroy
      redirect_to root_path
    rescue StandardError => e
      redirect_to root_path
    end
  end

  def update
    begin
      @item.update(item_params)
      if @item.save
        redirect_to root_path
      else
        render :edit
      end
    rescue StandardError => e
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :price,
                                 :category_id, :quality_id, :burden_id,
                                 :prefecture_id, :delivery_id).merge(
                                   user_id: current_user.id
                                 )
  end

  def move_to_login
    redirect_to new_user_session_path unless user_signed_in?
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
