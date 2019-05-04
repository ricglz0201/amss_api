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

ActiveRecord::Schema.define(version: 2019_05_04_043017) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bus_routes", force: :cascade do |t|
    t.bigint "buses_id"
    t.bigint "routes_id"
    t.index ["buses_id"], name: "index_bus_routes_on_buses_id"
    t.index ["routes_id"], name: "index_bus_routes_on_routes_id"
  end

  create_table "buses", force: :cascade do |t|
    t.integer "bycicles_slots_available"
    t.integer "seats_available"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.bigint "users_id"
    t.bigint "stops_id"
    t.boolean "bike_seat_reserved"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stops_id"], name: "index_reservations_on_stops_id"
    t.index ["users_id"], name: "index_reservations_on_users_id"
  end

  create_table "route_stops", force: :cascade do |t|
    t.bigint "routes_id"
    t.bigint "stops_id"
    t.datetime "hour_of_arriving"
    t.index ["routes_id"], name: "index_route_stops_on_routes_id"
    t.index ["stops_id"], name: "index_route_stops_on_stops_id"
  end

  create_table "routes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seats", force: :cascade do |t|
    t.bigint "buses_id"
    t.integer "seat_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buses_id"], name: "index_seats_on_buses_id"
  end

  create_table "stops", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trips", force: :cascade do |t|
    t.bigint "seats_id"
    t.bigint "reservations_id"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reservations_id"], name: "index_trips_on_reservations_id"
    t.index ["seats_id"], name: "index_trips_on_seats_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "uuid"
    t.string "mail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bus_routes", "buses", column: "buses_id"
  add_foreign_key "bus_routes", "routes", column: "routes_id"
  add_foreign_key "reservations", "stops", column: "stops_id"
  add_foreign_key "reservations", "users", column: "users_id"
  add_foreign_key "route_stops", "routes", column: "routes_id"
  add_foreign_key "route_stops", "stops", column: "stops_id"
  add_foreign_key "seats", "buses", column: "buses_id"
  add_foreign_key "trips", "reservations", column: "reservations_id"
  add_foreign_key "trips", "seats", column: "seats_id"
end
