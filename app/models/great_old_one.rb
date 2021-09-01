class GreatOldOne < ApplicationRecord
  belongs_to :faction

  scope :ordered, -> {
    order(:name)
  }

  def steps_to_awaken
    awaken_steps.split("\n")
  end
end
