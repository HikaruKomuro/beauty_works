FactoryBot.define do
  factory :owner do
    sequence(:name) { |n| "sample#{n}" }
    sequence(:email) { |n| "TEST#{n}@example.com" }
    phone_number        { "08012345678" }
    password            { "password" }
    post_code           { "1234567" }
    address_prefecture  { "Tokyo" }
    address_city        { "tyuuou" }
    address_branch      { "nihonbashi" }
  end
end
