require 'telegram/bot'
require_relative './helper'

class TelegramBot < BotHelper
  helper = TelegramBot.new
  token = helper.token
  help = helper.when_help
  commands = helper.commands
  news = helper.when_news
  verse = helper.when_verse
 
  # user_name = message.from.first_name

  Telegram::Bot::Client.run(token, logger: Logger.new($stderr)) do |bot|
    bot.logger.info("Welcome to verse&newsbot\n\t\tRemember to press Ctrl + C to stop the script")
    bot.listen do |message|
      user_name = message.from.first_name
      case message.text
      when '/commands'
        buttons = [
          ['/start', '/stop'],
          ['/verse', '/news'],
        ]
        reply_markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(
          keyboard: buttons, one_time_keyboard: false
        )
        bot.api.send_message(
          chat_id: message.chat.id, text: commands.to_s, reply_markup: reply_markup
        )
      when '/start'
        welcome = helper.when_start(user_name)
        bot.api.send_message(
          chat_id: message.chat.id, text: welcome.to_s, date: message.date
        )
      when '/stop'
        keyboard = Telegram::Bot::Types::ReplyKeyboardRemove.new(remove_keyboard: true)
        bot.api.send_message(
          chat_id: message.chat.id, text: "Bye #{user_name},\nYou have ended our chat", date: message.date, reply_markup: keyboard
        )
      when '/verse'
        scripture = Scripture.new
        bot.api.send_message(chat_id: message.chat.id, text:
          <<~HERE
            #{verse}
            #{scripture.refactor}
          HERE
        )
      when '/help'
        bot.api.send_message(chat_id: message.chat.id, text: help.to_s, date: message.date)
      when '/news'
        headlines = Headlines.new
        bot.api.send_message(
          chat_id: message.chat.id, text:
          <<~HERE
            #{news}
            #{headlines.refactored_news}
          HERE
        )
      else
        bot.api.send_message(
          chat_id: message.chat.id, text:
          <<~HERE
            Hey "#{user_name}"
            For me to reply, you have to type 
              /commands, /start, /stop, /verse, /news and /help.
            Check your spelling

            If you type /commands, buttons will be loaded at the bottom for you to choose instead of typing
          HERE
        )
      end
    end
  end
end
