class CreatePortraits < ActiveRecord::Migration[5.0]
  def change
    create_table :portraits do |t|
      t.string :name
      t.string :url
      t.integer :status

      t.timestamps
    end
  end
end
