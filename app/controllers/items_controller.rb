class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @item = Item.all
    @item = Item.order("created_at DESC")
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

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end

  private
  def item_params
    params.require(:item).parmit(:name,:description,:selling_price,:category_id,:status_id,:burden_id,:prefectures_id ,:ship_date_id,:image).merge(user_id: current_user.id)
  end

end
