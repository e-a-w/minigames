class CreateRanks < ActiveRecord::Migration[7.0]
  def change
    create_table :ranks do |t|
      t.integer :deck_id
      t.string :name
      t.integer :value

      t.timestamps
    end
  end
end
