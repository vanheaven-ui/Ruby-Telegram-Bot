module Refactory
  def return_verse_refactor(json_obj)
    "#{json_obj['verse']['details']['text']}\- #{json_obj['verse']['details']['reference']}"
  end

  def return_news_refactor(json_hash)
    arr = []
    samples = json_hash['articles']
    samples.take(5).each do |article|
      arr << article
    end
    arr
  end
end