require 'telegram/bot'
require_relative 'scripture'
require_relative './news'

class BotHelper
  def when_start(user_name)
    <<~HERE
      🤝Hello, #{user_name}

      You have officially started our chat.

      Type or click 👉/commands so that I can load a keyboard of the commands for you to choose from.
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
      I am a bot that is here to give you bible verses and the latest US news headlines alike.
      #{commands}
    HERE
  end

  def commands
    <<~HERE
      To control me, please choose any of these commands from the buttons at the bottom or type the commands.\n
      /verse - choose this and I will reply with a bible verse
      /news - choose this and I will reply with the latest 5 US news headlines
      /help - Get guidance
      /stop - stop conversation with me
    HERE
  end

  def when_stop(user_name)
    <<~HERE
      👋Bye! #{user_name},
        You have ended our chat
    HERE
  end

  def same_command(command)
    <<~HERE
      Enjoy the #{command.sub('/', '')}?
      Choose #{command} again for updates or
      Choose from the rest of the commands
    HERE
  end

  def choose_other(command)
    if command == '/verse'
      <<~HERE
        /news - to get news updates in the US
        /stop - to end our chat
        /help - get guidance
      HERE
    else
      <<~HERE
        /verse - to get a bible verse
        /stop - to end our chat
        /help - get guidance
      HERE
    end
  end

  def other_input(user_name)
    <<~HERE
      🤝Hey "#{user_name}"
      For me to reply accordingly, you have to type: or click 👇:
      /commands, /start, /stop, /verse, /news and /help.

      Check your spelling

      If you type /commands, buttons will be loaded at the bottom for you to choose instead of typing
    HERE
  end
end
