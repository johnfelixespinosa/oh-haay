class User < ApplicationRecord
  has_many :user_group_statuses
  has_many :statuses, through: :user_group_statuses

  has_many :members
  has_many :groups, through: :members
end
