# rubocop: disable Metrics/BlockLength
require 'telegram/bot'
require_relative './helper'

class TelegramBot < BotHelper
  attr_reader :user_name
  helper = TelegramBot.new
  token = helper.token
  help = helper.when_help
  commands = helper.commands
  news = helper.when_news
  verse = helper.when_verse
  buttons = [
    ['/help', '/stop'],
    ['/verse', '/news']
  ]

  Telegram::Bot::Client.run(token, logger: Logger.new($stderr)) do |bot|
    bot.logger.info("Welcome to verse&newsbot\n\t\tRemember to press Ctrl + C to stop the script")
    bot.listen do |message|
      @user_name = message.from.first_name
      repeat = helper.same_command(message.text)
      again = helper.choose_other(message.text)

      case message.text
      when '/commands'
        reply_markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(
          keyboard: buttons, one_time_keyboard: false
        )
        bot.api.send_message(
          chat_id: message.chat.id, text: commands.to_s, reply_markup: reply_markup
        )
      when '/start'
        welcome = helper.when_start(@user_name)
        bot.api.send_message(chat_id: message.chat.id, text: welcome.to_s)
      when '/stop'
        stop = helper.when_stop(@user_name)
        keyboard = Telegram::Bot::Types::ReplyKeyboardRemove.new(remove_keyboard: true)
        bot.api.send_message(chat_id: message.chat.id, text: stop.to_s, reply_markup: keyboard)
      when '/verse'
        scripture = Scripture.new
        bot.api.send_message(
          chat_id: message.chat.id, text: "#{verse}\n#{scripture.refactor}"
        )
        keyboard = Telegram::Bot::Types::ReplyKeyboardRemove.new(remove_keyboard: true)
        bot.api.send_message(chat_id: message.chat.id, text: repeat.to_s, reply_markup: keyboard)
        sleep(5)
        reply_markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(
          keyboard: buttons, one_time_keyboard: false
        )
        bot.api.send_message(
          chat_id: message.chat.id, text: again.to_s, reply_markup: reply_markup
        )
      when '/help'
        bot.api.send_message(chat_id: message.chat.id, text: help.to_s, date: message.date)
      when '/news'
        headlines = Headlines.new
        bot.api.send_message(
          chat_id: message.chat.id, text: "#{news}\n#{headlines.refactored_news}"
        )
        keyboard = Telegram::Bot::Types::ReplyKeyboardRemove.new(remove_keyboard: true)
        bot.api.send_message(chat_id: message.chat.id, text: repeat.to_s, reply_markup: keyboard)
        sleep(5)
        reply_markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(
          keyboard: buttons, one_time_keyboard: false
        )
        bot.api.send_message(
          chat_id: message.chat.id, text: again.to_s, reply_markup: reply_markup
        )

      else
        bot.api.send_message(chat_id: message.chat.id, text: helper.other_input(@user_name).to_s)
      end
    end
  end
end
# rubocop: enable Metrics/BlockLength
