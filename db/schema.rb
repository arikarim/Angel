# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_210_805_132_945) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'jwt_denylist', force: :cascade do |t|
    t.string 'jti', null: false
    t.datetime 'exp', null: false
    t.index ['jti'], name: 'index_jwt_denylist_on_jti'
  end

  create_table 'measures', force: :cascade do |t|
    t.string 'name'
    t.bigint 'user_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['user_id'], name: 'index_measures_on_user_id'
  end

  create_table 'measurments', force: :cascade do |t|
    t.integer 'number'
    t.date 'date'
    t.bigint 'user_id', null: false
    t.bigint 'measure_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['measure_id'], name: 'index_measurments_on_measure_id'
    t.index ['user_id'], name: 'index_measurments_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'bio'
    t.text 'about'
    t.json 'image_data'
    t.boolean 'availability'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'measures', 'users'
  add_foreign_key 'measurments', 'measures'
  add_foreign_key 'measurments', 'users'
end
