class CreateStationFactories < ActiveRecord::Migration[5.0]
  def change
    create_table :station_factories do |t|
      t.integer :station_id
      t.integer :factory_id
      t.integer :status

      t.timestamps
    end
  end
end
