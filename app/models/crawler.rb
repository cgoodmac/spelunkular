class Crawler

def get_images(urls) #takes array of urls
    regex_img=/<img .*?src.*?['"]([^'"]*).*?>\w*/m

    urls.each do |url|
      result = HTTParty.get(url)
      #.scan returns an array of arrays with length 1
      result.scan(regex_img).each{|pic| Photo.create(:photo_url => pic[0])}
    end
  end

  def get_urls(depth, seed_url) #returns array of urls
    urls = [seed_url]
    regex_url = /<a .*?href.*?['"]([^'"]+)['"]>/m

    while depth > 0
      get_images(urls)

      urls.scan(regex_url).each do |url|
        urls << URI.parase(url).relative? ? "http://www.usmagazine.com" + url : url
      end

      depth -= 1
    end
  end

end