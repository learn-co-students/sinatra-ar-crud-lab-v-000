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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20171130225454) do
=======
ActiveRecord::Schema.define(version: 20171125162207) do
>>>>>>> 8a45b38c12ab3caa52928c2d185035368e5474b3

  create_table "posts", force: :cascade do |t|
    t.string "name"
    t.text "content"
  end

end
