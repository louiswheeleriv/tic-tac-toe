class CreateGameMemberships < ActiveRecord::Migration[6.0]
  def change
    create_table :game_memberships, id: :uuid do |t|
      t.bigint :user_id, null: false
      t.uuid :game_id, null: false

			t.timestamps
    end

    add_index :game_memberships, :user_id
    add_index :game_memberships, :game_id
  end
end
