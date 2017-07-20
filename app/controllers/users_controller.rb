class UsersController < ApplicationController
  before_action :authorize_user, only: [:index]
  before_action :check_user, only: [:index]

  def check_user
    unless current_user.admin?
      redirect_to movies_path, alert: "Sorry, you are not allowed to do this"
    end
  end

  def authorize_user
    if !user_signed_in?
      raise ActionController::RoutingError.new("Not Found")
    end
  end

  def index
    @users = User.all
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_path, notice: "User Deleted"
  end
end
