class Photo < ActiveRecord::Base
  validates :photo_url, :uniqueness => true
  attr_accessible :photo_url, :search_term
end