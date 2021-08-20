class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true
  validates_presence_of :password, require: true
  validates_confirmation_of :password, on: :create

  has_secure_password

  enum role: %w(pleb admin)

  has_many :user_factions, dependent: :destroy
  has_many :factions, through: :user_factions

  has_many :can_attends, dependent: :destroy
  has_many :game_days, through: :can_attends

  has_many :strategies, dependent: :destroy

  def liked_factions
    factions.order(:name)
  end
end
