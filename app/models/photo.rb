class Photo < ActiveRecord::Base
  validates :photo_url, :uniqueness => true

  def get_images(celeb_name)
    celeb_name = celeb_name.downcase.gsub(' ','-')
    seed_url = "http://www.usmagazine.com/celebrities/#{celeb_name}"
  end
end