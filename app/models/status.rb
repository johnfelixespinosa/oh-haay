class Status < ApplicationRecord
  has_one :user, through: :user_group_status
  has_one :group, through: :user_group_status

  def self.from_json(json) 
    assignment_hash = {
      working_on: (json["working_on"] || ""),
      need: (json["need"] || ""),
      offering: (json["offering"] || "")
    }
    Status.find_or_create_by(assignment_hash)
  end
end