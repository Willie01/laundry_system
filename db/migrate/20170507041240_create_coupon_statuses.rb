class CreateCouponStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :coupon_statuses do |t|
      t.string :coupon_status_name

      t.timestamps
    end
  end
end
