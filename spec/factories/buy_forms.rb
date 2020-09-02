FactoryBot.define do
  factory :buy_form do
    portal        { '123-4567' }
    prefecture_id { 2 }
    city          { 'ああああ' }
    town          { 'ああああ' }
    building      { 'ああああ' }
    tel           { '09012341234' }
    buy_id        { 2 }
  end
end
