FactoryBot.define do
  factory :order_address do
    association :user
    association :item

    post_code              { Faker::Lorem.characters(number: 3, min_numeric: 3) + '-' + Faker::Lorem.characters(number: 4, min_numeric: 4)}
    delivery_area_id       { Faker::Number.between(from: 2, to: 10) }
    municipalities         { Faker::Lorem.characters(number: 10) }
    house_number           { Faker::Lorem.characters(number: 10) }
    building               { Faker::Lorem.characters(number: 10) }
    phone_number           { Faker::Number.number(digits: 10) }
    token                  {"tok_abcdefghijk00000000000000000"}
  end
end
