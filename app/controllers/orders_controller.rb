class OrdersController < ApplicationController
  
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      render redirect_to root_path
    end
     render :new
  end
end
