class Restaurant < ActiveRecord::Base
  has_many :reservations

 def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("restaurant_name like ?", "%#{query}%")
    where("cuisine like ?", "%#{query}%")
  end


  scope :most_recent_five, -> { all.limit(5) }
  scope :created_before, ->(time) { where("created_at < ?", time) }

end
