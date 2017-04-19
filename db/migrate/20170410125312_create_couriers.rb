class CreateCouriers < ActiveRecord::Migration[5.0]
  def change
    create_table :couriers do |t|
      t.string :name
      t.string :telphone
      t.string :portrait
      t.string :status
      t.integer :rank

      t.timestamps
    end
  end
end
