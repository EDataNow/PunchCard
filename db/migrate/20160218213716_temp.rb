class Temp < ActiveRecord::Migration
  def change
    change_table :assignments do |t|
      t.string :username
      t.string :location
    end
  end
end
