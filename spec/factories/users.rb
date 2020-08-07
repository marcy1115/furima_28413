FactoryBot.define do
  factory :user do
    nick_name   { Faker::Name.initials( number: 4 ) }
    family_name { Faker::Name.last_name }
    first_name  { Faker::Name.first_name }
    family_kana { Faker::Japanese::Name.last_name }
    first_kana  { Faker::Japanese::Name.first_name }
    email       { Faker::Internet.free_email }
    password    { Faker::Internet.password( min_length: 6 ) }
    birth_day   { Faker::Date.between( from: "1930-01-01", to: "2015-12-31" ) }
  end
end
