class AddPriceAndCuisineToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :price_range, :integer
    add_column :restaurants, :cuisine, :string
  end
end
