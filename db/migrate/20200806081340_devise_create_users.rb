class DeviseCreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string  :nick_name,             null: false
      t.string  :family_name,           null: false
      t.string  :first_name,            null: false
      t.string  :family_kana,           null: false
      t.string  :first_kana,            null: false
      t.string  :email,                 null: false
      t.string  :password,              null: false
      t.string  :password_confirmation, null: false
      t.date    :birth_day,             null: false
    end
  end
end
