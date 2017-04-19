class CreateRankComments < ActiveRecord::Migration[5.0]
  def change
    create_table :rank_comments do |t|
      t.references :order, foreign_key: true
      t.integer :courier_rank
      t.integer :factory_rank
      t.text :comment

      t.timestamps
    end
  end
end
