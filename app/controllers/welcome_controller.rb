class WelcomeController < ApplicationController
  def index
  end

  def google0b932d77879d3baa

    render :layout => false

  end

   def robots
      #robots = File.read(Rails.root + "config/robots.#{Rails.env}.txt")
      robots = File.read(Rails.root + "config/robots.txt")
      render :text => robots, :layout => false, :content_type => "text/plain"
   end

  def csstest

  end

end
