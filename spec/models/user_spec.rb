require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー管理機能' do
    context 'ユーザーが登録できる時' do
      it '全ての項目が入力されている時' do
        expect(@user).to be_valid
      end
      it 'メールアドレスに＠が含まれている時' do
        @user.email = 'b@b'
        expect(@user).to be_valid
      end
      it 'パスワードが6文字以上、半角英数字混合、パスワードと確認用パスワードが同一である時' do
        @user.password = '12345a'
        @user.password_confirmation = '12345a'
        expect(@user).to be_valid
      end
      it '苗字、名前が全角ひらがな・カタカナ・漢字である時' do
        @user.first_name = 'かカ火'
        @user.last_name = 'きキ気'
        expect(@user).to be_valid
      end
      it '苗字、名前が全角カタカナである時' do
        @user.first_name_kana = 'カカカ'
        @user.last_name_kana = 'キキキ'
        expect(@user).to be_valid
      end
    end

    context 'ユーザーが登録できない時' do
      it 'ニックネームがnilの時' do
        @user.nick_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nick name can't be blank")
      end
      it 'メールアドレスに＠が含まれていない時' do
        @user.email = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid', 'Email is invalid')
      end
      it 'パスワードが5文字以下の時' do
        @user.password = '1234a'
        @user.password_confirmation = '1234a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'パスワードが半角英数字混合でない時' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid', 'Password confirmation is invalid')
      end
      it 'パスワードが全角英数字混合の時' do
        @user.password = '１２３４５A'
        @user.password_confirmation = '１２３４５A'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid', 'Password confirmation is invalid')
      end
      it 'パスワード(確認用)がパスワードと同一でない時' do
        @user.password_confirmation = '12345a'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '苗字、名前が半角の時' do
        @user.first_name = 'aaa'
        @user.last_name = 'iii'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid', 'Last name is invalid')
      end
      it '苗字カナ、名前カナが、カタカナ以外の時' do
        @user.first_name_kana = 'aあ亜'
        @user.last_name_kana = 'iい井'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid', 'Last name kana is invalid')
      end
      it '苗字カナ、名前カナが、半角カタカナの時' do
        @user.first_name_kana = 'ｱｱｱ'
        @user.last_name_kana = 'ｲｲｲ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid', 'Last name kana is invalid')
      end
      it '生年月日がnilの時' do
        @user.birth_day = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end
