class CreateUserAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :user_addresses do |t|
      t.references :user, foreign_key: true
      t.string :address
      t.string :name
      t.string :telphone
      t.boolean :default

      t.timestamps
    end
  end
end
