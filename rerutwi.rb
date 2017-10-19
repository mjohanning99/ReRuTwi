#Gems needed
require 'shoes'
require 'twitter'
require 'yaml'

#Screens
require_relative 'lib/screens/homescreen.rb'
require_relative 'lib/screens/viewscreen.rb'
require_relative 'lib/screens/searchscreen.rb'
require_relative 'lib/screens/viewperson.rb'
require_relative 'lib/screens/postscreen.rb'

#Authentication
require_relative 'lib/auth.rb'

#Settings
$settings = YAML.load_file "./lib/settings.yml"

class ReRuTwi < Shoes
  url "/", :homescreen
  url "/post", :postscreen
  url "/help", :helpscreen
  url "/view", :viewscreen
  url "/search", :searchscreen
  url "/viewperson", :viewperson
end

Shoes.app :width => 800, :height => 500
