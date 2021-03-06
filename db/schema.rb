# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 0) do

  create_table "albums", force: :cascade do |t|
    t.text    "title"
    t.text    "image_url"
    t.text    "year"
    t.integer "artist_id"
    t.text    "spotify_id"
    t.text    "album_type"
    t.integer "popularity"
    t.integer "total_tracks"
  end

  add_index "albums", ["artist_id"], name: "index_albums_on_artist_id"
  add_index "albums", ["spotify_id"], name: "index_albums_on_spotify_id"

  create_table "artists", force: :cascade do |t|
    t.text "name"
    t.text "photo_url"
    t.text "spotify_id"
  end

  add_index "artists", ["spotify_id"], name: "index_artists_on_spotify_id"

  create_table "songs", force: :cascade do |t|
    t.text    "name"
    t.integer "runtime"
    t.integer "album_id"
    t.integer "artist_id"
    t.text    "preview_url"
    t.integer "popularity"
  end

  add_index "songs", ["album_id"], name: "index_songs_on_album_id"
  add_index "songs", ["artist_id"], name: "index_songs_on_artist_id"

  create_table "toptracks", force: :cascade do |t|
    t.text    "name"
    t.text    "preview_url"
    t.integer "artist_id"
  end

  add_index "toptracks", ["artist_id"], name: "index_toptracks_on_artist_id"

  create_table "tweets", force: :cascade do |t|
    t.text    "content"
    t.integer "user_id"
    t.string  "time"
  end

  add_index "tweets", ["user_id"], name: "index_tweets_on_user_id"

  create_table "users", force: :cascade do |t|
    t.text   "name"
    t.text   "email"
    t.text   "password_digest"
    t.text   "birthday"
    t.string "gender"
    t.text   "image"
  end

end
