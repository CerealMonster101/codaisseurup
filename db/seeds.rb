User.destroy_all

vanessa = User.create(email: "vanessa@codaisseurbnb.com", password: "abcd1234")

event = Event.create(name: "Awesome Event", description: "The best awesome rooftop party offering free stroopwafels on the TQ rooftop", location: "Amsterdam", price: 20, capacity: 200,  includes_food: true, includes_drinks: true, starts_at: DateTime.new(2017,3,19,18,0,0), ends_at: DateTime.new(2017,3,19,23,0,0), active: true,  user: vanessa)

=begin
create_table "events", force: :cascade do |t|
  t.string   "name"
  t.text     "description"
  t.string   "location"
  t.decimal  "price"
  t.integer  "capacity"
  t.boolean  "includes_food"
  t.boolean  "includes_drinks"
  t.datetime "starts_at"
  t.datetime "ends_at"
  t.boolean  "active"
  t.integer  "user_id"
  t.datetime "created_at",      null: false
  t.datetime "updated_at",      null: false
  t.index ["user_id"], name: "index_events_on_user_id", using: :btree
end
=end
