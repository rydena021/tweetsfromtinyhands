namespace :tweet do
  desc "Make request to Twitter API for new tweets, and find word frequencies"
  task get_new_tweets_analyze: :environment do
    TwitterConnectApi.create_tweets
    WordFrequency.analyzer
  end
end
