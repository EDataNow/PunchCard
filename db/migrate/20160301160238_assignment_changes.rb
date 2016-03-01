class AssignmentChanges < ActiveRecord::Migration
  def change
    change_table :assignments do |t|
      t.integer :location_id
    end
  end
end
