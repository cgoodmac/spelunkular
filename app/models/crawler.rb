class Crawler

def get_images(urls) #takes array of urls
    regex_img=/<img .*?src.*?['"]([^'"]*).*?>\w*/m

    urls.each do |url|
      #.scan returns an array of arrays with length 1
      url.scan(regex_img).each{|pic| Photo.create(:photo_url => pic[0])}
    end
  end

  def get_urls(depth, seed_url) #returns array of urls
    url = []
    #<a .*?href.*?['"]([^'"]+)['"]>
  end

end