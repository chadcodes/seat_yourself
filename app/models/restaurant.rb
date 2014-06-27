class Restaurant < ActiveRecord::Base
  has_many :reservations

 def self.search(search)
  search_condition = "%" + search + "%"
  find(:all, :conditions => ['title LIKE ? OR description LIKE ?', search_condition, search_condition])
end

  scope :most_recent_five, -> { limit(5) }
  scope :created_before, ->(time) { where("created_at < ?", time) }


end
