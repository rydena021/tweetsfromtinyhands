class PagesController < ApplicationController

  def home(array, month)
    hash = {}
    (0..23).each do |num|
      hash[num.to_s] = 0
    end
    array.each do |tweet|
      hash[tweet.posted_at.hour.to_s] += 1
    end
    File.open("app/assets/data/jsons/#{month}.json", 'w') do |file|
      file.write(JSON.generate(hash))
    end
  end



  def follower_tweets
    @h = {}
    tweets = Tweet.where(:retweet_count > 10000)

    start_date = DateTime.parse("2015-06-16").beginning_of_month
    end_date = DateTime.current.beginning_of_month

    date_months = (start_date..end_date).map { |d| DateTime.new(d.year, d.month, 1)  }.uniq
    (1..date_months.count).each do |num|
      @h[num.to_s] = []
    end

    date_months.each_with_index do |date, index|
      @h[index] << tweets.where(posted_at: date..date_months[index + 1] || end_date)
    end
  end
end
