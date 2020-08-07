require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build( :user )
  end

  describe "ユーザー新規登録" do
    context "新規登録がうまくいく場合" do
      it "必須項目の値が全て存在している事" do
        
      end
      it "メールアドレスが一意性である事" do
      end
      it "メールアドレスに@が含まれている事" do
      end
      it "パスワードが6文字以上である事" do
      end
      it "パスワードが半角英数字混合である事" do
      end
      it "パスワードとパスワード(確認用)が同一パスワードである事" do
      end
      it "ユーザー苗字は全角(漢字・ひらがな・カタカナ)で入力している事" do
      end
      it "ユーザー名前は全角(漢字・ひらがな・カタカナ)で入力している事" do
      end
      it "ユーザー苗字のフリガナは全角(カタカナ)で入力している事" do
      end
      it "ユーザー名前のフリガナは全角(カタカナ)で入力している事" do
      end
    end

    context "新規登録がうまくいかない場合" do
      it "ニックネームの値がnullの時" do
      end
      it "メールアドレスの値がnullの時" do
      end
      it "メールアドレスに@が含まれていない時" do
      end
      it "パスワードが5文字以下である事" do
      end
      it "パスワードが半角英数字混合でない時" do
      end
      it "パスワードとパスワード(確認用)が同一パスワードでない時" do
      end
      it "ユーザー苗字が半角の入力の時" do
      end
      it "ユーザー名前が半角の入力の時" do
      end
      it "ユーザー苗字のフリガナが半角の入力の時" do
      end
      it "ユーザー名前のフリガナが半角の入力の時" do
      end
    end
  end
end
