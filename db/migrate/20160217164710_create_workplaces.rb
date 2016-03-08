class CreateWorkplaces < ActiveRecord::Migration
  def change
    create_table :workplaces do |t|
      t.integer :user_id
      t.integer :location_id

      t.timestamps null: true
    end
  end
end
