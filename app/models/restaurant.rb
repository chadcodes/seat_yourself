class Restaurant < ActiveRecord::Base
  has_many :reservations
  has_many :reviews
  has_many :users, :through => :reservations
  # this is for restaurant owner, will add later
  # has_one :user

  # used for geocoding
  geocoded_by :address
  after_validation :geocode

  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("restaurant_name like ?", "%#{query}%")
    where("cuisine like ?", "%#{query}%")
  end

  scope :most_recent_five, -> { all.limit(5) }
  scope :created_before, ->(time) { where("created_at < ?", time) }

  # Are there seats available for the time, sum the guests on the date/time
  def available(guests, date, user_id)
    r = reservations.where(date: date, user_id: user_id).sum(:guests)
    r + guests <= seats
  end
end
