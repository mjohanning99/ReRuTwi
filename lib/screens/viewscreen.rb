def viewscreen
  $settings["colour"]["background"]
  flow margin: 10 do
    $settings["colour"]["menu"]
    button "Exit", margin: 5, :right => 5 do exit() end
    button "Home", margin: 5 do visit "/" end
    button "Post", margin: 5 do visit "/post" end
    button "Search", margin: 5 do visit "/search" end
  end

  flow margin: 10 do
    background $settings["colour"]["info_box"]
    @user_name = edit_line "Enter username here"
  end

  stack margin: 10 do
    background $settings["colour"]["info_box"]
    button "View posts" do
      tagline "@#{@user_name.text}\n"
      if $client.friendship?($client.user, @user_name.text) then
        button "Unfollow\n" do
          $client.unfollow(@user_name.text)
        end
      else
        button "Follow\n" do
          $client.follow(@user_name.text)
        end
      end

      if $client.block?(@user_name.text) then
        button "Unblock" do
          $client.unblock(@user_name.text)
        end
      else
        button "Block" do
          $client.block(@user_name.text)
        end
      end
      para $client.user(@user_name.text).description
      para "#{$client.user(@user_name.text).followers_count} Followers"

      stack margin: 10 do
        background $settings["colour"]["output"]
        if @user_name.text.include?(" ") == false then
            $client.user_timeline(@user_name.text).each do |tweet|
            para tweet.full_text + "\n"
          end
        else
          para "ERROR! Username cannot contain a space"
        end
      end
    end
  end
end
