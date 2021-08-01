class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards do |t|
      t.integer :number
      t.string :suit
      t.string :img

      t.timestamps
    end
  end
end
