class Project < ApplicationRecord
  belongs_to :user
  has_many :committers

  def sorted_committers_by_score
    committers.select('*, (success_number - failure_number) as score').order('score desc')
  end
end
