class CreatePriceRules < ActiveRecord::Migration[5.0]
  def change
    create_table :price_rules do |t|
      t.decimal :price
      t.string :type
      t.datetime :start_time
      t.integer :city_id

      t.timestamps
    end
  end
end
