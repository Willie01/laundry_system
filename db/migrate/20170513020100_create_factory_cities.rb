class CreateFactoryCities < ActiveRecord::Migration[5.0]
  def change
    create_table :factory_cities do |t|
      t.integer :city_id
      t.decimal :longitude
      t.decimal :latitude
      t.integer :status

      t.timestamps
    end
  end
end
