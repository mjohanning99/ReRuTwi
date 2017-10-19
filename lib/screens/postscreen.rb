def postscreen
  $settings["colour"]["background"]
  flow margin: 10 do
    background $settings["colour"]["menu"]
    button "Exit", margin: 5, :right => 5 do exit() end
    button "Home", margin: 5 do visit "/" end
    button "View", margin: 5 do visit "/view" end
    button "Search", margin: 5 do visit "/search" end
  end

  stack margin: 10 do
    background $settings["colour"]["info_box"]
    tagline "Post a tweet"
  end

  stack margin: 10 do
    background $settings["colour"]["output"]
    @tweet = edit_box ""
    size   = para "Tweet size: 0"
    button "Post" do
      $client.update @tweet.text
    end
    button "Check tweet size" do
      size.replace "Tweet size: #{@tweet.text.size}"
    end
  end
end
