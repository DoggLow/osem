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

ActiveRecord::Schema.define(:version => 20130105115603) do

  create_table "call_for_papers", :force => true do |t|
    t.date     "start_date",    :null => false
    t.date     "end_date",      :null => false
    t.date     "hard_deadline", :null => false
    t.text     "description",   :null => false
    t.integer  "conference_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "comments", :force => true do |t|
    t.string   "title",            :limit => 50, :default => ""
    t.text     "body"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
    t.string   "subject"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
  end

  add_index "comments", ["commentable_id"], :name => "index_comments_on_commentable_id"
  add_index "comments", ["commentable_type"], :name => "index_comments_on_commentable_type"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "conferences", :force => true do |t|
    t.string   "guid",                                 :null => false
    t.string   "title",                                :null => false
    t.string   "short_title",                          :null => false
    t.string   "social_tag"
    t.string   "contact_email",                        :null => false
    t.string   "timezone",                             :null => false
    t.string   "html_export_path"
    t.date     "start_date",                           :null => false
    t.date     "end_date",                             :null => false
    t.boolean  "cfp_open",          :default => false
    t.boolean  "registration_open", :default => false
    t.integer  "venue_id"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  create_table "event_attachments", :force => true do |t|
    t.integer  "event_id"
    t.string   "title",                   :null => false
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "event_people", :force => true do |t|
    t.integer  "proposal_id"
    t.integer  "person_id"
    t.integer  "event_id"
    t.string   "event_role",  :default => "participant", :null => false
    t.string   "comment"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  create_table "event_types", :force => true do |t|
    t.integer "conference_id"
    t.string  "title",                         :null => false
    t.integer "length",        :default => 30
  end

  create_table "events", :force => true do |t|
    t.string   "guid",                                            :null => false
    t.integer  "conference_id"
    t.integer  "event_type_id"
    t.string   "title",                                           :null => false
    t.string   "subtitle"
    t.integer  "time_slots"
    t.string   "state",                        :default => "new", :null => false
    t.string   "progress",                     :default => "new", :null => false
    t.string   "language"
    t.datetime "start_time"
    t.text     "abstract"
    t.text     "description"
    t.boolean  "public",                       :default => true
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.integer  "track_id"
    t.integer  "room_id"
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
    t.text     "proposal_additional_speakers"
  end

  create_table "people", :force => true do |t|
    t.string   "guid",                                :null => false
    t.string   "first_name",          :default => ""
    t.string   "last_name",           :default => ""
    t.string   "public_name",         :default => ""
    t.string   "company",             :default => ""
    t.string   "email",                               :null => false
    t.boolean  "email_public"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.text     "biography"
    t.integer  "user_id"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  create_table "registrations", :force => true do |t|
    t.integer  "person_id"
    t.integer  "conference_id"
    t.boolean  "attending_social_events",              :default => true
    t.boolean  "attending_social_events_with_partner", :default => false
    t.boolean  "using_affiliated_lodging",             :default => true
    t.date     "arrival"
    t.date     "departure"
    t.text     "additional_speakers"
    t.datetime "created_at",                                              :null => false
    t.datetime "updated_at",                                              :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "rooms", :force => true do |t|
    t.string  "guid",                            :null => false
    t.integer "conference_id"
    t.string  "name",                            :null => false
    t.integer "size"
    t.boolean "public",        :default => true
  end

  create_table "tracks", :force => true do |t|
    t.string   "guid",                                :null => false
    t.integer  "conference_id"
    t.string   "name",                                :null => false
    t.text     "description"
    t.string   "color",         :default => "ffffff"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "venues", :force => true do |t|
    t.string   "guid"
    t.string   "name"
    t.string   "address"
    t.string   "website"
    t.text     "description"
    t.string   "offline_map_url"
    t.string   "offline_map_bounds"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

end
