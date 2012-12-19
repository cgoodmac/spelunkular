class Photo < ActiveRecord::Base
  validates :photo_url, :uniqueness => true

  def self.get_images(urls) #takes array of urls
    regex_img=/<img .*?src.*?['"]([^'"]*).*?>\w*/m

    urls.each do |url|
      #.scan returns an array of arrays with length 1
      url.scan(regex_img).each{|pic| Photo.create(:photo_url => pic[0])}
    end
  end

  def self.get_urls(depth, seed_url) #returns array of urls
    # data = HTTParty.get(seed_url)
    # regex_links = /<a .*?href.*?['"]([^'"]*).*?>\w*<\/a>/m
    # result = data.scan(regex_links)
    # links = result.map{|pic| pic[0]}
  end

end