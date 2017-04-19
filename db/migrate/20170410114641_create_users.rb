class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :telphone
      t.string :username
      t.string :password
      t.decimal :balance
      t.string :email
      t.string :portrait

      t.timestamps
    end
  end
end
