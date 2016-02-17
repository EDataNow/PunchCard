class Assignments < ActiveRecord::Migration
  def change
    add_column :assignments, :end_time, :datetime
    add_column :assignments, :reason, :string
  end
end