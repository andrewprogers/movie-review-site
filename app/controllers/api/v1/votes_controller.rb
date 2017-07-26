class Api::V1::VotesController < ApplicationController
  before_action :authorize_user
  skip_before_action :verify_authenticity_token

  def create
    @vote = Vote.where(user: current_user, review_id: params[:review_id]).first
    if @vote.nil?
      @vote = Vote.new(review_id: params[:review_id], value: params[:value])
      @vote.user = current_user
    elsif @vote.value == params[:value].to_i
      @vote.value = 0
    else
      @vote.value = params[:value].to_i
    end

    if @vote.save
      render json: Vote.where(review_id: params[:review_id])
    end
  end

  private

  def authorize_user
    if !user_signed_in?
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end
