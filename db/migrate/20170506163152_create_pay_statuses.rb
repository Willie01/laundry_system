class CreatePayStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :pay_statuses do |t|
      t.string :pay_status_name

      t.timestamps
    end
  end
end
