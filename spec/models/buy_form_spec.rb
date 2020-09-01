require 'rails_helper'

RSpec.describe BuyForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item, user_id: user.id)
    buy  = FactoryBot.create(:buy, user_id: user.id, item_id: item.id)
    @destination = FactoryBot.build(:buy_form, buy_id: buy.id)
  end

  describe '商品購入機能' do
    context '商品が購入できる時' do
      it '必須の項目が全て入力されている時' do
        expect(@destination).to be_valid
      end
      it '郵便番号が[数字3桁]-[数字4桁]の時' do
        @destination.portal = '000-0000'
        expect(@destination).to be_valid
      end
      it '都道府県選択が[---]以外の時' do
        @destination.prefecture_id = 5
        expect(@destination).to be_valid
      end
    end
    context '商品が購入できない時' do
      it '郵便番号がnilの時' do
        @destination.portal = ''
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Portal can't be blank", "Portal is invalid")
      end
      it '郵便番号が[数値3桁]-[数値4桁]以外の時' do
        @destination.portal = '0-0'
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Portal is invalid")
      end
      it '都道府県の選択が[---]の時' do
        @destination.prefecture_id = 1
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it '市区町村がnilの時' do
        @destination.city = nil
        @destination.valid?
        expect(@destination.errors.full_messages).to include("City can't be blank")
      end
      it '番地がnilの時' do
        @destination.town = nil
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Town can't be blank")
      end
      it '電話番号がnilの時' do
        @destination.tel = nil
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Tel can't be blank", "Tel is invalid")
      end
      it '電話番号の数字が9桁以下の時' do
        @destination.tel = '123456789'
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Tel is invalid")
      end
      it '電話番号の数字が12桁以上の時' do
        @destination.tel = '090123412345'
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Tel is invalid")
      end
      it '電話番号に数字以外が入力されている時' do
        @destination.tel = '090-1234-1234'
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Tel is invalid")
      end
    end
  end
end
