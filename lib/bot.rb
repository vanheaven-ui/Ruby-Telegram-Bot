# rubocop: disable Metrics/BlockLength
require 'telegram/bot'
require_relative './interact'
require_relative 'config/keys'

class TelegramBot < Interaction
  attr_reader :user_name
  interact = Interaction.new
  token = ApiKey::TOKEN
  buttons = [
    ['/help', '/stop'],
    ['/verse', '/news']
  ]

  Telegram::Bot::Client.run(token, logger: Logger.new($stderr)) do |bot|
    bot.logger.info("Welcome to verse&newsbot\n\t\tRemember to press Ctrl + C to stop the script")
    bot.listen do |message|
      user_name = message.from.first_name
      msg = message.text
      case msg
      when '/commands'
        reply_markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(
          keyboard: buttons, one_time_keyboard: false
        )
        bot.api.send_message(
          chat_id: message.chat.id, text: interact.commands.to_s, reply_markup: reply_markup
        )
      else
        reply = interact.chat_wrapper(msg, user_name)
        bot.api.send_message(chat_id: message.chat.id, text: reply.to_s)
        arr = ['/verse', '/news']
        if msg == '/stop'
          unmount_keys = Telegram::Bot::Types::ReplyKeyboardRemove.new(
            remove_keyboard: true
          )
          bot.api.send_message(
            chat_id: message.chat.id, text: 'Cheers!', reply_markup: unmount_keys
          )
        elsif arr.include? msg
          sleep(5)
          bot.api.send_message(
            chat_id: message.chat.id, text:
            <<~HERE
              #{interact.same_command(msg)}#{interact.choose_other(msg)}
            HERE
          )
        end
      end
    end
  end
end
# rubocop: enable Metrics/BlockLength
