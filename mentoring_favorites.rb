# encoding = UTF-8

require 'rubygems'
require 'twitter'
require 'twitter-text'
require 'httpclient'

include Twitter::Extractor
# include Twitter::Rewriter

def favorites
  Twitter.favorites("mentoring")
end

client = HTTPClient.new

favorites.each do |favorite|
#  puts "@" +  favorite.user.screen_name + ": " + favorite.text
  result = client.head(extract_urls(favorite.text))
  puts result.header['Location']
end

