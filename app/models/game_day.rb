class GameDay < ApplicationRecord
  validates_presence_of :day, require: true

  has_many :can_attends, dependent: :destroy
  has_many :users, through: :can_attends

  def formatted
    day.strftime("%b %d at %I:%M%p")
  end

  def can_attend
    format_names(users)
  end

  def cannot_attend
    cannot = User.all.select do |user|
      !users.include?(user)
    end
    format_names(cannot)
  end

  def format_names(user_objs)
    user_objs.map(&:username).to_sentence
  end

  def self.days
    GameDay.order(:day)
  end
end
