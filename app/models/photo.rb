class Photo < ActiveRecord::Base
  validates :photo_url, :uniqueness => true

  def get_images(celeb_name)
    celeb_name = celeb_name.downcase.gsub(' ','-')
    seed_url = "http://www.thesuperficial.com/tag/#{celeb_name}/news"
  end
end