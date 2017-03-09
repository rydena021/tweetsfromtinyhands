# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170306094607) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "frequencies", force: :cascade do |t|
    t.string   "word"
    t.integer  "frequency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "tweet_id"
    t.string   "category"
    t.index ["tweet_id"], name: "index_frequencies_on_tweet_id", using: :btree
  end

  create_table "tweets", force: :cascade do |t|
    t.string   "in_reply_to_screen_name"
    t.string   "twitter_id"
    t.string   "source"
    t.integer  "retweet_count"
    t.string   "text"
    t.datetime "posted_at"
    t.boolean  "is_retweet"
    t.integer  "favorite_count"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.float    "sentiment_score"
  end

  create_table "word_tweets", force: :cascade do |t|
    t.integer  "tweet_id"
    t.integer  "word_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tweet_id"], name: "index_word_tweets_on_tweet_id", using: :btree
    t.index ["word_id"], name: "index_word_tweets_on_word_id", using: :btree
  end

  create_table "words", force: :cascade do |t|
    t.string   "term"
    t.integer  "frequency"
    t.string   "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "frequencies", "tweets"
  add_foreign_key "word_tweets", "tweets"
  add_foreign_key "word_tweets", "words"
end
