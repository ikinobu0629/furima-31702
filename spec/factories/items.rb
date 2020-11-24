FactoryBot.define do
  factory :item do
    image          {Faker::Lorem.sentence}
    name           {"aaaaa"}
    detail         {"sssss"}
    price          {Faker::Number.between(from: 300, to: 9999999)}
    status_id      {"2"}
    cost_id        {"2"}
    area_id        {"2"}
    category_id    {"2"}
    day_id         {"2"}
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end



