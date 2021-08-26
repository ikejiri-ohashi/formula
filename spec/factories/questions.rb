FactoryBot.define do
  factory :question do
    url { Faker::Alphanumeric.alphanumeric(number: 10) }
    time { Faker::Number.decimal(l_digits: 2) }
    text { Faker::Alphanumeric.alphanumeric(number: 10) }
    category_id { Faker::Number.within(range: 2..24) }
    association :user
  end
end
