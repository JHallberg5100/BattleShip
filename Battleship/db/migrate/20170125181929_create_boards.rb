class CreateBoards < ActiveRecord::Migration[5.0]
  def change
    create_table :boards do |t|
      t.integer :player_id
      t.integer :game_id
      t.string :shots, :default => ""

      t.timestamps
    end
  end
end
