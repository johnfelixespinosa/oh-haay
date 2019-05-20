class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :meetup_group_id
      t.string :group_link
      t.string :group_key_photo_url
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
