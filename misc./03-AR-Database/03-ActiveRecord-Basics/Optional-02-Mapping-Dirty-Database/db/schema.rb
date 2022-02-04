# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  create_table "ARTIST", id: false, force: :cascade do |t|
    t.integer "artist_code", null: false
    t.string "name", limit: 120
  end

  create_table "MEDIATYPES", force: :cascade do |t|
    t.string "name", limit: 120
  end

  create_table "THE_ALBUMS", force: :cascade do |t|
    t.string "title", limit: 160, null: false
    t.integer "id_artist", null: false
  end

  create_table "TRACK", force: :cascade do |t|
    t.integer "album_id"
    t.integer "media_type_id", null: false
    t.integer "genre_id"
    t.string "name", limit: 200, null: false
    t.string "composer", limit: 220
    t.integer "milliseconds", null: false
    t.integer "bytes"
    t.decimal "unit_price", precision: 10, scale: 2, null: false
  end

  create_table "genrez", force: :cascade do |t|
    t.string "name", limit: 120
  end

# Could not dump table "sqlite_stat1" because of following StandardError
#   Unknown type '' for column 'tbl'

end
