class Api::V1::VotesController < ApplicationController
  before_action :authorize_user
  skip_before_action :verify_authenticity_token

  def create
    binding.pry
    @vote = Vote.where(user: current_user, review_id: params[:review_id]).first
    if @vote.nil?
      @vote = Vote.new(review_id: params[:review_id], value: params[:value])
      @vote.user = current_user
    elsif @vote.value == params[:value].to_i
      @vote.value = 0
    else
      @vote.value = params[:value].to_i
    end

    @movie = @vote.review.movie
    if @vote.save
      render json: @review.votes
    end
  end

  private

  def authorize_user
    binding.pry
    if !user_signed_in?
      raise ActionController::RoutingError.new("Not Found")
    end
  end

end
