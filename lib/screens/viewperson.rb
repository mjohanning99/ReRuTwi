def viewperson
  background $settings["colour"]["background"]
  flow margin: 10 do
    background $settings["colour"]["menu"]
    button "Go back", margin: 5, :right => 5 do visit "/" end
  end

  stack margin: 10 do
    background $settings["colour"]["info_box"]
    tagline "View posts by @#{$person}\n"
    if $client.friendship?($client.user, $person) then
      button "Unfollow" do
        $client.unfollow($person)
      end
    else
      button "Follow" do
        $client.follow($person)
      end
    end
    para $client.user($person).description
    para "#{$client.user($person).followers_count} Followers"
    #TODO => Block and check if already blocked
  end

  flow margin: 10 do
    background $settings["colour"]["output"]
    stack margin: 10 do
      $client.user_timeline($person).take(10).collect do |tweet|
        para tweet.full_text + "\n"
      end
    end
  end
end
