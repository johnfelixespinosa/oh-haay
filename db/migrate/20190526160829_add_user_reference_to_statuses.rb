class AddUserReferenceToStatuses < ActiveRecord::Migration[5.2]
  def change
    add_reference :statuses, :user, index: :true
    
  end
end
