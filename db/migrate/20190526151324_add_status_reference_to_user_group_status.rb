class AddStatusReferenceToUserGroupStatus < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_group_statuses, :status, index: true
  end
end
