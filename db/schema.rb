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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120304054657) do

  create_table "application_question_answers", :force => true do |t|
    t.text     "answer"
    t.integer  "application_id"
    t.integer  "role_question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "application_reviews", :force => true do |t|
    t.integer  "score"
    t.text     "comment"
    t.integer  "application_id"
    t.integer  "audition_admin_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "applications", :force => true do |t|
    t.integer  "role_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "applications_pictures", :id => false, :force => true do |t|
    t.integer "application_id"
    t.integer "picture_id"
  end

  create_table "applications_videos", :id => false, :force => true do |t|
    t.integer "application_id"
    t.integer "video_id"
  end

  create_table "audition_admins", :force => true do |t|
    t.integer  "user_id"
    t.integer  "audition_id"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "auditions", :force => true do |t|
    t.string   "title"
    t.string   "type"
    t.string   "logo"
    t.text     "description"
    t.string   "status"
    t.datetime "deadline_date"
    t.string   "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "auditions_users", :id => false, :force => true do |t|
    t.integer "audition_id"
    t.integer "user_id"
  end

  create_table "media", :force => true do |t|
    t.string   "title"
    t.boolean  "private"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "media_resource_id"
    t.string   "media_resource_type"
  end

  create_table "pictures", :force => true do |t|
    t.string   "image"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "role_questions", :force => true do |t|
    t.string   "question"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "attachment"
    t.integer  "audition_id"
    t.date     "job_start_date"
    t.date     "job_end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_details", :force => true do |t|
    t.text     "summary"
    t.string   "phone"
    t.integer  "view_count"
    t.string   "thumbnail"
    t.string   "website1"
    t.string   "website2"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "firstName"
    t.string   "lastName"
    t.string   "type"
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "videos", :force => true do |t|
    t.string   "panda_video_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
