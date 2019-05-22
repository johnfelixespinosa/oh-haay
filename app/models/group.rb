class Group < ApplicationRecord
  has_many :user_groups
  has_many :users, through: :user_groups
  require 'pry'

  def self.from_json(json) 
    assignment_hash = {
      name: (json["name"] || ""),
      meetup_group_id: (json["id"] || ""),
      group_link: (json["link"] || ""),
      group_key_photo_url: json.dig('group_photo', 'highres_link') || 
                           json.dig('key_photo', 'highres_link') || 
                           "https://secure.meetupstatic.com/photos/event/2/e/a/d/highres_450131949.jpeg",
      city: (json["city"] || ""),
      country: (json["country"] || "")
    }
    Group.find_or_create_by(assignment_hash)
  end

end
