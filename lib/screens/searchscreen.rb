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
    @search = edit_line "#"
    @snumber = edit_line "Enter numbers of tweets"
  end

  stack margin: 10 do
    button "Search" do
      $client.search("#{@search.text}").take(@snumber.text.to_i).collect do |tweet|
        para link("#{tweet.user.screen_name}: \n", undercolor: red, click: proc { |btn|
          $person = tweet.user.screen_name
          visit "/viewperson"
        })
        para "  #{tweet.full_text}\n"
      end
    end
  end
end
