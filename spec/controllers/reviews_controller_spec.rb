require 'rails_helper'

RSpec.describe Api::V1::ReviewsController, type: :controller do
  before(:each) do
    fake_reviews = []
    11.times do
      fake_reviews.push(FactoryGirl.create(:review))
    end
  end

  describe "GET#index" do
    it "should return a list of the 10 latest reviews (most recent first)" do
      get :index
      returned_json = JSON.parse(response.body)
      reviews = returned_json["reviews"]

      expect(reviews.length).to eq(10)
      9.times do |idx|
        expect(reviews[idx]["updated_at"] > reviews[idx + 1]["updated_at"])
      end
    end
  end
end
