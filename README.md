# Ruby Telegram Bot (verse&newsbot)

This project explores the power of ruby to integrate with the telegram bot API.
  
[![View Code](https://img.shields.io/badge/View%20-Code-green)](https://github.com/vanheaven-ui/ruby-telegram-bot/tree/develop)
[![Github Issues](https://img.shields.io/badge/GitHub-Issues-orange)](https://github.com/vanheaven-ui/ruby-telegram-bot/issues)
[![GitHub Pull Requests](https://img.shields.io/badge/GitHub-Pull%20Requests-blue)](https://github.com/vanheaven-ui/ruby-telegram-bot/pulls)
[![Author](https://img.shields.io/badge/Github-Author-black)](https://github.com/vanheaven-ui)
[![Twitter Follow](https://img.shields.io/badge/Twitter-Ezekiel-%231DA1F2)](https://twitter.com/MworekwaE)
[![LinkedIn follow](https://img.shields.io/badge/LinkedIn-Ezekiel-%232867B2)](https://www.linkedin.com/in/vanheaven/)

## Screenshot of sample verse&newsbot chats

<img src="/img/screenshot.jpg">

## Content

<a text-align="center" href="#about">About</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
<a href="#ins">Installations</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
<a href="#usage">Usage</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
<a href="#testing">Testing</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
<a href="#with">Built With</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
<a href="#author">Author</a>


## About <a name = "about"></a>
This project involves building a telegram bot using ruby and the telegram bot API wrapper. Ruby classes and methods are used to create bot functionality while the ``ruby telegram bot API wrapper gem`` is used to connect to the telegram bot API. The ``net-http-persistent gem`` is used to connect to other external APIs. The telegram bot built in this repository provides random bible verses and the latest real time news headlines in the US.
## 🔧 Built with<a name = "with"></a>

- Ruby 2.6.6
- Telegram Bot API - ``telegram-bot-ruby (0.12.0)``
- net/http - ``net-http-persistent (4.0.0, 2.9.4)``

## 🔧 Tested with<a name = "tested"></a>
  
- RSpec 3.9

## Usage <a name = "usage"></a>
To use the verse&newsbot, follow the steps in this section

### 🔨 Setup
First get a copy of project on your computer:
- Clone or download the repository to a local directory on your computer by following the Github instructions.

### 🛠 Installing <a name = "ins"></a>
Once you have a local copy of the entire project on your computer, then:

- Run ``bundle install`` in the terminal to install the gem dependencies in the Gemfile.
- Verify that all the gems in the Gemfile have been installed<br/> 
  . Run ``gem info telegram-bot-ruby`` in the terminal to check that this gem is installed<br/>
  . Run ``gem info net-http-persistent`` in the terminal to check that this gem is istalled

### 🛠 Testing <a name = "testing"></a>
If you like to test the ruby methods used, then:

- run ``rspec -v`` in the terminal to check if the previous ``bundle install`` terminal command installed rspec in the Gemfile.
- if not, add gem 'rspec' on a new line in the Gemfile and run ``bundle install`` in the terminal again to install rspec.
- run ``rspec`` in the terminal to test the methods used in this project.

### :boom: Use bot
Finally, you can use the verse&newsbot:

- run ``ruby ./bin/script.rb`` in the terminal to execute the ruby script.
- Open your browser and load this URL https://web.telegram.org/#/im?p=@knowbiblebot.
- If not, signin to your telegram account and you should be able to chat with the bot.<br/>

**Alternatively:** After running the ``ruby ./bin/script.rb`` command in the terminal, you can signin to your telegram account and type ``@knowbiblebot`` in the search area instead of loading the above URL. 

## ✒️  Authors <a name = "author"></a>

👤 **Mworekwa Ezekiel**

- Github: [@vanheaven-ui](https://github.com/vanheaven-ui)
- Twitter: [@MworekwaE](https://twitter.com/MworekwaE)
- Linkedin: [@linkedin](https://www.linkedin.com/in/vanheaven/)
- Email: [ezekiel](mailto:vanheaven6@gmail.com)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/vanheaven-ui/ruby-telegram-bot/issues).


## 👍 Show your support

Give a ⭐️ if you like this project!

## :clap: Acknowledgements
[Ruby Telegram bot documentation here:](https://www.rubydoc.info/gems/telegram-bot-ruby/0.7.2)

</div>
