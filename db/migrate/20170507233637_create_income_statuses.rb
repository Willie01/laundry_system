class CreateIncomeStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :income_statuses do |t|
      t.string :income_status_name

      t.timestamps
    end
  end
end
