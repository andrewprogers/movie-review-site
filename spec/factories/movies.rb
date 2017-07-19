FactoryGirl.define do
  factory :movie do
    sequence(:name) { |n| "movie#{n}" }
    description "foobar"
  end
end
