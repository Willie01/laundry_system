class CreateCouponTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :coupon_types do |t|
      t.string :coupon_type_name

      t.timestamps
    end
  end
end
