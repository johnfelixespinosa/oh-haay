class RenameUserGroupsToMembers < ActiveRecord::Migration[5.2]
  def self.up
    rename_table :user_groups, :members
  end

  def self.down
    rename_table :user_groups, :members
  end
end
