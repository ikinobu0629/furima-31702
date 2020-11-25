class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_tweet, only: [:edit, :show, :update, :destroy]

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
  end

  def edit
     if @item.user != current_user
      redirect_to root_path
     end
  end

  def update
     if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.user == current_user
      @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end
  
end

private

def item_params
  params.require(:item).permit(:image, :name, :detail, :price, :status_id, :cost_id, :area_id, :day_id, :category_id).merge(user_id: current_user.id)
end

def set_tweet
  @item = Item.find(params[:id])
end