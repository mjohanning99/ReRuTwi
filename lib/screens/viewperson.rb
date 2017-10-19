def viewperson
  background aliceblue
  flow margin: 10 do
    background lightcoral
    button "Go back", margin: 5, :right => 5 do visit "/" end
  end

  stack margin: 10 do
    background white
    tagline "View posts by @#{$person}\n"
    para $client.user($person).description
    para "#{$client.user($person).followers_count} Followers"
  end

  flow margin: 10 do
    background white
    stack margin: 10 do
      $client.user_timeline($person).take(10).collect do |tweet|
        para tweet.full_text + "\n"
      end
    end
  end
end