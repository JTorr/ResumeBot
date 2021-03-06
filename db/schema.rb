# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141016203225) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "educations", force: true do |t|
    t.string   "institution"
    t.string   "area"
    t.string   "study_type"
    t.date     "start_date"
    t.date     "end_date"
    t.decimal  "gpa"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "experiences", force: true do |t|
    t.string   "company_name"
    t.string   "position"
    t.date     "start_date"
    t.date     "end_date"
    t.text     "summary"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resume_educations", force: true do |t|
    t.integer  "resume_id"
    t.integer  "education_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "resume_educations", ["education_id"], name: "index_resume_educations_on_education_id", using: :btree
  add_index "resume_educations", ["resume_id"], name: "index_resume_educations_on_resume_id", using: :btree

  create_table "resume_experiences", force: true do |t|
    t.integer  "resume_id"
    t.integer  "experience_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "resume_experiences", ["experience_id"], name: "index_resume_experiences_on_experience_id", using: :btree
  add_index "resume_experiences", ["resume_id"], name: "index_resume_experiences_on_resume_id", using: :btree

  create_table "resume_skills", force: true do |t|
    t.integer  "resume_id"
    t.integer  "skill_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "resume_skills", ["resume_id"], name: "index_resume_skills_on_resume_id", using: :btree
  add_index "resume_skills", ["skill_id"], name: "index_resume_skills_on_skill_id", using: :btree

  create_table "resumes", force: true do |t|
    t.integer  "user_id"
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_1"
    t.string   "phone_2"
    t.string   "phone_3"
    t.string   "address"
    t.integer  "postal_code"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "master"
    t.string   "title"
  end

  create_table "skills", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
