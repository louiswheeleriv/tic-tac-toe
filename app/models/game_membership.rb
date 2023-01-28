# == Schema Information
#
# Table name: game_memberships
#
#  id         :uuid             not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  game_id    :uuid             not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_game_memberships_on_game_id  (game_id)
#  index_game_memberships_on_user_id  (user_id)
#
class GameMembership < ApplicationRecord
  belongs_to :game
  belongs_to :user
end
