class Word < ApplicationRecord
  validates :term, uniqueness: true
  has_many :word_tweets
  has_many :tweets, through: :word_tweets
  default_scope { order(frequency: :desc) }

  def set_category
    file = File.read('db/countries-list.csv')
    countries = CSV.parse(file).flatten
    if countries.include? self.term
      self.category = "country"
    elsif self.term.include? "@"
      self.category = "mention"
    else
      self.category = "other"
    end
  end
end
