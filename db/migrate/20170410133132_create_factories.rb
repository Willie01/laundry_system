class CreateFactories < ActiveRecord::Migration[5.0]
  def change
    create_table :factories do |t|
      t.string :name
      t.string :phone
      t.string :password
      t.string :address
      t.integer :rank

      t.timestamps
    end
  end
end
