class VotesController < ApplicationController
  before_action :authorize_user, :set_params

  def create
    @vote = Vote.where(user: current_user, review: @review).first
    if @vote.nil?
      @vote = Vote.new(review: @review, value: @value)
      @vote.user = current_user
    elsif @vote.value == params[:value].to_i
      @vote.value = 0
    else
      @vote.value = params[:value].to_i
    end

    @movie = @vote.review.movie
    if @vote.save
      redirect_to @movie
    end
  end

  private

  def set_params
    @review = Review.find(params[:review_id])
    @value = params[:value]
  end

  def authorize_user
    if !user_signed_in?
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end
