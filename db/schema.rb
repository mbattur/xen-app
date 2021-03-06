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

ActiveRecord::Schema.define(version: 2019_01_23_140353) do

  create_table "big_emergencies", force: :cascade do |t|
    t.float "balance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "consumer_debts", force: :cascade do |t|
    t.string "name"
    t.float "balance"
    t.decimal "monthly_minimum"
    t.integer "account_number"
    t.string "payee_name"
    t.string "payee_address1"
    t.string "payee_address2"
    t.string "payee_city"
    t.string "payee_state"
    t.integer "payee_zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "credit_card_debts", force: :cascade do |t|
    t.string "card_name"
    t.float "balance"
    t.integer "card_number"
    t.string "payee_name"
    t.string "payee_address1"
    t.string "payee_address2"
    t.string "payee_city"
    t.string "payee_state"
    t.integer "payee_zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "mortgage_accounts", force: :cascade do |t|
    t.float "balance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.integer "phone"
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "state"
    t.integer "zip"
    t.string "occupation"
    t.date "birthday"
    t.integer "annual_income"
    t.integer "paycheck"
    t.integer "paycheck_occurance"
    t.integer "card_debt"
    t.integer "consumer_debt"
    t.integer "mortgage_balance"
    t.integer "retirment_contribution"
    t.integer "college_contribution"
    t.integer "cash_savings"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "retirement_accounts", force: :cascade do |t|
    t.float "balance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "small_emergencies", force: :cascade do |t|
    t.float "balance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "stack_accounts", force: :cascade do |t|
    t.float "balance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "user_levels", force: :cascade do |t|
    t.integer "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
