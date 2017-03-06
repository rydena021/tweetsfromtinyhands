namespace :tweet do
  desc "Make request to Twitter API for new tweets"
  task get_new_tweets: :environment do
    TwitterConnectApi.create_tweets
    WordFrequency.analyzer
  end
end
