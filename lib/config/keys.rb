require 'dotenv'

Dotenv.load

module ApiKey
  TOKEN = ENV['TOKEN']
end