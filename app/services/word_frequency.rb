require 'csv'

class WordFrequency
  def self.analyzer
    Tweet.all.each do |tweet|
      tweet.text.split(/[.,\/#!$%\^&\*;:{}=\-_`~()\s]/).each do |word|
        word.capitalize! unless word.match(/^([A-Z][a-z]*)*$|^@[a-zA-Z]*$/)
        word.singularize
        if Word.where(term: word).present?
          increment(tweet, word)
          p "incremented"
        elsif !stop_word?(word)
          word = Word.new(term: word, frequency: 1) # make an array
          word.set_category
          word.save
          WordTweet.create(word:word, tweet:tweet)
          p "new word"
        end
      end
    end
  end


  private


  def self.increment(tweet, word)
    word_entry = Word.where(term: word).first
    word_entry.frequency += 1
    word_entry.save
    WordTweet.create(word:word_entry, tweet:tweet)
  end

  def self.stop_word?(a_word)

    file = File.read('db/stop_words.csv')
    array_stop_words = CSV.parse(file).flatten

    if array_stop_words.include? a_word.downcase
      true
    elsif a_word.downcase.match(/(^\d*$)|(^\d*pm$)|(^..$)|(^.$)/)
      true
    else
      false
    end
  end
end
