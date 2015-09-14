class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :owner_id
      t.integer :game_id

      t.timestamps null: false
    end
  end
end
