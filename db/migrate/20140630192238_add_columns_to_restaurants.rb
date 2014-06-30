class AddColumnsToRestaurants < ActiveRecord::Migration
  def change
    remove_column :restaurants, :restaurant_name
    remove_column :restaurants, :seats
    remove_column :restaurants, :street_address
    remove_column :restaurants, :postal_code
  end
end
