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

ActiveRecord::Schema.define(version: 20170201020135) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bikes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "given_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conditions", force: :cascade do |t|
    t.date     "date"
    t.integer  "max_temperature"
    t.integer  "mean_temperature"
    t.integer  "min_temperature"
    t.integer  "mean_humidity"
    t.integer  "mean_visibility"
    t.integer  "mean_wind_speed"
    t.integer  "precipitation"
    t.integer  "zipcode"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "stations", force: :cascade do |t|
    t.string   "name"
    t.integer  "dock_count"
    t.date     "installation_date"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "city_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trips", force: :cascade do |t|
    t.bigint   "duration"
    t.string   "start_date"
    t.integer  "start_station_id"
    t.integer  "end_station_id"
    t.string   "end_date"
    t.integer  "bike_id"
    t.integer  "subscription_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.bigint   "zipcode"
    t.integer  "condition_id"
  end

end
