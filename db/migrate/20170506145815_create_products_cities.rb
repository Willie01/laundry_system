class CreateProductsCities < ActiveRecord::Migration[5.0]
  def change
    create_table :products_cities do |t|
      t.integer :categories_city_id
      t.integer :product_id
      t.integer :status

      t.timestamps
    end
  end
end
