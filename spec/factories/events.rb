FactoryGirl.define do
  factory :event do
    name        { Faker::Lorem.sentence(1)}
    location    { Faker::Address.city }
    description { Faker::Lorem.sentence(40)}
    price       { Faker::Commerce.price}
    includes_food false
    includes_drinks false
    user        {build(:user)}

    trait :inactive do
      active true
    end

    trait :inactive do
      active false
    end

  end
end

=begin
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
=end
