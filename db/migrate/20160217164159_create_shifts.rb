class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.datetime :end_time
      t.timestamps null: false
    end
  end
end
