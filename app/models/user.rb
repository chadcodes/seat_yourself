class User < ActiveRecord::Base
  has_secure_password

  has_many :reservations
  has_many :reviews
  has_many :restaurants, :through => :reservations

  validates :avatar, :attachment_presence => true
  validates_with AttachmentPresenceValidator, :attributes => :avatar



    has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


end
