FactoryBot.define do
  factory :freelance do
    sequence(:name) { |n| "sample#{n}" }
    sequence(:email) { |n| "TEST#{n}@example.com" }
    password            { "password" }
    post_code           { "1234567" }
    address_prefecture  { "Tokyo" }
    address_city        { "tyuuou" }
    address_branch      { "nihonbashi" }
  end
end
