class MoviesController < ApplicationController
  before_action :authorize_user, except: [:index, :show]
  before_action :check_user, only: [:edit, :update, :destroy]

  def check_user
    @movie = Movie.find(params[:id])
    unless @movie.user == current_user || current_user.admin?
      redirect_to movies_path, alert: "Sorry, you are not allowed to do this"
    end
  end

  def index
    @movies =
    if params[:search]
      Movie.search(params[:search])
    else
      Movie.all
    end
  end

  def show
    @movie = Movie.find(params[:id])
    @reviews = @movie.reviews
    @review = Review.new
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.create(movie_params)
    @movie.user_id = current_user.id

    unless ENV['RAILS_ENV'] == 'test'
      externalMovie = search_for_movie(params[:movie][:name])
      if externalMovie
        @movie.imdbID = externalMovie["imdbID"]
        @movie.remote_poster_url = poster_url(@movie.imdbID)
      end
    end

    if @movie.save
      redirect_to @movie, notice: "Movie successfully added."
    else
      render action: 'new'
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update_attributes(movie_params)
    if @movie.save
      redirect_to movie_path(@movie), notice: "Movie has been updated successfully."
    else
      render action: 'edit'
    end
  end

  def destroy
    Movie.find(params[:id]).destroy
    redirect_to movies_path, notice: "Movie Deleted"
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

  def search_for_movie(title)
    uri = URI("http://www.omdbapi.com/?t=#{title}&apikey=#{ENV['OMDB_API_KEY']}")
    response = JSON.parse(Net::HTTP.get(uri))
    if response["Response"] == "False"
      return false
    else
      return response
    end
  end

  def poster_url(imdbId)
    height = 400
    "http://img.omdbapi.com/?i=#{imdbId}&h=#{height}&apikey=#{ENV['OMDB_API_KEY']}"
  end
end
