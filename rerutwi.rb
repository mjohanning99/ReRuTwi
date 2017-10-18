require 'shoes'
require 'twitter'
#require 'lib/auth.rb'

$client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "HWR1tCHkc0rbyYqzQB4sCQc9x"
  config.consumer_secret     = "05kftUArNyeHsAHGqrrtwrgJ4sqPVWJmqHroyx4VrQg8lxVVEn"
  config.access_token        = "438658273-mVz3KP9ODjtnss5Hhat3t2St35kgbOBJNGSBKBSO"
  config.access_token_secret = "yx1zIW9mQOvUOgHg0KN8pHQThe5umrrmCUjQIdMZBGVhU"
end


class ReRuTwi < Shoes
  url "/", :homescreen
  url "/post", :postscreen
  url "/help", :helpscreen
  url "/view", :viewscreen
  url "/search", :searchscreen
  url "/viewperson", :viewperson

  def homescreen
    background aliceblue
    flow margin: 10 do
      background lightcoral
      button "Exit", margin: 5, :right => 5 do exit() end
      button "View", margin: 5 do visit "/view" end
      button "Post", margin: 5 do visit "/post" end
      button "Search", margin: 5 do visit "/search" end
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
    background aliceblue
    flow margin: 10 do
      background lightcoral
      button "Exit", margin: 5, :right => 5 do exit() end
      button "Home", margin: 5 do visit "/" end
      button "Post", margin: 5 do visit "/post" end
      button "Search", margin: 5 do visit "/search" end
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

  def searchscreen
    background aliceblue
    flow margin: 10 do
      background lightcoral
      button "Exit", margin: 5, :right => 5 do exit() end
      button "Home", margin: 5 do visit "/" end
      button "Post", margin: 5 do visit "/post" end
      button "View", margin: 5 do visit "/view" end
    end

    stack margin: 10 do
      background deepskyblue
      tagline "Search"
    end

    stack margin: 10 do
      background deepskyblue
      @search = edit_line "Enter search term here"
      @snumber = edit_line "Enter numbers of tweets"

      button "Search" do
        $client.search("#{@search.text}").take(@snumber.text.to_i).collect do |tweet|
          para "#{tweet.user.screen_name}: #{tweet.text}\n"
          para link("#{tweet.user.screen_name}\n", click: proc { |btn, left, top|
            $person = tweet.user.screen_name
            visit "/viewperson"
          })
        end
      end
    end
  end

  def viewperson
    background aliceblue
    flow margin: 10 do
      background lightcoral
      button "Exit", margin: 5, :right => 5 do exit() end
      button "Home", margin: 5 do visit "/" end
      button "Post", margin: 5 do visit "/post" end
      button "Search", margin: 5 do visit "/search" end
    end

    flow margin: 10 do
      background deepskyblue
      tagline "View posts by #{$person}\n\n"
      $client.user_timeline($person).each do |tweet|
        para tweet.text + "\n"
      end
    end
  end

  def postscreen
    background aliceblue
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

Shoes.app :width => 800, :height => 500
