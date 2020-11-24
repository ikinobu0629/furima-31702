class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  def index
    @items = Item.all.order("created_at DESC")
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
     if @item.save
      redirect_to root_path
     else
      render :new
     end
  end
  
end

private

def item_params
  params.require(:item).permit(:image, :name, :detail, :price, :status_id, :cost_id, :area_id, :day_id, :category_id).merge(user_id: current_user.id)
end