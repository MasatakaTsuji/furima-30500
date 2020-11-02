class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :update, :show, :destroy]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render action: :new
    end

  end

  def edit
    redirect_to root_path unless current_user == @item.user
    if @item.order.present?
      redirect_to root_path
    end
  end

  def update
    if item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    if current_user == @item.user
      @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :selling_price, :category_id, :status_id, :burden_id, :prefecture_id, :ship_date_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
