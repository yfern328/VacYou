class CreateVacuums < ActiveRecord::Migration[5.1]
  def change
    create_table :vacuums do |t|
      t.string :name
      t.integer :rental_price
      t.integer :purchase_price
      t.integer :rental_stock
      t.integer :purchase_stock

      t.timestamps
    end
  end
end
