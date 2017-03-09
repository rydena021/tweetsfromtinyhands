class TweetsPerHour

def self.counter(array, date)
    hash = {}
    (0..23).each do |num|
      hash[num.to_s] = 0
    end
    array.each do |tweet|
      hash[tweet.posted_at.hour.to_s] += 1
    end
    File.open("app/assets/data/tweet_hours_jsons/#{date.to_date.to_s}.json", 'w') do |file|
      file.write(JSON.generate(hash))
    end
  end

def self.run_code

    start_date = DateTime.parse("2015-06-16").beginning_of_month
    end_date = DateTime.current.beginning_of_month

    date_months = (start_date..end_date).map { |d| DateTime.new(d.year, d.month, 1)  }.uniq
    date_months.each_with_index do |date, index|
      range = date..(date_months[index + 1] || end_date)
        TweetsPerHour.counter(Tweet.where(posted_at: range), date)
    end
  end
end
