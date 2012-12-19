class Photo < ActiveRecord::Base
  validates :photo_url, :uniqueness => true

end