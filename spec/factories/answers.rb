FactoryBot.define do
  factory :answer do
    text { Faker::Alphanumeric.alphanumeric(number: 10) }
    association :user
    association :question
  end
end
