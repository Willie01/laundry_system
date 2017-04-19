class CreateCoupons < ActiveRecord::Migration[5.0]
  def change
    create_table :coupons do |t|
      t.references :user, foreign_key: true
      t.decimal :price
      t.date :deadline
      t.string :type

      t.timestamps
    end
  end
end
