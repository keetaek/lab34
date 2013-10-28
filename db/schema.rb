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

ActiveRecord::Schema.define(:version => 20130816024033) do

  create_table "application_question_answers", :force => true do |t|
    t.text     "answer"
    t.integer  "application_id"
    t.integer  "role_question_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "application_reviews", :force => true do |t|
    t.integer  "score"
    t.text     "comment"
    t.integer  "application_id"
    t.integer  "audition_admin_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "applications", :force => true do |t|
    t.integer  "audition_id"
    t.integer  "role_id"
    t.integer  "user_id"
    t.string   "video_path"
    t.string   "picture_path"
    t.text     "answers"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
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
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "auditions", :force => true do |t|
    t.string   "title"
    t.string   "audition_type"
    t.string   "logo"
    t.text     "description"
    t.string   "status"
    t.datetime "deadline_date"
    t.string   "zip"
    t.integer  "host_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "media", :force => true do |t|
    t.string   "title"
    t.boolean  "private"
    t.text     "description"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "media_resource_id"
    t.string   "media_resource_type"
  end

  create_table "oauth_access_grants", :force => true do |t|
    t.integer  "resource_owner_id", :null => false
    t.integer  "application_id",    :null => false
    t.string   "token",             :null => false
    t.integer  "expires_in",        :null => false
    t.string   "redirect_uri",      :null => false
    t.datetime "created_at",        :null => false
    t.datetime "revoked_at"
    t.string   "scopes"
  end

  add_index "oauth_access_grants", ["token"], :name => "index_oauth_access_grants_on_token", :unique => true

  create_table "oauth_access_tokens", :force => true do |t|
    t.integer  "resource_owner_id"
    t.integer  "application_id",    :null => false
    t.string   "token",             :null => false
    t.string   "refresh_token"
    t.integer  "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at",        :null => false
    t.string   "scopes"
  end

  add_index "oauth_access_tokens", ["refresh_token"], :name => "index_oauth_access_tokens_on_refresh_token", :unique => true
  add_index "oauth_access_tokens", ["resource_owner_id"], :name => "index_oauth_access_tokens_on_resource_owner_id"
  add_index "oauth_access_tokens", ["token"], :name => "index_oauth_access_tokens_on_token", :unique => true

  create_table "oauth_applications", :force => true do |t|
    t.string   "name",         :null => false
    t.string   "uid",          :null => false
    t.string   "secret",       :null => false
    t.string   "redirect_uri", :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "oauth_applications", ["uid"], :name => "index_oauth_applications_on_uid", :unique => true

  create_table "pictures", :force => true do |t|
    t.string   "title"
    t.boolean  "private"
    t.string   "image"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "role_questions", :force => true do |t|
    t.string   "question"
    t.integer  "role_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "audition_id"
    t.date     "job_start_date"
    t.date     "job_end_date"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "user_details", :force => true do |t|
    t.text     "summary"
    t.string   "phone"
    t.integer  "view_count"
    t.string   "thumbnail"
    t.string   "website1"
    t.string   "website2"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "firstName"
    t.string   "lastName"
    t.string   "type"
    t.string   "imdbUrl"
    t.string   "facebookId"
    t.string   "twitterId"
    t.string   "linkedInUrl"
    t.string   "city"
    t.string   "thumbnail"
    t.text     "selfBio"
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "videos", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.boolean  "private"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
