class Status < ApplicationRecord
  belongs_to :user, through: :user_group_statuses
end
