class CreateOperatorPermissions < ActiveRecord::Migration[5.0]
  def change
    create_table :operator_permissions do |t|
      t.integer :operator_id
      t.integer :permission_id
      t.integer :status

      t.timestamps
    end
  end
end
