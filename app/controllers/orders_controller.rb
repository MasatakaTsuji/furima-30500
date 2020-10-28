class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :create]
  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      render redirect_to root_path
    end
    render :index
  end
end
