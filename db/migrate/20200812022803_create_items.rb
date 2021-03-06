class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,          null: false, foreign_key: true
      t.string     :name,          null: false
      t.text       :text,          null: false
      t.integer    :price,         null: false
      t.integer    :category_id,   null: false
      t.integer    :quality_id,    null: false
      t.integer    :burden_id,     null: false
      t.integer    :prefecture_id, null: false
      t.integer    :delivery_id,   null: false
      t.boolean    :sold,          null: false, default: false
      t.timestamps
    end
  end
end
