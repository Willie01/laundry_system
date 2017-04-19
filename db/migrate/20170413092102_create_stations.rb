class CreateStations < ActiveRecord::Migration[5.0]
  def change
    create_table :stations do |t|
      t.integer :factory_id
      t.string :city_id
      t.string :address
      t.string :phone

      t.timestamps
    end
  end
end
