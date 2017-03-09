class Tweet < ApplicationRecord

  has_many :word_tweets
  has_many :words, through: :word_tweets

  default_scope { order(posted_at: :desc) }

  before_save :convert_to_est

  include PgSearch
  pg_search_scope :search_by_text, against: [ :text ]

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

  def convert_to_est
    self.posted_at += Time.zone_offset('EST')
  end
end
