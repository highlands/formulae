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

ActiveRecord::Schema.define(version: 20180111210325) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"
  enable_extension "pgcrypto"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "api_keys", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid "application_id"
    t.boolean "creator"
    t.boolean "submitter"
    t.boolean "analytics"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "token"
    t.index ["application_id"], name: "index_api_keys_on_application_id"
    t.index ["token"], name: "index_api_keys_on_token", unique: true
  end

  create_table "applications", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "choices", id: false, force: :cascade do |t|
    t.uuid "id"
    t.uuid "question_id"
    t.uuid "question_dependency_id"
    t.jsonb "metadata", default: "{}"
    t.integer "maximum_chosen"
    t.string "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order"
    t.index ["id"], name: "index_choices_on_id", unique: true
    t.index ["question_dependency_id"], name: "index_choices_on_question_dependency_id"
    t.index ["question_id"], name: "index_choices_on_question_id"
  end

  create_table "form_submissions", id: false, force: :cascade do |t|
    t.uuid "id", null: false
    t.uuid "form_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form_id"], name: "index_form_submissions_on_form_id"
    t.index ["id"], name: "index_form_submissions_on_id", unique: true
  end

  create_table "forms", id: false, force: :cascade do |t|
    t.uuid "id", null: false
    t.uuid "application_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "completion_content"
    t.index ["application_id"], name: "index_forms_on_application_id"
    t.index ["id"], name: "index_forms_on_id", unique: true
  end

  create_table "question_dependencies", id: false, force: :cascade do |t|
    t.uuid "id", null: false
    t.uuid "question_id"
    t.boolean "display"
    t.boolean "and"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_question_dependencies_on_id", unique: true
    t.index ["question_id"], name: "index_question_dependencies_on_question_id"
  end

  create_table "question_dependency_choices", id: false, force: :cascade do |t|
    t.uuid "id", null: false
    t.uuid "question_dependency_id"
    t.uuid "choice_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["choice_id"], name: "index_question_dependency_choices_on_choice_id"
    t.index ["id"], name: "index_question_dependency_choices_on_id", unique: true
    t.index ["question_dependency_id"], name: "index_question_dependency_choices_on_question_dependency_id"
  end

  create_table "question_submissions", id: false, force: :cascade do |t|
    t.uuid "id", null: false
    t.uuid "form_submission_id"
    t.uuid "question_id"
    t.string "string"
    t.text "text"
    t.boolean "boolean"
    t.integer "multi_select_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "composite"
    t.index ["form_submission_id"], name: "index_question_submissions_on_form_submission_id"
    t.index ["id"], name: "index_question_submissions_on_id", unique: true
    t.index ["multi_select_id"], name: "index_question_submissions_on_multi_select_id"
    t.index ["question_id"], name: "index_question_submissions_on_question_id"
  end

  create_table "questions", id: false, force: :cascade do |t|
    t.uuid "id", null: false
    t.string "key"
    t.string "label"
    t.text "content"
    t.integer "order"
    t.boolean "hidden"
    t.string "question_type"
    t.string "validate_as"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "section_id"
    t.boolean "required"
    t.string "placeholder"
    t.index ["id"], name: "index_questions_on_id", unique: true
    t.index ["section_id"], name: "index_questions_on_section_id"
  end

  create_table "sections", id: false, force: :cascade do |t|
    t.uuid "id", null: false
    t.uuid "form_id"
    t.string "name"
    t.integer "order"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form_id"], name: "index_sections_on_form_id"
    t.index ["id"], name: "index_sections_on_id", unique: true
  end

end
