class CreateCouponruleCities < ActiveRecord::Migration[5.0]
  def change
    create_table :couponrule_cities do |t|
      t.integer :coupon_id
      t.integer :city
      t.datetime :start_on
      t.datetime :end_on
      t.integer :status

      t.timestamps
    end
  end
end
