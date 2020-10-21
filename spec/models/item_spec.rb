require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '新規商品投稿' do
    context '投稿がうまくいくとき' do
      it 'name,description,selling_price,category_id,status_id,burden_id,prefecture_id,ship_date_id,imageが存在すれば投稿することができる' do
       @item.valid?
      end
    end

    context '投稿がうまくいかないとき' do
      it'nameが空では投稿できない'do
       @item.name = nil
       @item.valid?
       expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it'descriptionが空では投稿できない'do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it'category_idが空では投稿できない'do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category_id can't be blank")
      end
      it'status_idが空では投稿できない'do
      @item.status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Status_id can't be blank")
      end
      it'burden_idが空では投稿できない'do
      @item.burden_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Burden_id can't be blank")
      end
      it'prefecture_idが空では投稿できない'do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture_id can't be blank")
      end
      it'ship_date_idが空では投稿できない'do
      @item.ship_date_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Ship_date_id can't be blank")
      end      
      it'selling_priceが空では投稿できない'do
      @item.selling_price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Selling_price can't be blank")
      end
      it'selling_priceが300円以下では投稿できない'do
      @item.selling_price = 200
      @item.valid?
      expect(@item.errors.full_messages).to include("Selling_price can't be blank")
      end
      it'selling_priceが9999999円以上では投稿できない'do
      @item.selling_price = 1000000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Selling_price can't be blank")
      end
    end
  end
end
