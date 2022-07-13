class CreateDecks < ActiveRecord::Migration[7.0]
  def change
    create_table :decks do |t|
      t.integer :_type
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
