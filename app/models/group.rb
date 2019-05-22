class Group < ApplicationRecord
  has_many :user_groups
  has_many :users, through: :user_groups
  require 'pry'

  def self.from_json(json)
    @photo = find_photo(json) 
    assignment_hash = {
      name: (json["name"] || ""),
      meetup_group_id: (json["id"] || ""),
      group_link: (json["link"] || ""),
      group_key_photo_url: @photo,
      city: (json["city"] || ""),
      country: (json["country"] || "")
    }
    Group.find_or_create_by(assignment_hash)
    # binding.pry
  end

  def self.find_photo(json)
    @photo_url = ""
    if json.dig(:group_photo, :highres_link) != nil
      @photo_url = json.dig(:group_photo, :highres_link)
    elsif json.dig(:key_photo, :highres_link) != nil
      @photo_url = json.dig(:key_photo, :highres_link)
    else @photo_url = "https://secure.meetupstatic.com/photos/event/2/e/a/d/highres_450131949.jpeg"
    end
    return @photo_url
  end

end
