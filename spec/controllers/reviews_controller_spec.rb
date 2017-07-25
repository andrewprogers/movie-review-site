require 'rails_helper'

RSpec.describe Api::V1::ReviewsController, type: :controller do
  before(:each) {
    fake_reviews = []
    11.times do
      fake_reviews.push(FactoryGirl.create(:review))
    end
  }

  describe "GET#index" do
    it "should return a list of the 10 latest reviews (most recent first)" do
      get :index
      returned_json = JSON.parse(response.body)
      reviews = returned_json["reviews"]
      first_time = DateTime.parse(reviews[0]["updated_at"])
      last_time = DateTime.parse(reviews[9]["updated_at"])

      expect(reviews.length).to eq(10)
      9.times do |idx|
      expect(reviews[idx + 1]["updated_at"] > reviews[idx + 1]["updated_at"])
      end
    end
  end
end
