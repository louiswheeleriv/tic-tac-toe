module Types
  class GameSortInput < BaseInputObject
    argument :field, GameSortField, required: true
    argument :direction, SortDirection, required: true
  end
end