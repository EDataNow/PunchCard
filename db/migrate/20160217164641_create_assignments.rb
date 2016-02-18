class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :shift_id
      t.integer :user_id
      t.datetime :end_time
      t.string :reason

      t.timestamps null: false
    end
  end
end
