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
  new_urls = []
  regex_url = /<a .*?href.*?['"]([^'"]+)['"]>/m

  while depth > 0
    #Getting the images from each URL we crawled.
    get_images(urls)

<<<<<<< HEAD
      urls.scan(regex_url).each do |url|
        urls << URI.parse(url).relative? ? "http://www.usmagazine.com" + url : url
      end
      
      depth -= 1
=======
    #Crawling each URL we were given.
    urls.each do |url|
      new_urls << HTTParty.get(url).scan(regex_url)
    end

    #Clearing this so we don't double crawl.
    urls = []

    #Check to see if we have an asolute URL.
    new_urls.each do |url|
      urls << URI.parse(url).relative? ? "http://www.usmagazine.com" + url : url
>>>>>>> 57792e7bee7d3b7e55d391da8389671cb5a574f6
    end

    #Clearing out this new array so we don't double crawl.
    new_urls = []

    depth -= 1
  end
end

end