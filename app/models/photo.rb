class Photo < ActiveRecord::Base
  validates :photo_url, :uniqueness => true
  attr_accessible :photo_url
end