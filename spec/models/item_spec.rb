require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    user  = FactoryBot.create( :user )
    @item = FactoryBot.build( :item, user_id: user.id )
    @item.image = fixture_file_upload('public/images/star.png')
    
  end

  describe '出品投稿機能' do
    context '出品投稿ができる時' do
      it '全ての項目が入力されていている時' do
        expect(@item).to be_valid
      end
      it '商品名が40文字以内の時' do
        @item.name = 'a' * 40
        expect(@item).to be_valid
      end 
      it '商品の説明が1000文字以内の時' do
        @item.text = 'a' * 1000
        expect(@item).to be_valid
      end
      it '商品価格が300円以上の時' do
        @item.price = 300
        expect(@item).to be_valid
      end
      it '商品価格が9,999,999円以内の時' do
        @item.price = 9999999
        expect(@item).to be_valid
      end
    end
    
    context '出品投稿ができない時' do
      it '商品名がnilの時' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品名が40文字より多い時' do
        @item.name = 'a' * 41
        @item.valid?
        expect(@item.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
      end
      it '商品説明がnilの時' do
        @item.text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it '商品説明が1000文字より多い時' do
        @item.text = 'a' * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include("Text is too long (maximum is 1000 characters)")
      end
      it 'カテゴリー選択が「---」の時' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it '商品の状態選択が「---」の時' do
        @item.quality_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Quality must be other than 1")
      end
      it '配送料負担の選択が「---」の時' do
        @item.burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden must be other than 1")
      end
      it '発送元地域の選択が「---」の時' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it '発送まで日数の選択が「---」の時' do
        @item.delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery must be other than 1")
      end
      it '価格がnilの時' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が299円以下の時' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it '価格が9,999,999円以上の時' do
        @item.price = 10000000
        @item.valid?
        binding.pry
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
  end
end
