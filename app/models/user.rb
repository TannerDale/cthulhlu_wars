class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true
  validates_presence_of :password, require: true
  validates_confirmation_of :password, on: :create

  has_secure_password

  enum role: %w(pleb admin)

  has_many :user_factions
  has_many :factions, through: :user_factions
end
