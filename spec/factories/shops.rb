FactoryBot.define do
  factory :shop do
    association :owner
    sequence(:name)       { |n| "sample#{n}" }
    sequence(:email)      { |n| "TEST#{n}@example.com" }
    sequence(:line_id )   { |n| "n" }
    phone_number          { "08012345678" }
    display               { "" }
    note                  { "" }
    post_code             { "1234567" }
    address_prefecture    { "Tokyo" }
    address_city          { "tyuuou" }
    address_town          { "" }
    address_branch        { "nihonbashi" }
    address_building      { "building" }
    mon_start             { "" }
    mon_finish            { "" }
    mon_off               { "" }
    tue_start             { "" }
    tue_finish            { "" }
    tue_off               { "" }
    wed_start             { "" }
    wed_finish            { "" }
    wed_off               { "" }
    thu_start             { "" }
    thu_finish            { "" }
    thu_off               { "" }
    fri_start             { "" }
    fri_finish            { "" }
    fri_off               { "" }
    sat_start             { "" }
    sat_finish            { "" }
    sat_off               { "" }
    sun_start             { "" }
    sun_finish            { "" }
    sun_off               { "" }
    other_holiday         { "" }
    appeal                { "" }
    memo                  { "" }
    introduction          { "" }
    customer_sex          { "" }
    worker_sex            { "" }
    share                 { "" }
  end
end
