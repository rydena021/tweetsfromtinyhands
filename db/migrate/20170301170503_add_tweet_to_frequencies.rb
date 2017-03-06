class AddTweetToFrequencies < ActiveRecord::Migration[5.0]
  def change
    add_reference :frequencies, :tweet, foreign_key: true
  end
end
