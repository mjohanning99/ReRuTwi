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
  #url "/viewperson", :viewperson

  def homescreen
    background cornsilk
    flow margin: 10 do
      background lightcoral
      button "Exit", margin: 5, :right => 5 do exit() end
      button "View", margin: 5 do visit "/view" end
      button "Post", margin: 5 do visit "/post" end
    end

    stack margin: 10 do
      background deepskyblue
      subtitle "ReRuTwi"
      tagline "Twitter App written in Ruby"
    end

    stack margin: 10 do
      background skyblue
      tagline "Latest tweets\n\n"
      $client.home_timeline.each do |tweet|
        para "@#{tweet.user.screen_name}: #{tweet.text}\n"
      end
    end
  end

  def viewscreen
    background cornsilk
    flow margin: 10 do
      background lightcoral
      button "Exit", margin: 5, :right => 5 do exit() end
      button "Home", margin: 5 do visit "/" end
      button "Post", margin: 5 do visit "/post" end
    end

    flow margin: 10 do
      background deepskyblue
      tagline "View posts by user"

      stack margin: 10 do
        background skyblue
        @user_name = edit_line "Enter username here"
        button "View posts" do
          if @user_name.text.include?(" ") == false then
            $client.user_timeline("#{@user_name.text}").each do |tweet|
              para tweet.text + "\n"
            end
          else
            para "ERROR! Username contains a space!"
          end
        end
      end
    end
  end

  #def viewperson
  #
  #end

  def postscreen
    background cornsilk
    flow margin: 10 do
      background lightcoral
      button "Exit", margin: 5, :right => 5 do exit() end
      button "Home", margin: 5 do visit "/home" end
      button "View", margin: 5 do visit "/view" end
    end

    stack margin: 10 do
      background deepskyblue
      tagline "Post a tweet"
    end

    stack margin: 10 do
      background deepskyblue
      @tweet = edit_box ""
      button "Post" do
        $client.update @tweet.text
      end
    end
  end
end

Shoes.app :width => 600
