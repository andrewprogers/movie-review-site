require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
  let!(:user1) { FactoryGirl.create(:user) }
  let!(:movie1) { FactoryGirl.create(:movie) }
  let!(:review1) { FactoryGirl.create(:review, movie: movie1, user: user1) }
  let!(:user2) { FactoryGirl.create(:user) }

  describe "GET#edit" do
    it "should return a 404 for unauthenticated users" do
      get :edit, params: {movie_id: movie1.id, id: review1.id}
      expect(response.status).to eq(404)
    end

    it "should return a 404 for other users besides the review creator" do
      login_as(user2)
      get :edit, params: {movie_id: movie1.id, id: review1.id}
      expect(response.status).to eq(404)
    end
  end

  describe 'PUT#update' do
    it "should return a 404 for unauthenticated users" do
      put :update, params: { id: review1.id, movie_id: movie1.id, review:{ body: "malicious edit" } }
      expect(response.status).to eq(404)
    end

    it "should return a 404 for other users besides the review creator" do
      login_as(user2)
      put :update, params: { id: review1.id, movie_id: movie1.id, review:{ body: "malicious edit" } }
      expect(response.status).to eq(404)
    end
  end

  describe "DELETE#destroy" do
    it "should return a 404 for unauthenticated users" do
      delete :destroy, params: { id: review1.id, movie_id: movie1.id }
      expect(Review.all.length).to eq(1)
      expect(response.status).to eq(404)
    end

    it "should return a 404 for unauthenticated users" do
      login_as(user2)
      delete :destroy, params: { id: review1.id, movie_id: movie1.id }
      expect(Review.all.length).to eq(1)
      expect(response.status).to eq(404)
    end
  end
end
