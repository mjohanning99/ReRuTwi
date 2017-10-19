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
    @user_name = edit_line "Enter username here"
  end

    stack margin: 10 do
      button "View posts" do
        tagline "@#{@user_name.text}\n"
        para $client.user(@user_name.text).description
        para "#{$client.user(@user_name.text).followers_count} Followers"
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
