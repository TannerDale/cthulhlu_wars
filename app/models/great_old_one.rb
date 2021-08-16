class GreatOldOne < ApplicationRecord
  belongs_to :faction

  def steps_to_awaken
    awaken_steps.split("\n")
  end
end
