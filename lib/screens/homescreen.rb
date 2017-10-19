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
    $client.home_timeline.take(10).collect do |tweet|
      para link("#{tweet.user.screen_name}: ", undercolor: red, click: proc { |btn|
        $person = tweet.user.screen_name
        visit "/viewperson"
      })
      para "  #{tweet.full_text}\n"
    end
  end
end
