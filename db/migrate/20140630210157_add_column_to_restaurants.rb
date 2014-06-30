class AddColumnToRestaurants < ActiveRecord::Migration
  def change
    remove_column :restaurants, :capcity
    add_column :restaurants, :capacity, :integer
  end
end
