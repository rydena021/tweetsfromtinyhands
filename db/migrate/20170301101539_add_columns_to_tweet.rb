class AddColumnsToTweet < ActiveRecord::Migration[5.0]
  def change
    add_column :tweets, :sentiment, :string
    add_column :tweets, :sentiment_score, :float
  end
end
