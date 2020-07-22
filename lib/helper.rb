require 'telegram/bot'
require_relative 'scripture'
require_relative './news'

class BotHelper
  attr_reader :token
  def initialize
    @token = return_token
  end

  def welcome
    <<~HERE
      Welcome to verse&newsbot!
      Please type /commands to get buttons for your commands
    HERE
  end

  def when_start(user_name)
    <<~HERE
      Hello, #{user_name}

      Send me any of the remaining commands below and I will reply accordingly.
      
      /stop - To stop this conversation,
      /verse - To get a special verse
      /news - To get the latest five US news headlines
    HERE
  end

  def when_verse
    "Here is a special verse for you:\n"
  end

  def when_news
    "Here are the latest five news headlines in the US:\n"
  end

  def when_help
    <<~HERE
      I am a bot that is here to take your commands and give you bible verses and the latest BBC news headlines alike.'
      #{commands}
    HERE
  end

  def commands
    <<~HERE
      Please choose any of these commands from the buttons at the bottom or type them to control me
      **Better to start with /start**\n
      /start - start conversation with me
      /stop - stop conversation with me
      /verse - choose this and I will reply with a bible verse
      /news - choose this and I will reply with the latest 5 US news headlines
    HERE
  end

  private

  def return_token
    token = '1133743218:AAGsAzAT0PRHuBgmPkPtLmv4QuRMSWNCrws'
    token
  end
end