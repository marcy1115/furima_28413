class CreateBuys < ActiveRecord::Migration[6.0]
  def change
    create_table :buys do |t|
      t.references :user,  null: false, foreign_key: true
      t.references :item,  null: false, foreign_key: true
      t.text       :image, null: false
      t.integer    :price, null: false
      t.timestamps
    end
  end
end
