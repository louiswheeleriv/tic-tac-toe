module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

		field :games, [Types::Game], null: false do
			argument :status, GameStatus, required: false
			argument :min_open_player_slots, Integer, required: false
			argument :sort_by, [GameSortInput], required: false
		end

		def games(status: nil, min_open_player_slots: nil, sort_by: [])
			scope = ::Game.all
			scope = scope.where(status: status) if status.present?
			scope = scope.left_joins(:game_memberships).group('games.id').having('count(game_id) <= ?', ::Game::MAX_PLAYERS - min_open_player_slots) if min_open_player_slots.present?
			scope = sort_scope(scope, sort_by) if sort_by.present?
			scope
		end

		def sort_scope(scope, sort_by = [])
			sort_by.each do |sort|
				scope = scope.order(sort.field => sort.direction)
			end
			scope
		end

  end
end
