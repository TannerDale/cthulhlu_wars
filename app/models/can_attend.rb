class CanAttend < ApplicationRecord
  belongs_to :game_day
  belongs_to :user
end
