class CreateUserPays < ActiveRecord::Migration[5.0]
  def change
    create_table :user_pays do |t|
      t.integer :user_id
      t.integer :status
      t.decimal :pay

      t.timestamps
    end
  end
end
