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

ActiveRecord::Schema.define(version: 20180326181438) do

  create_table "feeds", force: :cascade do |t|
    t.integer "feedable_id"
    t.string "feedable_type"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "management_workflows", force: :cascade do |t|
    t.datetime "begin_time"
    t.datetime "end_time"
    t.text "content"
    t.integer "project_id"
    t.string "worktype"
    t.float "hours"
    t.float "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "other_itvendors"
    t.string "other_itskills"
  end

  create_table "managementworkflowitskill_relationships", force: :cascade do |t|
    t.integer "management_workflow_id"
    t.integer "tag_itskill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "managementworkflowitvendor_relationships", force: :cascade do |t|
    t.integer "management_workflow_id"
    t.integer "tag_itvendor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "other_workflows", force: :cascade do |t|
    t.datetime "begin_time"
    t.datetime "end_time"
    t.text "content"
    t.integer "otherwork_id"
    t.string "worktype"
    t.float "hours"
    t.float "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "otherworkflowitskills", force: :cascade do |t|
    t.integer "other_workflow_id"
    t.integer "tag_itskill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "otherworkflowitvendors", force: :cascade do |t|
    t.integer "other_workflow_id"
    t.integer "tag_itvendor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_workflows", force: :cascade do |t|
    t.datetime "begin_time"
    t.datetime "end_time"
    t.text "content"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "worktype"
    t.float "hours"
    t.float "cost"
    t.string "other_itvendors"
    t.string "other_itskills"
  end

  create_table "projectmanager_relationships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projectparticipated_relationships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "builder_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "binding_team_id"
    t.string "projecttype"
    t.index ["name"], name: "index_projects_on_name", unique: true
  end

  create_table "projectworkflowitskill_relationships", force: :cascade do |t|
    t.integer "project_workflow_id"
    t.integer "tag_itskill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projectworkflowitvendor_relationships", force: :cascade do |t|
    t.integer "project_workflow_id"
    t.integer "tag_itvendor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tag_itskills", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tag_itvendors", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "teammanager_relationships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_teams_on_name", unique: true
  end

  create_table "useritskill_relationships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "tag_itskill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "useritvendor_relationships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "tag_itvendor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "title"
    t.string "code"
    t.string "phone"
    t.text "description"
    t.integer "team_id"
    t.boolean "is_admin", default: false
    t.boolean "password_resetting", default: true
    t.string "avatar_attachment"
    t.index ["code"], name: "index_users_on_code", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
