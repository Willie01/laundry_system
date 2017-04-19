class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.string :status
      t.integer :item_num
      t.decimal :totol_price
      t.string :address
      t.date :finished_date

      t.timestamps
    end
  end
end
