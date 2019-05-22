class Event < ApplicationRecord
  belongs_to :group

  def self.from_json(json) 
    assignment_hash = {
      name: (json["name"] || ""),
      local_date: (json["id"] || ""),
      local_time: (json["link"] || ""),
      venue: (json["venue"]["address_1"] || ""),
      city: (json["venue"]["city"] || ""),
      country: (json["venue"]["country"] || "")
    }
    Event.find_or_create_by(assignment_hash)
  end

end