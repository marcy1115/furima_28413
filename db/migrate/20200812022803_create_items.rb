class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer    :user_id, null: false, foreign_key: true
      t.string     :name,    null: false
      t.text       :text,    null: false
      t.text       :image,   null: false
      t.integer    :price,   null: false
      t.timestamps
    end
  end
end
