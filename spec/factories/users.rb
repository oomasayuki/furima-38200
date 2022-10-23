FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end

    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    surname               { person.last.kanji }
    first_name            { person.first.kanji }
    surname_kana          { person.last.katakana }
    first_name_kana       { person.first.katakana }
    date_of_bith          { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end