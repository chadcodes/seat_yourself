class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant


  def self.capacity?(restaurant_id, date, time_slot)
    Reservation.where(restaurant_id: restaurant_id, date: date, time_slot: time_slot).sum('guests')
  end
end
