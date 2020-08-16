FactoryBot.define do
  factory :item do
    name          { Faker::Name.initials(number: 40) }
    text          { Faker::Lorem.characters(number: 1000) }
    price         { 9_999_999 }
    category_id   { 2 }
    quality_id    { 2 }
    burden_id     { 2 }
    prefecture_id { 2 }
    delivery_id   { 2 }
  end
end
