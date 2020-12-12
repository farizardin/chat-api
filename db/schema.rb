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

ActiveRecord::Schema.define(version: 2020_12_11_172613) do

# Could not dump table "conversation_rooms" because of following ActiveRecord::StatementInvalid
#   Mysql2::Error: Unknown table 'check_constraints' in information_schema

# Could not dump table "conversations" because of following ActiveRecord::StatementInvalid
#   Mysql2::Error: Unknown table 'check_constraints' in information_schema

# Could not dump table "users" because of following ActiveRecord::StatementInvalid
#   Mysql2::Error: Unknown table 'check_constraints' in information_schema

  add_foreign_key "conversation_rooms", "conversations", column: "last_message"
  add_foreign_key "conversation_rooms", "users", column: "participant_1"
  add_foreign_key "conversation_rooms", "users", column: "participant_2"
  add_foreign_key "conversations", "conversation_rooms", column: "room_id"
  add_foreign_key "conversations", "users", column: "destination"
  add_foreign_key "conversations", "users", column: "sender"
end
