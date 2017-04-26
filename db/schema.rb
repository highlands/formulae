# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_170_425_223_000) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'api_keys', force: :cascade do |t|
    t.integer  'application_id'
    t.boolean  'creator'
    t.boolean  'submitter'
    t.boolean  'analytics'
    t.datetime 'created_at',     null: false
    t.datetime 'updated_at',     null: false
    t.index ['application_id'], name: 'index_api_keys_on_application_id', using: :btree
  end

  create_table 'applications', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'choices', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'form_submissions', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'forms', force: :cascade do |t|
    t.integer  'application_id'
    t.datetime 'created_at',     null: false
    t.datetime 'updated_at',     null: false
    t.index ['application_id'], name: 'index_forms_on_application_id', using: :btree
  end

  create_table 'question_dependencies', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'question_submissions', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'questions', force: :cascade do |t|
    t.string   'key'
    t.string   'label'
    t.text     'content'
    t.integer  'order'
    t.boolean  'hidden'
    t.string   'question_type'
    t.datetime 'created_at',    null: false
    t.datetime 'updated_at',    null: false
    t.integer  'section_id'
    t.index ['section_id'], name: 'index_questions_on_section_id', using: :btree
  end

  create_table 'sections', force: :cascade do |t|
    t.integer  'form_id'
    t.string   'name'
    t.integer  'order'
    t.text     'content'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['form_id'], name: 'index_sections_on_form_id', using: :btree
  end

  add_foreign_key 'api_keys', 'applications'
  add_foreign_key 'forms', 'applications'
  add_foreign_key 'questions', 'sections'
  add_foreign_key 'sections', 'forms'
end
