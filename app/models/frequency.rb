class Frequency < ApplicationRecord
  validates :word, uniqueness: true
  belongs_to :tweet
end
