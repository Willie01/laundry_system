class CreateOperators < ActiveRecord::Migration[5.0]
  def change
    create_table :operators do |t|
      t.string :name
      t.string :telphone
      t.integer :status
      t.string :permission

      t.timestamps
    end
  end
end
