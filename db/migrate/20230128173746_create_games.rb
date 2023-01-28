class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games, id: :uuid do |t|
      t.integer :status, null: false

			t.timestamps
    end

    add_index :games, :status
  end
end
