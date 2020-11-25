class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
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

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
     if @item.user == current_user
      render :edit
     else
      redirect_to root_path
     end
  end

  def update
    @item = Item.find(params[:id])
     if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end
  
end

private

def item_params
  params.require(:item).permit(:image, :name, :detail, :price, :status_id, :cost_id, :area_id, :day_id, :category_id).merge(user_id: current_user.id)
end