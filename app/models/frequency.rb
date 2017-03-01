class Frequency < ApplicationRecord
  validates :word, uniqueness: true
end
