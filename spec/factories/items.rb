FactoryBot.define do
  factory :item do
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    product_name         { Faker::Internet.password(max_length: 40) }
    explanation          { Faker::Internet.password(max_length: 1000) }
    detail_category_id   { Faker::Number.between(from: 2, to: 11) }
    detail_situation_id  { Faker::Number.between(from: 2, to: 7) }
    delivery_charge_id   { Faker::Number.between(from: 2, to: 3) }
    delivery_area_id     { Faker::Number.between(from: 2, to: 10) }
    delivery_day_id      { Faker::Number.between(from: 2, to: 48) }
    price                { Faker::Number.between(from: 300, to: 9_999_999) }
  end
end
