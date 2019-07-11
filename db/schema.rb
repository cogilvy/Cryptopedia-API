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

ActiveRecord::Schema.define(version: 2019_07_09_232343) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cryptos", force: :cascade do |t|
    t.string "name"
    t.string "symbol"
    t.decimal "price"
    t.string "logo"
    t.money "market_cap", scale: 2
    t.money "volume", scale: 2
    t.decimal "change_1hr"
    t.decimal "change_24hr"
    t.decimal "change_7d"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "crypto_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["crypto_id"], name: "index_favorites_on_crypto_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "title"
    t.datetime "start"
    t.datetime "end"
    t.decimal "budget"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "portfolio_values", force: :cascade do |t|
    t.bigint "portfolio_id"
    t.decimal "value"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["portfolio_id"], name: "index_portfolio_values_on_portfolio_id"
  end

  create_table "portfolios", force: :cascade do |t|
    t.string "name"
    t.decimal "budget"
    t.bigint "user_id"
    t.bigint "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_portfolios_on_game_id"
    t.index ["user_id"], name: "index_portfolios_on_user_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.decimal "quantity"
    t.bigint "crypto_id"
    t.bigint "portfolio_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["crypto_id"], name: "index_purchases_on_crypto_id"
    t.index ["portfolio_id"], name: "index_purchases_on_portfolio_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "password_digest"
    t.boolean "premium"
    t.integer "wins"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "favorites", "cryptos"
  add_foreign_key "favorites", "users"
  add_foreign_key "portfolio_values", "portfolios"
  add_foreign_key "portfolios", "games"
  add_foreign_key "portfolios", "users"
  add_foreign_key "purchases", "cryptos"
  add_foreign_key "purchases", "portfolios"
end
