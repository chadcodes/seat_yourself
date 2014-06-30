class RemoveColumnFromRestaurants < ActiveRecord::Migration
  def change
    remove_column :restaurants, :price_range
    add_column  :restaurants, :capcity, :integer
    add_column :restaurants, :user_id, :integer
    add_column :restaurants, :name, :string
    add_column :restaurants, :address, :string
    add_column :restaurants, :latitude, :float
    add_column :restaurants, :longitude, :float
    add_column :restaurants, :price, :string
  end
end
