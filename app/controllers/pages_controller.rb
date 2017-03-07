class PagesController < ApplicationController
  def home
    @h = {}
    (0..23).each do |num|
      @h[num.to_s] = []
    end
    Tweet.where(id: 78..79).each do |tweet|
      @h[tweet.posted_at.hour.to_s] << tweet
    end
  end
end

# name variable for each array from 1-23
# compare 1 as a time to datetime object
