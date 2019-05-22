class AddReferenceToGroupsForEvents < ActiveRecord::Migration[5.2]
  def change
    add_reference :events, :group, index: true
  end
end
