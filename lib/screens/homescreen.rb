def homescreen
  $settings["colour"]["background"]
  flow margin: 10 do
    background $settings["colour"]["menu"]
    button "Exit", margin: 5, :right => 5 do exit() end
    button "View", margin: 5 do visit "/view" end
    button "Post", margin: 5 do visit "/post" end
    button "Search", margin: 5 do visit "/search" end
  end

  stack margin: 10 do
    background $settings["colour"]["info_box"]
    subtitle "ReRuTwi"
    tagline "Twitter App written in Ruby"
  end

  stack margin: 10 do
    background $settings["colour"]["output"]
    tagline "Latest tweets\n"
    $client.home_timeline.take(10).collect do |tweet|
      para link("#{tweet.user.screen_name}: ", undercolor: red, background: lightcoral, click: proc { |btn|
        $person = tweet.user.screen_name
        visit "/viewperson"
      })
      para "#{tweet.full_text}\n"
    end
  end
end
