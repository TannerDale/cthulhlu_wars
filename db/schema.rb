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

ActiveRecord::Schema.define(version: 2021_08_16_043102) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cultists", force: :cascade do |t|
    t.bigint "faction_id"
    t.string "name", null: false
    t.string "ability", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["faction_id"], name: "index_cultists_on_faction_id"
  end

  create_table "factions", force: :cascade do |t|
    t.string "name", null: false
    t.string "color", null: false
    t.string "description", null: false
    t.string "unique_ability", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "display_color"
  end

  create_table "game_days", force: :cascade do |t|
    t.date "day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "great_old_ones", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "faction_id"
    t.integer "cost", null: false
    t.string "awaken_steps", null: false
    t.string "combat", null: false
    t.string "ability", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["faction_id"], name: "index_great_old_ones_on_faction_id"
  end

  create_table "monsters", force: :cascade do |t|
    t.bigint "faction_id"
    t.string "name"
    t.integer "cost"
    t.string "combat"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["faction_id"], name: "index_monsters_on_faction_id"
  end

  create_table "spellbook_requirements", force: :cascade do |t|
    t.bigint "faction_id"
    t.string "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["faction_id"], name: "index_spellbook_requirements_on_faction_id"
  end

  create_table "spellbooks", force: :cascade do |t|
    t.bigint "faction_id"
    t.string "name", null: false
    t.string "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "use"
    t.index ["faction_id"], name: "index_spellbooks_on_faction_id"
  end

  create_table "user_factions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "faction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["faction_id"], name: "index_user_factions_on_faction_id"
    t.index ["user_id"], name: "index_user_factions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0
  end

  add_foreign_key "cultists", "factions"
  add_foreign_key "great_old_ones", "factions"
  add_foreign_key "monsters", "factions"
  add_foreign_key "spellbook_requirements", "factions"
  add_foreign_key "spellbooks", "factions"
  add_foreign_key "user_factions", "factions"
  add_foreign_key "user_factions", "users"
end
