require 'unirest'

class SentimentAnalyzer
  def self.add_sentiment
    sql = "SELECT * FROM tweets WHERE (tweets.id BETWEEN 1701 AND 1945)"
    ActiveRecord::Base.connection.execute(sql).map do |tweet_hash|
      tweet = Tweet.find(tweet_hash['id'])
      text = tweet.text
      uri = URI::encode(text)
      if tweet.sentiment_score.nil?
        response = Unirest.get "https://jamiembrown-tweet-sentiment-analysis.p.mashape.com/api/?text=#{uri}",
        headers:{
          "X-Mashape-Key" => ENV["X_Mashape_Key"],
          "Accept" => "application/json"
        }
        tweet.update_column(:sentiment_score, response.body["score"])
      end
    end
  end
end
