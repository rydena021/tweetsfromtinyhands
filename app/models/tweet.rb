class Tweet < ApplicationRecord
  default_scope { order(posted_at: :desc) }

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
end
