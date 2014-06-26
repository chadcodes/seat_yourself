class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :restaurant_name
      t.string :menu
      t.integer :seats
      t.string :street_address
      t.string :postal_code
      t.string :photo_url

      t.timestamps
    end
  end
end
