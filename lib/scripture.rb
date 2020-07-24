# frozen string literal: true

require 'net/http'
require 'json'
require_relative './refactory'

class Scripture
  include Refactory
  def initialize; end

  def return_json
    uri = URI(verse_api)
    req = Net::HTTP.get(uri)
    res = JSON.parse(req)
    res
  end

  def refactor
    return_verse_refactor(return_json)
  end

  private

  def verse_api
    url = 'https://beta.ourmanna.com/api/v1/get/?format=json&order=random'
    url
  end
end
