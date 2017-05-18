class CreateUserPortraits < ActiveRecord::Migration[5.0]
  def change
    create_table :user_portraits do |t|
      t.string :user_id
      t.integer :status

      t.timestamps
    end
  end
end
