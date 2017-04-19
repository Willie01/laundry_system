class ChangeForOrders < ActiveRecord::Migration[5.0]
  def change
  	add_column :orders, :finished_date, :date
  	add_column :user_addresses, :user_id, :integer
  end
end
