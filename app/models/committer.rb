class Committer < ApplicationRecord
  belongs_to :project

  def self.find_or_create_by_name name
    Committer.where(name: name).first_or_create
  end
end
