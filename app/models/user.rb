class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  domain                  = /@.+/
  jp_lang                 = /\A[ぁ-んァ-ン一-龥]+\z/
  jp_lang_kana            = /\A[ァ-ン]+\z/
  half_width_alphanumeric = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i

  with_options presence: true do
    validates :nick_name
    validates :email, format: { with: domain }
    validates :birth_day
  end

  with_options presence: true, format: { with: jp_lang } do
    validates :first_name
    validates :last_name
  end

  with_options presence: true, format: { with: jp_lang_kana } do
    validates :first_name_kana
    validates :last_name_kana
  end

  with_options presence: true, format: { with: half_width_alphanumeric } do
    validates :password
    validates :password_confirmation
  end

  has_many :items
  has_one  :buy
end
