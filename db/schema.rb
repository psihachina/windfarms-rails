# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_12_07_072129) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "turbines", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.float "maximum_power"
    t.float "max_wind_speed"
    t.float "min_wind_speed"
    t.integer "blades"
    t.float "tower_height"
    t.float "rotor_diameter"
    t.string "description"
    t.index ["maximum_power"], name: "index_turbines_on_maximum_power"
    t.index ["name"], name: "index_turbines_on_name"
  end

end
