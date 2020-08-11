FactoryBot.define do
  factory :user do
    nick_name             { Faker::Name.initials(number: 4) }
    first_name            { 'あア亜' }
    last_name             { 'いイ井' }
    first_name_kana       { 'アアア' }
    last_name_kana        { 'イイイ' }
    email                 { 'a@a' }
    password              { '123abc' }
    password_confirmation { password }
    birth_day             { Faker::Date.between(from: '1930-01-01', to: '2015-12-31') }
  end
end
