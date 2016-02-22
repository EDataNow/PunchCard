class Passwords < ActiveRecord::Migration
  def change
    rename_column :users, :name, :first_name
    change_table :users do |t|
      t.string :last_name
    end
  end
end
