class Word < ApplicationRecord
  validates :term, uniqueness: true
  has_many :word_tweets
  has_many :tweets, through: :word_tweets
end
