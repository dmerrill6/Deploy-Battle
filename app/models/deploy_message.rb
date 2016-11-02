class DeployMessage < ApplicationRecord
  belongs_to :project
  
  def assign_committer committer_name
    committer = project.committers.find_or_create_by_name committer_name
    case message_type
    when "start"
      committer.push_number += 1
    when "success"
      committer.success_number += 1
    when "failure"
      committer.failure_number += 1
    end
    committer.save
  end
end
