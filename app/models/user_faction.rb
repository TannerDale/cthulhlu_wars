class UserFaction < ApplicationRecord
  belongs_to :user
  belongs_to :faction
end
