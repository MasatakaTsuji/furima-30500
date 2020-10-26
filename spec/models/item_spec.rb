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
      it 'nameが空では投稿できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionが空では投稿できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'category_idが空では投稿できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", 'Category is not a number')
      end

      it 'category_idが1では投稿できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end

      it 'status_idが空では投稿できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank", 'Status is not a number')
      end
      it 'status_idが1では投稿できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 1')
      end

      it 'burden_idが空では投稿できない' do
        @item.burden_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden can't be blank", 'Burden is not a number')
      end
      it 'burden_idが1では投稿できない' do
        @item.burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Burden must be other than 1')
      end

      it 'prefecture_idが空では投稿できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank", 'Prefecture is not a number')
      end
      it 'prefecture_idが1では投稿できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it 'ship_date_idが空では投稿できない' do
        @item.ship_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship date can't be blank", 'Ship date is not a number')
      end
      it 'ship_date_idが1では投稿できない' do
        @item.ship_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Ship date must be other than 1')
      end

      it 'selling_priceが空では投稿できない' do
        @item.selling_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price can't be blank", 'Selling price is invalid', 'Selling price is not a number')
      end
      it 'selling_priceが300円以下では投稿できない' do
        @item.selling_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price must be greater than or equal to 300')
      end
      it 'selling_priceが9999999円以上では投稿できない' do
        @item.selling_price = 1_000_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price must be less than or equal to 9999999')
      end
    end
  end
end
