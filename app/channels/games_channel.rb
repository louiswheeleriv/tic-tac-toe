class GamesChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'games_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def self.broadcast_new_game(game)
    ActionCable.server.broadcast(
      'games_channel',
      {
        game: game.attributes.merge(
          users: game.users.map do |user|
            {
              id: user.id,
              email: user.email
            }
          end
        )
      }
    )
  end
end
