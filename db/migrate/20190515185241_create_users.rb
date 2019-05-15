class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :meetup_id
      t.string :meetup_profile_url
      t.string :photo_url
      t.string :city

      t.timestamps
    end
  end
end
