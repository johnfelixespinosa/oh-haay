class DropUserGroupStatusTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :user_group_statuses
  end
end
