module Types
  class Game < Types::BaseObject
    field :id, ID, null: false
    field :status, GameStatus, null: false
    field :open_player_slots, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :users, [User], null: false

    def open_player_slots
      ::Game::MAX_PLAYERS - object.users.count
    end

  end
end
