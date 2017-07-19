class ReviewsController < ApplicationController
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

  private
    def review_params
      params.require(:review).permit(:rating, :body)
    end
end
