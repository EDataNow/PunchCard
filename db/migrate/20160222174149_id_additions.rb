class IdAdditions < ActiveRecord::Migration
  def change
    add_index :assignments, :user_id
    add_index :assignments, :shift_id
    add_index :assignments, [:shift_id, :user_id]
  end
end
