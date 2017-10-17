require 'shoes'
require 'twitter'
#require 'lib/auth.rb'

$client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ""
  config.consumer_secret     = ""
  config.access_token        = ""
  config.access_token_secret = ""
end

class ReRuTwi < Shoes
  url "/", :homescreen
  url "/post", :postscreen
  url "/help", :helpscreen
  url "/view", :viewscreen

  def homescreen
    background white
    flow margin: 10 do
      background lightcoral
      button "Exit", margin: 5, :right => 5 do Shoes.quit() end
      button "View", margin: 5 do visit "/view" end
    end

    stack margin: 10 do
      background gainsboro
      subtitle "ReRuTwi"
      tagline "Twitter App written in Ruby"
    end

    stack margin: 10 do
      background lightslategray
      tagline "Latest tweets\n\n"
      $client.home_timeline.each do |tweet|
        para "@#{tweet.user.screen_name}: #{tweet.text}\n"
      end
    end
  end

  def viewscreen
    background white
    flow margin: 10 do
      background lightcoral
      button "Home", margin: 5 do visit "/" end
    end

    flow margin: 10 do
      background gainsboro
      @user_name = edit_line "Enter username here"
      button "View posts" do
        $client.user_timeline("#{@user_name.text}").each do |tweet|
          para text.text + "\n"
        end
      end
    end
  end
end

Shoes.app :width => 600
