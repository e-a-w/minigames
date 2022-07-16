class AddTypeToGame < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :_type, :integer
  end
end
