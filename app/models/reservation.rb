class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant

  validates :guests, :date, presence: true

  def available
    if !restaurant.available(guests, date, user_id)
      errors.add(:base, "We're full!")
    end
  end

  validate :available

  # Given a restaurant_id, date and time slot this will return
  # the number of guests booked
  # def self.capacity?(restaurant_id, date, time_slot)
  #   Reservation.where(restaurant_id: restaurant_id, date: date, time_slot: time_slot).sum('guests')
  # end

end
