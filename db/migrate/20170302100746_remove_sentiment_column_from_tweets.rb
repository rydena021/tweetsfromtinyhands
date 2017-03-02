class RemoveSentimentColumnFromTweets < ActiveRecord::Migration[5.0]
  def change
    remove_column :tweets, :sentiment, :string
  end
end
