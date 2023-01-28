# == Schema Information
#
# Table name: games
#
#  id         :uuid             not null, primary key
#  status     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_games_on_status  (status)
#
class Game < ApplicationRecord
  has_many :game_memberships, dependent: :destroy
  has_many :users, through: :game_memberships

  enum status: [:pending, :in_progress, :complete, :canceled]

  MAX_PLAYERS = 2
end
