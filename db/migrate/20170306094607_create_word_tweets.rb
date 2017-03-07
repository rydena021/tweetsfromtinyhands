class CreateWordTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :word_tweets do |t|
      t.references :tweet, foreign_key: true
      t.references :word, foreign_key: true

      t.timestamps
    end
  end
end
