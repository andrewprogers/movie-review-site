class UserReviewMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def review_email(review)
    @review = review
    mail(
    to: review.movie.user.email,
    subject: "New Review for #{review.movie.name}"
    )    
  end
end
