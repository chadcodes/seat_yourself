class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant

  validate :seats?

  # Given a restaurant_id, date and time slot this will return
  # the number of guests booked
  # def self.capacity?(restaurant_id, date, time_slot)
  #   Reservation.where(restaurant_id: restaurant_id, date: date, time_slot: time_slot).sum('guests')
  # end


  private
    def seats?
      if !restaurant.seats?(guests,date)
        error.add(:base, "We're full!")
      end
    end
end
