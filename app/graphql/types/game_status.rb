module Types
  class GameStatus < BaseEnum
    ::Game.statuses.keys.each do |status_str|
      value status_str.upcase, status_str.titleize, value: status_str
    end
  end
end