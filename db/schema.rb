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

ActiveRecord::Schema.define(version: 20170425223000) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "api_keys", id: :serial, force: :cascade do |t|
    t.integer "application_id"
    t.boolean "creator"
    t.boolean "submitter"
    t.boolean "analytics"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["application_id"], name: "index_api_keys_on_application_id"
  end

  create_table "applications", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "choices", id: :serial, force: :cascade do |t|
    t.integer "question_id"
    t.integer "question_dependency_id"
    t.jsonb "metadata", default: "{}"
    t.integer "maximum_chosen"
    t.string "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_dependency_id"], name: "index_choices_on_question_dependency_id"
    t.index ["question_id"], name: "index_choices_on_question_id"
  end

  create_table "form_submissions", id: :serial, force: :cascade do |t|
    t.integer "form_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form_id"], name: "index_form_submissions_on_form_id"
  end

  create_table "forms", id: :serial, force: :cascade do |t|
    t.integer "application_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["application_id"], name: "index_forms_on_application_id"
  end

  create_table "question_dependencies", id: :serial, force: :cascade do |t|
    t.integer "question_id"
    t.boolean "display"
    t.boolean "and"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_question_dependencies_on_question_id"
  end

  create_table "question_submissions", id: :serial, force: :cascade do |t|
    t.integer "form_submission_id"
    t.integer "question_id"
    t.string "string"
    t.text "text"
    t.boolean "boolean"
    t.integer "multi_select_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form_submission_id"], name: "index_question_submissions_on_form_submission_id"
    t.index ["multi_select_id"], name: "index_question_submissions_on_multi_select_id"
    t.index ["question_id"], name: "index_question_submissions_on_question_id"
  end

  create_table "questions", id: :serial, force: :cascade do |t|
    t.string "key"
    t.string "label"
    t.text "content"
    t.integer "order"
    t.boolean "hidden"
    t.string "question_type"
    t.string "validate_as"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "section_id"
    t.index ["section_id"], name: "index_questions_on_section_id"
  end

  create_table "sections", id: :serial, force: :cascade do |t|
    t.integer "form_id"
    t.string "name"
    t.integer "order"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form_id"], name: "index_sections_on_form_id"
  end

  add_foreign_key "api_keys", "applications"
  add_foreign_key "choices", "questions"
  add_foreign_key "forms", "applications"
  add_foreign_key "question_dependencies", "questions"
  add_foreign_key "questions", "sections"
  add_foreign_key "sections", "forms"
end
