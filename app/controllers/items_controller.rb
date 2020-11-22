class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  def index
  end
  
  def new
    @items = Item.new
  end

  def create
    @items = Item.new(item_params)
     if @items.save
      redirect_to root_path
     else
      render :new
     end
  end
  
end

private

def item_params
  params.require(:item).permit(:image, :name, :detail, :price, :status_id, :cost_id, :arae_id, :day_id, :category_id).merge(user_id: current_user.id)
end