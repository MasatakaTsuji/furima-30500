class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

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
    @item = Item.find(params[:id])
    redirect_to root_path unless current_user == @item.user
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      redirect_to action: :show
    else
      @item = Item.find(params[:id])
      render :edit
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def destroy
    # item = Item.find(params[:id])
    # item.destroy
    # redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :selling_price, :category_id, :status_id, :burden_id, :prefecture_id, :ship_date_id, :image).merge(user_id: current_user.id)
  end
end
