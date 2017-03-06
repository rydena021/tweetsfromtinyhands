class Tweet < ApplicationRecord
  has_many :word_tweets
  has_many :words, through: :word_tweets

  def sentiment
    p "in method"
    if self.sentiment_score.nil?
      "sentiment_score N/A"
    elsif self.sentiment_score > 0.2
      "positive"
    elsif self.sentiment_score < - 0.2
      "negative"
    else
      "neutral"
    end
  end
end
