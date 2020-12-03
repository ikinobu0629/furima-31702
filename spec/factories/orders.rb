FactoryBot.define do
  factory :order do
    token              { 'uuuuuuuuuu' }
    postal_code        { '123-4567' }
    area_id            { 2 }
    city               { '大阪市' }
    address            { '大阪1-1-1' }
    phone_number       { '00000000000' }
    building_name      {'ビル'}
  end
end