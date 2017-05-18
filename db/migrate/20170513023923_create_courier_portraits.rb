class CreateCourierPortraits < ActiveRecord::Migration[5.0]
  def change
    create_table :courier_portraits do |t|
      t.string :courier_id
      t.string :portrait_id
      t.integer :status

      t.timestamps
    end
  end
end
