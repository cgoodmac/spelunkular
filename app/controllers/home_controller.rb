class HomeController < ApplicationController

  def index

  end

  def spelunk
    celeb_name = params[:celeb].downcase.gsub(' ','-')
    depth = params[:depth]
    seed_url = "http://www.usmagazine.com/celebrities/#{celeb_name}"

    
  end

end