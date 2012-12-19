class HomeController < ApplicationController

  def index

  end

  def spelunk
    
    Photo.delete_all

    celeb_name = params[:celeb].downcase.gsub(' ','-')
    depth = params[:depth]
    seed_url = ["http://www.usmagazine.com/celebrities/#{celeb_name}"]

    crawler = Crawler.new
    crawler.get_images(seed_url)
    
  end

end