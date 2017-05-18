class CreateCourierStations < ActiveRecord::Migration[5.0]
  def change
    create_table :courier_stations do |t|
      t.integer :courier_id
      t.integer :station_id
      t.integer :status

      t.timestamps
    end
  end
end
