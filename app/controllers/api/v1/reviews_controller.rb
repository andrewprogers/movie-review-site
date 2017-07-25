class Api::V1::ReviewsController < ApplicationController
  def index
    render json: Review.order(updated_at: :desc).limit(10)
  end
end
