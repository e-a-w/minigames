class AddDeckIdToGame < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :deck_id, :integer
  end
end
