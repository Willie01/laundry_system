class CreatePermissions < ActiveRecord::Migration[5.0]
  def change
    create_table :permissions do |t|
      t.string :permission_name

      t.timestamps
    end
  end
end
