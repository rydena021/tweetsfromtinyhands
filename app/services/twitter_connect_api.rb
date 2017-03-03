class TwitterConnectApi

  def self.prepare_access_token
    consumer = OAuth::Consumer.new(ENV["ApiKey"], ENV["ApiSecret"], { :site => "https://api.twitter.com", :scheme => :header })

    # now create the access token object from passed values
    token_hash = { :oauth_token => ENV["OAuthToken"], :oauth_token_secret => ENV["OAuthTokenSecret"] }
    OAuth::AccessToken.from_hash(consumer, token_hash )
  end

  def self.last_tweet_twitter_id
    Tweet.first.twitter_id
  end

  def self.make_api_call(last_tweet_twitter_id)
    access_token = TwitterConnectApi.prepare_access_token
    access_token.request(:get, "https://api.twitter.com/1.1/statuses/user_timeline.json?since_id=#{last_tweet_twitter_id}&user_id=25073877&screen_name=realDonaldTrump")
  end

  def self.parse_to_json
    JSON.parse(TwitterConnectApi.make_api_call(TwitterConnectApi.last_tweet_twitter_id).body)
  end


  def self.create_tweets
    TwitterConnectApi.parse_to_json.each do |hash|
      Tweet.create(
        in_reply_to_screen_name: hash["in_reply_to_screen_name"],
        twitter_id: hash["id_str"],
        source: hash["source"],
        retweet_count: hash["retweet_count"],
        text: hash["text"],
        posted_at: (hash["created_at"]).to_datetime,
        is_retweet: hash["is_retweet"],
        favorite_count: hash["favorite_count"]
      )
    end
  end
end

