require 'unirest'

class SentimentAnalyzer
  def self.add_sentiment
    Tweet.where(:id => 801..950).map do |tweet|
      text = tweet.text
      uri = URI::encode(text)
      if tweet.sentiment_score.nil?
        p "in API"
        response = Unirest.get "https://jamiembrown-tweet-sentiment-analysis.p.mashape.com/api/?text=#{uri}",
        headers:{
          "X-Mashape-Key" => ENV["X_Mashape_Key"],
          "Accept" => "application/json"
        }
        tweet.update_column(:sentiment_score, response.body["score"])
      end
      calculate_sentiment(tweet) unless tweet.sentiment_score.nil?
    end
  end

  def self.calculate_sentiment(tweet)
    p tweet.text
    p tweet.sentiment_score
    if tweet.sentiment_score > 0.2
      sentiment = "positive"
    elsif tweet.sentiment_score < - 0.2
      sentiment = "negative"
    else
      sentiment = "neutral"
    end
    p sentiment
    tweet.update_column(:sentiment, sentiment)
  end
end
