require 'json'
require 'date'
require 'csv'

# no. tweets between 00 and 01, divided by total number of tweets, to 5 dec places

def daily_tweets(tweet_array)
  data = {}
  [*0..23].each { |n| data[n] = 0 }
  tweet_count = tweet_array.size

  tweet_array.each do |tweet|
    hour = DateTime.parse(tweet["date"]).hour
    data[hour] += 1
  end
  data.map do |k,v|
    data[k] = (v/tweet_count.to_f).round(5)
  end

  CSV.open("sentiment_analysis/data/daily_tweets.csv", "w", :col_sep =>",", :force_quotes => false) do |csv|
    data.each do |k,v|
      csv << ["#{k},#{v.to_s[1..-1]}"]
      p ["#{k},#{v.to_s[1..-1]}"]
    end
  end

end


file = File.read('sentiment_analysis/data/trumptweets.json')
tweets = JSON.parse(file)

daily_tweets(tweets)
