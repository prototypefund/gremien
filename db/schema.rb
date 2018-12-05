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

ActiveRecord::Schema.define(version: 20181019140536) do

  create_table "accounts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "status"
    t.bigint "visitor_id"
    t.string "email"
    t.string "password_digest"
    t.string "auth_token"
    t.datetime "auth_sent_at"
    t.integer "lock_version", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["visitor_id"], name: "index_accounts_on_visitor_id"
  end

  create_table "appvars", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "key"
    t.string "value"
    t.integer "lock_version", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "arguments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "token"
    t.string "status"
    t.string "kind"
    t.bigint "procedure_id"
    t.bigint "author_id"
    t.string "title"
    t.text "description"
    t.integer "lock_version", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_arguments_on_author_id"
    t.index ["procedure_id"], name: "index_arguments_on_procedure_id"
  end

  create_table "attachments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "token"
    t.string "status"
    t.string "kind"
    t.string "file"
    t.string "url"
    t.string "title"
    t.string "entity_type"
    t.bigint "entity_id"
    t.bigint "author_id"
    t.integer "lock_version", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_attachments_on_author_id"
    t.index ["entity_type", "entity_id"], name: "index_attachments_on_entity_type_and_entity_id"
  end

  create_table "bodies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "token"
    t.string "status"
    t.string "name"
    t.text "description"
    t.string "url"
    t.bigint "owner_id"
    t.integer "lock_version", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_bodies_on_owner_id"
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "token"
    t.string "status"
    t.bigint "argument_id"
    t.text "content"
    t.bigint "author_id"
    t.integer "lock_version", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["argument_id"], name: "index_comments_on_argument_id"
    t.index ["author_id"], name: "index_comments_on_author_id"
  end

  create_table "deals", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "procedure_id"
    t.datetime "deal_at"
    t.string "action"
    t.string "location"
    t.string "url"
    t.integer "lock_version", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["procedure_id"], name: "index_deals_on_procedure_id"
  end

  create_table "exports", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "token"
    t.bigint "account_id"
    t.bigint "procedure_id"
    t.text "settings"
    t.integer "lock_version", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_exports_on_account_id"
    t.index ["procedure_id"], name: "index_exports_on_procedure_id"
  end

  create_table "favs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "kind", default: "up", null: false
    t.string "entity_type"
    t.bigint "entity_id"
    t.bigint "author_id"
    t.integer "lock_version", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_favs_on_author_id"
    t.index ["entity_type", "entity_id"], name: "index_favs_on_entity_type_and_entity_id"
  end

  create_table "follows", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "token"
    t.string "status"
    t.string "entity_type"
    t.bigint "entity_id"
    t.bigint "author_id"
    t.datetime "last_sent_at"
    t.integer "clicks"
    t.integer "lock_version", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_follows_on_author_id"
    t.index ["entity_type", "entity_id"], name: "index_follows_on_entity_type_and_entity_id"
  end

  create_table "leutes", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email"
    t.string "fname", default: ""
    t.string "lname"
    t.string "gender", limit: 1, default: "M"
    t.string "language", default: "de"
    t.string "party", default: "CDU"
  end

  create_table "logs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "ip"
    t.string "actor_type"
    t.bigint "actor_id"
    t.string "action"
    t.text "comment"
    t.string "entity_type"
    t.bigint "entity_id"
    t.string "user_agent", limit: 1000
    t.integer "lock_version", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["actor_type", "actor_id"], name: "index_logs_on_actor_type_and_actor_id"
    t.index ["entity_type", "entity_id"], name: "index_logs_on_entity_type_and_entity_id"
  end

  create_table "moderatorships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "procedure_id"
    t.bigint "moderator_id"
    t.integer "lock_version", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["moderator_id"], name: "index_moderatorships_on_moderator_id"
    t.index ["procedure_id"], name: "index_moderatorships_on_procedure_id"
  end

  create_table "periods", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "token"
    t.string "status"
    t.string "name"
    t.bigint "owner_id"
    t.integer "lock_version", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_periods_on_owner_id"
  end

  create_table "procedures", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "token"
    t.string "status"
    t.string "kind"
    t.bigint "body_id"
    t.bigint "owner_id"
    t.string "title"
    t.string "language"
    t.text "abstract"
    t.text "description"
    t.string "url"
    t.string "proc_type"
    t.string "current_status"
    t.string "mod_kind"
    t.integer "required_votes"
    t.integer "edit_delay"
    t.datetime "submission_at"
    t.datetime "last_change_at"
    t.datetime "vote_date_at"
    t.datetime "vote_end_at"
    t.string "auth_token"
    t.datetime "auth_created_at"
    t.datetime "last_check_at"
    t.integer "lock_version", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["body_id"], name: "index_procedures_on_body_id"
    t.index ["owner_id"], name: "index_procedures_on_owner_id"
  end

  create_table "procedures_subjectgroups", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "procedure_id", null: false
    t.bigint "subjectgroup_id", null: false
    t.index ["procedure_id"], name: "index_procedures_subjectgroups_on_procedure_id"
    t.index ["subjectgroup_id"], name: "index_procedures_subjectgroups_on_subjectgroup_id"
  end

  create_table "procedures_tags", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "procedure_id", null: false
    t.bigint "tag_id", null: false
    t.index ["procedure_id"], name: "index_procedures_tags_on_procedure_id"
    t.index ["tag_id"], name: "index_procedures_tags_on_tag_id"
  end

  create_table "ratings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "token"
    t.string "status"
    t.string "kind"
    t.string "entity_type"
    t.bigint "entity_id"
    t.bigint "visitor_id"
    t.boolean "option1"
    t.boolean "option2"
    t.boolean "option3"
    t.string "comment", limit: 500
    t.integer "lock_version", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entity_type", "entity_id"], name: "index_ratings_on_entity_type_and_entity_id"
    t.index ["visitor_id"], name: "index_ratings_on_visitor_id"
  end

  create_table "receipts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "token"
    t.string "status"
    t.bigint "procedure_id"
    t.bigint "visitor_id"
    t.string "email"
    t.string "auth_token"
    t.datetime "auth_sent_at"
    t.integer "lock_version", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["procedure_id"], name: "index_receipts_on_procedure_id"
    t.index ["visitor_id"], name: "index_receipts_on_visitor_id"
  end

  create_table "subjectgroups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.bigint "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_subjectgroups_on_owner_id"
  end

  create_table "tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "key"
    t.string "value"
    t.bigint "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_tags_on_owner_id"
  end

  create_table "visitors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "token"
    t.string "status"
    t.string "email"
    t.string "ident_scheme"
    t.text "settings"
    t.string "auth_token"
    t.datetime "auth_created_at"
    t.integer "lock_version", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "votes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "procedure_id"
    t.string "ident_scheme"
    t.string "area"
    t.string "vote"
    t.integer "count", default: 0, null: false
    t.integer "lock_version", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["procedure_id"], name: "index_votes_on_procedure_id"
  end

  add_foreign_key "accounts", "visitors"
  add_foreign_key "arguments", "procedures"
  add_foreign_key "arguments", "visitors", column: "author_id"
  add_foreign_key "attachments", "visitors", column: "author_id"
  add_foreign_key "bodies", "accounts", column: "owner_id"
  add_foreign_key "comments", "arguments"
  add_foreign_key "comments", "visitors", column: "author_id"
  add_foreign_key "deals", "procedures"
  add_foreign_key "exports", "accounts"
  add_foreign_key "exports", "procedures"
  add_foreign_key "favs", "visitors", column: "author_id"
  add_foreign_key "follows", "visitors", column: "author_id"
  add_foreign_key "moderatorships", "procedures"
  add_foreign_key "moderatorships", "visitors", column: "moderator_id"
  add_foreign_key "periods", "accounts", column: "owner_id"
  add_foreign_key "procedures", "accounts", column: "owner_id"
  add_foreign_key "procedures", "bodies"
  add_foreign_key "ratings", "visitors"
  add_foreign_key "receipts", "procedures"
  add_foreign_key "receipts", "visitors"
  add_foreign_key "subjectgroups", "accounts", column: "owner_id"
  add_foreign_key "tags", "accounts", column: "owner_id"
  add_foreign_key "votes", "procedures"
end
