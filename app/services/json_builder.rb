class JsonBuilder
  def self.convert_word_instances(hash_ids, date)
    word_hash = {
      words: hash_ids.map do |word_id, count|
        word = Word.find(word_id)
              {
                term: word.term,
                frequency: count,
                category: word.category,
                tweets: word.tweets.where(posted_at: (date.beginning_of_month..date.end_of_month)).pluck(:id)
              }
      end
          }
    File.open("app/assets/data/word_frequency_jsons/#{date.to_date.to_s}.json", 'wb') do |file|
      file.write(JSON.pretty_generate(word_hash))
    end
  end



  def self.run_code
    start_date = DateTime.parse("2015-06-16").beginning_of_month
    end_date = DateTime.current.beginning_of_month

    date_months = (start_date..end_date).map { |d| DateTime.new(d.year, d.month, 1)  }.uniq

    date_months.each_with_index do |date, index|
      tweets = Tweet.where(posted_at: date..date_months[index + 1] || end_date)
      word_ids = WordTweet.where(tweet: tweets)
        .group(:word_id)
        .count
        .sort_by { |_k, v| v }
        .reverse
        .to_h
        .first(100)

      JsonBuilder.convert_word_instances(word_ids, date)
    end
  end
end
