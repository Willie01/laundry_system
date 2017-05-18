class CreateCategoriesCities < ActiveRecord::Migration[5.0]
  def change
    create_table :categories_cities do |t|
      t.integer :category_id
      t.integer :city_id
      t.integer :status

      t.timestamps
    end
  end
end
