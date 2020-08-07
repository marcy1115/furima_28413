FactoryBot.define do
  factory :user do
    nick_name   { Faker::Name.initials( number: 4 ) }
    family_name { Faker::Name.last_name }
    first_name  { Faker::Name.first_name }
  end
end
