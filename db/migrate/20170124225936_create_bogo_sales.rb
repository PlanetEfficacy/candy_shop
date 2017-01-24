class CreateBogoSales < ActiveRecord::Migration[5.0]
  def change
    create_table :bogo_sales do |t|
      t.references :product
      t.integer :status, default: 1

      t.timestamps
    end
  end
end
