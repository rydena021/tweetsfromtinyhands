require 'pry-byebug'
require 'csv'

class WordFrequency
  def self.analyzer
    Tweet.where(id: 1..3000).each do |tweet|
      tweet.text.split(/[.,\/#!$%\^&\*;:{}=\-_`~()\s]/).each do |word|
      # unless word is CamelCase, or a mention, ie. @FoxNews
      word.capitalize! unless word.match(/^([A-Z][a-z]*)*$|^@[a-zA-Z]*$/)
        if Frequency.where(word: word).present? # maybe cant do assignation
          # binding.pry
          word_entry = Frequency.where(word: word).first
          word_entry.frequency += 1
          # binding.pry
          word_entry.save
        elsif !stop_word?(word)
          p "created word #{word}"
          Frequency.create(word: word, frequency: 1)
        end
      end
    end
  end

  def self.stop_word?(a_word)
    stop_words = %w(https a able about across after all almost also am among an and any are as at be because been but by can cannot could dear did do does either else ever every for from get got had has have he her hers him his how however i if in into is it its just least let like likely may me might most must my neither no nor not of off often on only or other our own rather said say says she should since so some than that the their them then there these they this tis to too twas us wants was we were what when where which while who whom why will with would yet you your)
    # regex which checks for bogus words ie "2342", "2pm", words less than 3 chars
    if a_word.downcase.match(/(^\d*$)|(^\d*pm$)|(^..$)|(^.$)/)
      true
    elsif stop_words.include? a_word.downcase
      true
    else
      false
    end
  end
end
