# ReRuTwi - A Twitter client written in Ruby
## What exactly is this?
ReRuTwi is a very simple Twitter client written entirely in Ruby. There is not a lot of functionality yet and the GUI is mostly a placeholder as well.

## Installation
### Prerequisties
In order to be able to run ReRuTwi you need a few things.
Firstly, you will need to install [Shoes4](https://github.com/shoes/shoes4) as that is the GUI gem I am using. It is a very basic, but simple extension that helps you create GUIs very quickly. Please follow the installation instructions for Shoes carefully. (*NOTE*: You will need to use Shoes4. Any other version of shoes that can be downloaded from [http://shoesrb.com](http://shoesrb.com) will not work!)
You will also need to install the [twitter](https://github.com/sferik/twitter) gem.
I might be adding executeables in the future.

### Logging in
Logging in currently still has to be done by entering your Twitter API tokens into the first few lines of the .rb file. For information as to how to do that, please refer to [twitter#configuration](https://github.com/sferik/twitter#configuration).
Afterwards, you will be able to run ReRuTwi.

## What is this program capable of?
This program is still in a very early development phase, but you are currently able to view your timeline, view someone else's timeline or post something. A simple search function has also been added and you can now click on a person's Twitter handle to see their profile (their most recent posts, follower count, description). The search function will be more advanced in the future and other features will also be added, such as (unblocking) a certain user, following someone, replying to a tweet, retweeting a tweet and so forth.

## Contributing
### Adding to this repository
Everybody is welcome to contribute to this project and especially because of the Shoes and Twitter gems, this is made very easy. If you are unsure as how to how either Shoes or the Twitter gem work, please take a quick look at the [tutorials](http://shoesrb.com/tutorials/) available over at the official shoes website and at the [Github for twitter](https://github.com/sferik/twitter) and the [rubydoc.info](http://www.rubydoc.info/gems/twitter) documentation for twitter. That should be enough for you to quickly get started.

### Making your own project
Should you be wanting to take my project and use it as the base of yours or make your own project out of it, you are welcome to do so, even for commercial usage. This project is using the [GNU General Public License 3](https://www.gnu.org/licenses/gpl.html) so if you are unsure as to what you are and aren't allowed to do, please read about it.

## TODO
There is still a lot to do with this project until it's even remotely usable for most people. The UI needs to be improved and it will most likely change a lot over the course of a few days or weeks. Furthermore, more functionality should be added, easier logging in and so on. Some more basic Twitter functionality still needs to be added, such as being able to retweet a tweet, replying to a tweet, blocking a user or sending private messages. Besides that, I will also be hoping to add a settings menu where you can change the colours and more.
