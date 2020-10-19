FactoryBot.define do
  factory :occupation do
    sequence(:name) { |n| "service#{n}" }
    sequence(:ja) { |n| "TEST#{n}" }
  end
end
