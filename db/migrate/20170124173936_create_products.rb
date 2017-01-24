class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.integer :unit_price
      t.integer :warehouse_quantity
      t.integer :store_quantity

      t.timestamps
    end
  end
end
