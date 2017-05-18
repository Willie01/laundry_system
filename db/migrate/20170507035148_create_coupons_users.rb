class CreateCouponsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :coupons_users do |t|
      t.integer :user_id
      t.string :status

      t.timestamps
    end
  end
end
