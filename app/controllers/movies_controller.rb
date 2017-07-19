class MoviesController < ApplicationController
  before_action :authorize_user, except: [:index, :show]
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
    @reviews = @movie.reviews
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.create(movie_params)
    if @movie.save
      redirect_to @movie, notice: "Movie successfully added."
    else
      render action: 'new'
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :description)
  end

  def authorize_user
    if !user_signed_in?
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end
