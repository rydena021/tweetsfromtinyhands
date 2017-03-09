require 'unirest'

class SentimentAnalyzer
  def self.add_sentiment
    sql = "SELECT * FROM tweets WHERE (tweets.id BETWEEN 3942 AND 4940)"
    ActiveRecord::Base.connection.execute(sql).map do |tweet_hash|
      tweet = Tweet.find(tweet_hash['id'])
      text = tweet.text
      uri = URI::encode(text)
      if tweet.sentiment_score.nil?
        response = Unirest.get "https://jamiembrown-tweet-sentiment-analysis.p.mashape.com/api/?text=#{uri}",
        headers:{
          "X-Mashape-Key" => "Key disabled",
          "Accept" => "application/json"
        }
        tweet.update_column(:sentiment_score, response.body["score"])
      end
    end
  end

  def self.json_write(array, date)
    sentiment_hash = {
      positive: 0
      negative: 0
      neutral: 0
    }
    array.each do |tweet|
      sentiment_hash[:positive] += 1 if tweet.sentiment = positive
      sentiment_hash[:negative] += 1 if tweet.sentiment = negative
      sentiment_hash[:neutral] += 1 if tweet.sentiment = neutral
    end
        }
    File.open("app/assets/data/sentiment_jsons/#{date.to_date.to_s}.json", 'wb') do |file|
      file.write(JSON.generate(word_hash))
    end
  end


  def self.call_json_write
    start_date = DateTime.parse("2015-06-16").beginning_of_month
    end_date = DateTime.current.beginning_of_month

    date_months = (start_date..end_date).map { |d| DateTime.new(d.year, d.month, 1)  }.uniq
    date_months.each_with_index do |date, index|
      range = date..(date_months[index + 1] || end_date)
        SentimentAnalyzer.json_write(Tweet.where(posted_at: range), date)
    end
  end
end
