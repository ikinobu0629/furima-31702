class ItemPurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_tweet, only: [:index, :create]

  def index
    @order = Order.new
    if @item.user = current_user
      redirect_to root_path
    end
  end

  def create
    @order = Order.new(item_purchase_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def item_purchase_params
    params.require(:order).permit(:postal_code, :area_id, :city, :address, :phone_number, :building_name).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_tweet
    @item = Item.find(params[:item_id])
  end

end