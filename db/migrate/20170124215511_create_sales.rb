class CreateSales < ActiveRecord::Migration[5.0]
  def change
    create_table :sales do |t|
      t.integer :discount
      t.references :product
      t.integer :status, default: 1
      t.timestamps
    end
  end
end
