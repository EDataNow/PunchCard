class LinkingModels < ActiveRecord::Migration

  def change
    add_column :shifts, :location_id, :integer
    add_index :shifts, :location_id
    add_index :workplaces, :location_id
    add_index :workplaces, :user_id
    add_index :workplaces, [:location_id, :user_id]
  end

end
