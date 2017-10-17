require 'shoes'
require 'twitter'
#require 'lib/auth.rb'

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ""
  config.consumer_secret     = ""
  config.access_token        = "-"
  config.access_token_secret = ""
end

class ReRuTwi < Shoes
  url "/", :homescreen
  url "/post", :postscreen
  url "/help", :helpscreen
  url "/view", :viewscreen

  def homescreen
    background white
    flow do
      button "View" do visit "/view" end
    end

    stack margin: 10 do
      background gainsboro
    end
  end

  def viewscreen
    background white
    flow do
      button "Home" do visit "/" end
    end

    stack margin: 10 do
      background gainsboro
    end
  end
end

Shoes.app :width => 600, :height => 400
