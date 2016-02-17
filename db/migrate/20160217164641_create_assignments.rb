class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :shift_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
