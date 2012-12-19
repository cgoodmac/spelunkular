class Photo < ActiveRecord::Base
  validates :photo_url, :uniqueness => true

  def get_images(urls) #takes array of urls
    # celeb_name = celeb_name.downcase.gsub(' ','-')
    # seed_url = "http://www.thesuperficial.com/tag/#{celeb_name}/news"
  end

  def get_urls(depth, seed_url) #returns array of urls
  end
end