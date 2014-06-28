class Restaurant < ActiveRecord::Base
  has_many :reservations
  has_many :reviews
  has_many :users, :through => :reservations

  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("restaurant_name like ?", "%#{query}%")
    where("cuisine like ?", "%#{query}%")
  end

  scope :most_recent_five, -> { all.limit(5) }
  scope :created_before, ->(time) { where("created_at < ?", time) }

  # Are there seats available for the time, sum the guests on the date/time
  def available(guests, date, user_id)
    # puts "*****"
    # puts "User_id: " + user_id.to_s
    # puts "*****"
    r = reservations.where(date: date, user_id: user_id).sum(:guests)
    # pry
    # puts "*****"
    # puts "R: " + r.to_s
    # puts "*****"
    # puts "Seats: " + seats.to_s
    # puts "*****"
    # puts  r + guests <= seats
    # puts "*****"
    r + guests <= seats
  end
end
