# ReRuTwi - A Twitter client written in Ruby
## What exactly is this?
ReRuTwi is a very simple Twitter client written entirely in Ruby. There is not a lot of functionality yet and the GUI is mostly a placeholder as well.

## Installation
### Prerequisties
In order to be able to run ReRuTwi you need a few things.
Firstly, you will need to install [Shoes4](https://github.com/shoes/shoes4) as that is the GUI gem I am using. It is a very basic, but simple extension that helps you create GUIs very quickly. Please follow the installation instructions for Shoes carefully. (*NOTE*: You will need to use Shoes4. Any other version of shoes that can be downloaded from [http://shoesrb.com](http://shoesrb.com) will not work!)
You will also need to install the [twitter](https://github.com/sferik/twitter) gem.

### Logging in
Logging in currently still has to be done by entering your Twitter API tokens into the first few lines of the .rb file. For information as to how to do that, please refer to [twitter#configuration](https://github.com/sferik/twitter#configuration).
Afterwards, you will be able to run ReRuTwi.

## What can I do?
This program is still in a very early development phase, but you are currently able to view your timeline, view someone else's timeline or post something. A simple search function has also been added and you can now click on a person's Twitter handle to see their profile (their most recent posts, follower count, description). The search function will be more advanced in the future and other features will also be added, such as (un)following, blocking, retweeting and so forth.

## TODO
There is still a lot to do with this project until it's even remotely usable for most people. The UI needs to be improved, more functionality should be added, easier logging in and so on.
