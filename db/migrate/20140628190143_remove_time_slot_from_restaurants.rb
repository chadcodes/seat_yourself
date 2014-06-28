class RemoveTimeSlotFromRestaurants < ActiveRecord::Migration
  def change
    remove_column :reservations, :time_slot
  end
end
