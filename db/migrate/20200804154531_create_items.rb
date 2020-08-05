class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :user_id, foreign_key: true
      t.string  :item_name
      t.text    :item_text
      t.string  :category
      t.string  :item_condition
      t.text    :item_img
      t.timestamps
    end
  end
end
