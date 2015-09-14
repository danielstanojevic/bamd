class CreateGameMechanics < ActiveRecord::Migration
  def change
    create_table :game_mechanics do |t|
      t.integer :mechanic_id
      t.integer :game_id

      t.timestamps null: false
    end
  end
end
