require 'json'
require 'sentimentalizer'
require 'unirest'
require 'open-uri'

text = "Give the public a break - The FAKE NEWS media is trying to say that large scale immigration in Sweden is working out just beautifully. NOT!"

uri = URI::encode(text)

# curl --get --include 'https://jamiembrown-tweet-sentiment-analysis.p.mashape.com/api/?text=I+love+Mashape!' \
#   -H 'X-Mashape-Key: 0ALNLSmxWWmshiXMc1chqesGNepmp1eVMi1jsnd7FCcKQHlBbX' \
#   -H 'Accept: application/json'



response = Unirest.get "https://jamiembrown-tweet-sentiment-analysis.p.mashape.com/api/?text=#{uri}",
  headers:{
    "X-Mashape-Key" => "njxvpOcwZHmshONeuvspfFIht6lBp16cTJFjsnqlpmeHWnaPgn",
    "Accept" => "application/json"
  }

  p response








# Sentimentalizer.setup
# text = ""
# response = Unirest.get "https://jamiembrown-tweet-sentiment-analysis.p.mashape.com/api/?text=I+love+Mashape!",
#   headers:{
#     "X-Mashape-Key" => "njxvpOcwZHmshONeuvspfFIht6lBp16cTJFjsnqlpmeHWnaPgn",
#     "Accept" => "application/json"
#   }

# curl --get --include 'https://jamiembrown-tweet-sentiment-analysis.p.mashape.com/api/?text=I+love+Mashape!' \
# -H 'X-Mashape-Key: 0ALNLSmxWWmshiXMc1chqesGNepmp1eVMi1jsnd7FCcKQHlBbX' \
# -H 'Accept: application/json'

# file = File.read('sentiment_analysis/data/tweets_sample.json')
# tweets = JSON.parse(file)

# tweets.each do |tweet|
#   p tweet["text"]
#   response =Sentimentalizer.analyze(tweet["text"], true)
#   p response
# end

  # response =Sentimentalizer.analyze("terrible news, im sad", true)
  # p response



# this works
# class Analyzer
#   def initialize
#     Sentimentalizer.setup
#   end

#   def process(phrase, json = true)
#     Sentimentalizer.analyze(phrase, json)
#   end
# end

# a = Analyzer.new
# p a.process("The race for DNC Chairman was, of course, totally \"rigged.\" Bernie's guy, like Bernie himself, never had a chance. Clinton demanded Perez! ", true)
