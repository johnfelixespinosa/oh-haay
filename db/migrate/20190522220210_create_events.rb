class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :local_date
      t.string :local_time
      t.string :venue
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end