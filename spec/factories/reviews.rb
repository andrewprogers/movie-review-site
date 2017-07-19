FactoryGirl.define do
  factory :review do
    rating 3
    body "this is a review text"
    user
    movie
  end
end
