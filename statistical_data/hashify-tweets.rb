require 'json'
require 'date'

def hashify(tweets_path)
  tweet_output = []
  File.open(tweets_path, "r") do |tweets|
    tweets.each_line.with_index do |tweet, index|
      # regex to match t1 = date + time, t2 = tweet text, t3 = source device
      t = tweet.match(/(.*\d*:\d*:\d*\s[AP]M)\s(.*)\[(.*)\]/)
      date = DateTime.strptime(t[1],"%b %d, %Y %I:%M:%S %p")
      hash = { date: date,
               text: t[2],
               device: t[3]
              }
      tweet_output << hash
    end
  end
  tweet_output
end

def write_to_file(string, filename)
  output = File.open( filename,"a" )
  output << string
  output.close
end

def ToJson(array_hash, filename)
  File.open(filename,"w") do |f|
    f.write(array_hash.to_json)
  end
end

array = hashify("raw_tweets.txt")# do |f|

array.reject! { |elem| elem[:text].slice(0,2) == "\"@" }

ToJson(array, "trumptweets.json")

# array.map.with_index do |h, index|
#   if h[:text].slice(0,2) == "\"@"
#   end
# end
