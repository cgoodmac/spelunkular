class Crawler

def get_images(urls, search_term) #takes array of urls
  regex_img=/<img .*?src.*?['"]([^'"]*).*?>\w*/m
  urls.each do |url|
    begin
      result = HTTParty.get(url)
      #.scan returns an array of arrays with length 1
      result.scan(regex_img).each{|pic| Photo.create(:photo_url => pic[0], :search_term => search_term)}
    rescue
    end
  end
end

def get_urls(depth, seed_url, search_term) #returns array of urls
  urls = [seed_url]
  new_urls = []
  regex_url = /<a .*?href.*?['"]([^'"]+)['"]>/m

  while depth > 0
    puts "Getting urls: #{urls.count}"
    #Getting the images from each URL we crawled.
    get_images(urls, search_term)

    puts urls
    #Crawling each URL we were given.
    urls.each do |url|
      begin
        new_urls << HTTParty.get(url).scan(regex_url)
      rescue
      end
    end

    #Clearing this so we don't double crawl.
    urls = []

    #Check to see if we have an absolute URL.
    new_urls.each do |url_group|
      url_group.each do |url|
        begin
          begin
          new_url = URI.parse(url[0]).relative? ? "http://www.usmagazine.com/#{url[0]}" : url
          puts new_url
          urls << new_url
          rescue
          end
        rescue
        end
      end
    end

    #Clearing out this new array so we don't double crawl.
    new_urls = []

    depth -= 1
  end
end

end