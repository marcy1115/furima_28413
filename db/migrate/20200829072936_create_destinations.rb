class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.references :buy,           null: false, foreign_key: true 
      t.string     :portal,        null: false
      t.integer    :prefecture_id, null: false
      t.string     :city,          null: false
      t.string     :town,          null: false
      t.string     :building
      t.string     :tel,           null: false
      t.timestamps
    end
  end
end
