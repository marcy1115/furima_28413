class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :email
      t.string :password
      t.string :familyname
      t.string :firstname
      t.integer :birthday
      t.timestamps
    end
  end
end
