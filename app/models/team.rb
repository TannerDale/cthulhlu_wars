class Team < ApplicationRecord
  has_secure_password

  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships
end
