class ReviewsController < ApplicationController
  before_action :check_user, only: [:edit, :update, :destroy]

  def create
    @review = Review.new(review_params)
    @movie = Movie.find(params[:movie_id])
    @review.movie = @movie
    @review.user = current_user

    if @review.save
      redirect_to movie_path(@movie)
    else
      flash[:error] = @review.errors.full_messages.to_sentence
      @reviews = @movie.reviews
      render 'movies/show', id: @movie.id
    end
  end

  def edit
    @review = Review.find(params[:id])
    @movie = @review.movie
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = "Review successfully updated"
      redirect_to movie_path(@review.movie)
    else
      flash[:error] = @review.errors.full_messages.to_sentence
      @movie = @review.movie
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    flash[:notice] = "Review successfully deleted"
    redirect_to movie_path(@review.movie)
  end


  private

  def review_params
    params.require(:review).permit(:rating, :body)
  end

  def check_user
    @review = Review.find(params[:id])
    if current_user.nil? || (@review.user != current_user && !current_user.admin?)
      render file: "#{Rails.root}/public/404.html", status: 404
    end
  end
end
