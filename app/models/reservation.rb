class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant

  validates :guests, :date, presence: true
  validate :available

  private
    def available
      if !restaurant.available(guests, date, user_id)
        errors.add(:base, "We're full!")
      end
    end
end
