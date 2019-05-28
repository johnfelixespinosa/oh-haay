class CreateUserGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :user_groups do |t|
      t.references :user, index: true
      t.references :group, index: true

      t.timestamps
    end
  end
end
