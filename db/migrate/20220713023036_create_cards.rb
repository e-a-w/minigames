class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.integer :deck_id
      t.integer :rank_id
      t.integer :suit_id

      t.timestamps
    end
  end
end
