class CreateCouponCities < ActiveRecord::Migration[5.0]
  def change
    create_table :coupon_cities do |t|
      t.integer :coupon_id
      t.integer :city
      t.datetime :start_on
      t.integer :status

      t.timestamps
    end
  end
end
