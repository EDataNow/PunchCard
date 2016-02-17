class Shifts < ActiveRecord::Migration
  def change
    add_column :shifts, :end_time, :datetime
  end
end
