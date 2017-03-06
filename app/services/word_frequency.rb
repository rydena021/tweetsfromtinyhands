require 'csv'

class WordFrequency
  def self.analyzer
    Tweet.where(id: 210..220).each do |tweet|
      tweet.text.split(/[.,\/#!$%\^&\*;:{}=\-_`~()\s]/).each do |word|
        # unless word is CamelCase, or a mention, ie. @FoxNews
        word.capitalize! unless word.match(/^([A-Z][a-z]*)*$|^@[a-zA-Z]*$/)
        # check if word already in database before create
        word.singularize
        if Word.where(term: word).present?
          increment(tweet, word)
        elsif !stop_word?(word)
          word = Word.new(term: word, frequency: 1) # make an array
          word.category = "country" if country?(word)
          word.save
          WordTweet.create(word:word, tweet:tweet)
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

  def self.country?(another_word)
    file = File.read('db/countries-list.csv')
    countries = CSV.parse(file).flatten
    countries.include? another_word
  end
end
