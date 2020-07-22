require 'net/http'
require 'json'
require_relative 'refactory'

class Headlines
  include Refactory
  def initialize; end

  def request_news_updates
    uri = URI('https://newsapi.org/v2/top-headlines?country=us&apiKey=ee9d61cdf1804c4c92763fb53ab90146')
    req = Net::HTTP.get(uri)
    res = JSON.parse(req)
    res
  end

  def refactored_news
    str = ''
    refine = return_news_refactor(request_news_updates)
    refine.each do |news|
      str +=
        <<~HERE
          #{news['title']} - by: #{news['author']}
          #{news['url']}
          Published at: #{news['publishedAt']}\n
        HERE
    end
    str
  end
end