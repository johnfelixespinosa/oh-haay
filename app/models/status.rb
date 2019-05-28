class Status < ApplicationRecord
  has_one :user, through: :user_group_status
  has_one :group, through: :user_group_status
end