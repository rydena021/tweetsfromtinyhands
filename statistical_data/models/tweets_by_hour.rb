require 'json'
require 'date'
require 'csv'

# no. tweets between 00 and 01, divided by total number of tweets, to 5 dec places

def daily_tweets(tweet_array)
  data = {}
  [*0..23].each { |n| data[n] = 0 }

  # specify dates required
  tweet_array.reject! do |t|
    date = DateTime.parse(t["date"])
    # for end date, desired date + 1. start date = start date
    date < DateTime.new(2016,1,1) || date >= DateTime.new(2016,2,1)
  end

  p tweet_array

  tweet_array.each do |tweet|
    hour = DateTime.parse(tweet["date"]).hour
    data[hour] += 1
  end

  # convert to float
  tweet_count = tweet_array.size
  data.map do |k,v|
    data[k] = (v/tweet_count.to_f).round(5)
  end

  CSV.open("sentiment_analysis/data/month_2016_01.csv", "w", :col_sep =>",", :force_quotes => false) do |csv|
    data.each do |k,v|
      csv << ["#{k},#{v.to_s[1..-1]}"]
    end
  end
end

file = File.read('sentiment_analysis/data/trumptweets.json')
tweets = JSON.parse(file)


daily_tweets(tweets)
