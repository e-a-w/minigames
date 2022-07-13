class CreateSuits < ActiveRecord::Migration[7.0]
  def change
    create_table :suits do |t|
      t.integer :deck_id
      t.string :name
      t.string :color

      t.timestamps
    end
  end
end
