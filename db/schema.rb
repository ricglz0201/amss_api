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

ActiveRecord::Schema.define(version: 2019_05_04_043018) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buses", force: :cascade do |t|
    t.integer "bycicles_slots_available"
    t.integer "seats_available"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "buses_routes", force: :cascade do |t|
    t.bigint "bus_id"
    t.bigint "route_id"
    t.index ["bus_id"], name: "index_buses_routes_on_bus_id"
    t.index ["route_id"], name: "index_buses_routes_on_route_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "stop_id"
    t.bigint "trip_id"
    t.boolean "bike_seat_reserved"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stop_id"], name: "index_reservations_on_stop_id"
    t.index ["trip_id"], name: "index_reservations_on_trip_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "routes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "routes_stops", force: :cascade do |t|
    t.bigint "route_id"
    t.bigint "stop_id"
    t.datetime "hour_of_arriving"
    t.index ["route_id"], name: "index_routes_stops_on_route_id"
    t.index ["stop_id"], name: "index_routes_stops_on_stop_id"
  end

  create_table "seats", force: :cascade do |t|
    t.bigint "bus_id"
    t.integer "seat_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bus_id"], name: "index_seats_on_bus_id"
  end

  create_table "stops", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trips", force: :cascade do |t|
    t.bigint "seat_id"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["seat_id"], name: "index_trips_on_seat_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "uuid"
    t.string "mail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "buses_routes", "buses"
  add_foreign_key "buses_routes", "routes"
  add_foreign_key "reservations", "stops"
  add_foreign_key "reservations", "trips"
  add_foreign_key "reservations", "users"
  add_foreign_key "routes_stops", "routes"
  add_foreign_key "routes_stops", "stops"
  add_foreign_key "seats", "buses"
  add_foreign_key "trips", "seats"
end
