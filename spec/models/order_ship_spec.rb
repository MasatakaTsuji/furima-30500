require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @ordership = FactoryBot.build(:order_ship)
  end

  describe '購入機能' do
    context '購入がうまくいくとき' do
      it('token,postalcode,prefecture_id,shipaddess,shiptoaddess,mobileがあれば購入することができる') do
        @ordership.valid?
        expect(@ordership).to be_valid
      end

      it('shipbuildingがなくても購入できる') do
        @ordership.shipbuilding = ''
        @ordership.valid?
        expect(@ordership).to be_valid
      end
    end

    context '購入がうまくいかないとき' do
      it('tokenがないと購入できない') do
        @ordership.token = ''
        @ordership.valid?
        expect(@ordership.errors.full_messages).to include("Token can't be blank")
      end
      it('postalcodeがないと購入できない') do
        @ordership.postalcode = ''
        @ordership.valid?
        expect(@ordership.errors.full_messages).to include("Postalcode can't be blank", 'Postalcode is invalid')
      end
      it('postalcodeが-(ハイフン)がないとき') do
        @ordership.postalcode = '1234567'
        @ordership.valid?
        expect(@ordership.errors.full_messages).to include('Postalcode is invalid')
      end
      it('prefecture_idがないと購入できない') do
        @ordership.prefecture_id = ''
        @ordership.valid?
        expect(@ordership.errors.full_messages).to include("Prefecture can't be blank", 'Prefecture is not a number')
      end
      it('prefecture_idが1だと購入できない') do
        @ordership.prefecture_id = 1
        @ordership.valid?
        expect(@ordership.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it('shipaddessがないと購入できない') do
        @ordership.shipaddess = ''
        @ordership.valid?
        expect(@ordership.errors.full_messages).to include("Shipaddess can't be blank")
      end
      it('shiptoaddessがないと購入できない') do
        @ordership.shiptoaddess = ''
        @ordership.valid?
        expect(@ordership.errors.full_messages).to include("Shiptoaddess can't be blank")
      end
      it('mobileがないと購入できない') do
        @ordership.mobile = ''
        @ordership.valid?
        expect(@ordership.errors.full_messages).to include("Mobile can't be blank", 'Mobile is invalid')
      end
      it('mobileが11桁または10桁でない時購入できない') do
        @ordership.mobile = '123456789'
        @ordership.valid?
        expect(@ordership.errors.full_messages).to include('Mobile is invalid')
      end
      it('mobileが11桁または10桁でない時購入できない') do
        @ordership.mobile = '090123456789'
        @ordership.valid?
        expect(@ordership.errors.full_messages).to include('Mobile is invalid')
      end
    end
  end
end
