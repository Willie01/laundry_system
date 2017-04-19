class ChangeForCouriers < ActiveRecord::Migration[5.0]
  def change
  	add_column :couriers, :password, :string
  	add_column :couriers, :id_number, :string
  end
end
