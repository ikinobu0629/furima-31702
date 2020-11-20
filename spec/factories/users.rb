FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { person.first.katakana }
    family_name           { person.last.katakana }
    first_name_kana       { person.first.katakana }
    family_name_kana      { person.last.katakana }
    birth_date            { Faker::Date.birthday }
  end
end
