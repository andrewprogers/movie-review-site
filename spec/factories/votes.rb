FactoryGirl.define do
  factory :vote do
    user
    review
    value 1
  end
end
