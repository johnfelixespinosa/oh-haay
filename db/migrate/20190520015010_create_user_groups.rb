class CreateUserGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :user_groups do |t|
      t.add_reference :user, index: true
      t.add_reference :group, index: true

      t.timestamps
    end
  end
end
