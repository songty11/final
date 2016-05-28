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
    t.integer "price"
    t.integer "year"
    t.text    "description"
    t.integer "singer_id"
    t.text    "comment"
  end

  add_index "albums", ["singer_id"], name: "index_albums_on_singer_id"

  create_table "artists", force: :cascade do |t|
    t.text "name"
    t.text "photo_url"
  end

  create_table "composers", force: :cascade do |t|
    t.text "name"
  end

  create_table "songs", force: :cascade do |t|
    t.text    "name"
    t.integer "runtime"
    t.text    "lyrics"
    t.integer "album_id"
    t.integer "singer_id"
    t.integer "Composer_id"
  end

  add_index "songs", ["Composer_id"], name: "index_songs_on_Composer_id"
  add_index "songs", ["album_id"], name: "index_songs_on_album_id"
  add_index "songs", ["singer_id"], name: "index_songs_on_singer_id"

  create_table "users", force: :cascade do |t|
    t.text "name"
    t.text "email"
    t.text "password_digest"
  end

end
