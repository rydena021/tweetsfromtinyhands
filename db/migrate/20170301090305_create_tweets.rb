class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.string :in_reply_to_screen_name
      t.string :twitter_id
      t.string :source
      t.integer :retweet_count
      t.string :text
      t.string :posted_at
      t.boolean :is_retweet
      t.integer :favorite_count

      t.timestamps
    end
  end
end
