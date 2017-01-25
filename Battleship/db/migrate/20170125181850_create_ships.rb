class CreateShips < ActiveRecord::Migration[5.0]
  def change
    create_table :ships do |t|
      t.string :type_name
      t.integer :size
      t.string :position
      t.boolean :sunk
      t.integer :board_id

      t.timestamps
    end
  end
end
