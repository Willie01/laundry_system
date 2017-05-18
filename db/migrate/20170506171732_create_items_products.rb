class CreateItemsProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :items_products do |t|
      t.integer :product_id
      t.string :item_number
      t.integer :status
      t.integer :logistics_status
      t.decimal :item_price

      t.timestamps
    end
  end
end
