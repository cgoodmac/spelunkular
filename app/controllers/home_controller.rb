class HomeController < ApplicationController

  def index

  end

  def spelunk

    Photo.delete_all

    celeb_name = params[:celeb].downcase.gsub(' ','-')
    depth = params[:depth].to_i
    seed_url = "http://www.usmagazine.com/celebrities/#{celeb_name}"


    crawler = Crawler.new
    crawler.get_urls(depth, seed_url)
    # crawler.get_images(urls)

  end

end