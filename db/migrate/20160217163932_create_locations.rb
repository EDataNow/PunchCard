class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address
      t.datetime :shift_start
      t.datetime :shift_end

      t.timestamps null: true
    end
  end
end
