FactoryGirl.define do
  factory :user do
    sequence(:username){ |n| "user#{n}"}
    password "foobar"
    email {"#{username}@example.com"}
  end
end
