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

ActiveRecord::Schema.define(version: 20181207134744) do

  create_table "eco_companies", force: :cascade do |t|
    t.string "name"
    t.string "contact_name"
    t.integer "contact_phone"
    t.text "description"
    t.string "img"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "eco_tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feeds", force: :cascade do |t|
    t.integer "feedable_id"
    t.string "feedable_type"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "begin_time"
    t.datetime "end_time"
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

  create_table "project_costs", force: :cascade do |t|
    t.integer "project_id", default: 0
    t.integer "mould_fee", default: 0
    t.integer "labor_fee", default: 0
    t.integer "manual_fee", default: 0
    t.integer "custodian_fee", default: 0
    t.integer "sum_engineer_fee", default: 0
    t.integer "sum_fee", default: 0
    t.datetime "commit_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "project_code"
    t.integer "import_user_id"
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
    t.integer "sales_id"
    t.string "code"
    t.integer "pm_id"
    t.string "project_class"
    t.string "customer_name"
    t.string "customer_contact_name"
    t.string "customer_contact_phone"
    t.string "customer_contact_email"
    t.string "area"
    t.datetime "begin_time"
    t.datetime "end_time"
    t.boolean "is_disabled", default: false
    t.integer "engineering_costs", default: 0
    t.integer "custody_charge", default: 0
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

  create_table "solution_tags", force: :cascade do |t|
    t.string "solution_type"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "solutions", force: :cascade do |t|
    t.string "type"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "background"
    t.text "desc"
    t.text "value"
    t.text "success_case"
    t.string "solution_pic"
  end

  create_table "solutionsolutiontages_relationships", force: :cascade do |t|
    t.integer "solution_tag_id"
    t.integer "solution_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "maintype"
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
    t.string "team_type"
    t.integer "parent_id"
    t.index ["name"], name: "index_teams_on_name", unique: true
  end

  create_table "training_article_tag_relationships", force: :cascade do |t|
    t.integer "training_tag_id"
    t.integer "training_article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "training_articles", force: :cascade do |t|
    t.string "name"
    t.string "plantform"
    t.string "place"
    t.integer "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "wechatlink"
  end

  create_table "training_tags", force: :cascade do |t|
    t.string "name"
    t.string "training_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "img"
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
    t.string "itcode"
    t.string "entry_time"
    t.string "area_name"
    t.string "status"
    t.string "worktype"
    t.string "cost_center"
    t.string "level"
    t.integer "cost"
    t.string "resume_attachment"
    t.string "idcard_attachment"
    t.string "degree"
    t.string "degree_attachment"
    t.string "academic_attachment"
    t.boolean "is_updateattachment", default: false
    t.integer "extra_cost"
    t.boolean "is_feedneeded", default: false
    t.boolean "is_enabled", default: true
    t.string "company", default: "ITS"
    t.index ["code"], name: "index_users_on_code", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "white_papers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "subject_id"
  end

end
