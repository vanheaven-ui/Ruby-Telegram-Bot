require_relative './helper'
require_relative './scripture'
require_relative './news'
require_relative '../env/key'

class Interaction < BotHelper
  attr_reader :token
  def initialize
    @token = ApiKey.new.return_key
  end

  def chat_wrapper(msg, user_name)
    case msg
    when '/start'
      when_start(user_name)
    when '/stop'
      when_stop(user_name)
    when '/help'
      when_help
    when '/verse'
      scripture = Scripture.new
      "#{when_verse}\n#{scripture.refactor}"
    when '/news'
      news = Headlines.new
      "#{when_news}\n#{news.refactored_news}"
    else
      other_input(user_name)
    end
  end
end
