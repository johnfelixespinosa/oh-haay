class CreateStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :statuses do |t|
      t.string :working_on
      t.string :need
      t.string :offering
      t.boolean :looking_for_work
      t.boolean :looking_to_hire

      t.timestamps
    end
  end
end
