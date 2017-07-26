class UserReviewMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def review_email(review)
    @review = review
    @username = review.movie.user.username
    @movie_name = review.movie.name
    mail(
    to: review.movie.user.email,
    subject: "New Review for #{review.movie.name}"
    )
  end
end
