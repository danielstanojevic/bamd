class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.string :comment
      t.integer :stars
      t.integer :game_id
      t.integer :author_id

      t.timestamps null: false
    end
  end
end
