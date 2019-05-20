class Group < ApplicationRecord
  has_many :user_groups
  has_many :users, through: :user_groups

  def self.from_json(json)
    assignment_hash = {
      name: (json["name"] || ""),
      meetup_group_id: (json["id"] || ""),
      group_link: (json["link"] || ""),
      group_key_photo_url: json.fetch("highres_link", "empty"),
      city: (json["city"] || ""),
      country: (json["country"] || "")
    }
    Group.find_or_create_by(assignment_hash)
  end
end
