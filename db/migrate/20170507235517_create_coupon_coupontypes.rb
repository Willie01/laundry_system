class CreateCouponCoupontypes < ActiveRecord::Migration[5.0]
  def change
    create_table :coupon_coupontypes do |t|
      t.integer :coupon_id
      t.integer :coupon_type_id
      t.integer :status

      t.timestamps
    end
  end
end
