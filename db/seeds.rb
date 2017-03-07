# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
jsonfile = File.open('db/tweets.json').read
parsed = JSON.parse(jsonfile)
parsed.each_with_index do |hash, index|
  Tweet.create(in_reply_to_screen_name: hash["in_reply_to_screen_name"],
    twitter_id: hash["id_str"], source: hash["source"], retweet_count: hash["retweet_count"],
    text: hash["text"], posted_at: hash["created_at"].to_datetime, is_retweet: hash["is_retweet"],
    favorite_count: hash["favorite_count"])
  p "Tweet #{index} was created"
end
