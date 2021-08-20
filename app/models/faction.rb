class Faction < ApplicationRecord
  has_many :great_old_ones, dependent: :destroy
  has_many :cultists, dependent: :destroy
  has_many :spellbooks, dependent: :destroy
  has_many :spellbook_requirements, dependent: :destroy
  has_many :monsters, dependent: :destroy

  has_many :user_factions
  has_many :users, through: :user_factions
end
