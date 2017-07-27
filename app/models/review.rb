class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  has_many :votes, dependent: :destroy

  validates :rating, presence: true, numericality: { only_integer: true }
  validates_inclusion_of :rating, in: 1..7

  def votes_count(review_id)
    @review = Review.find(review_id)
    @votes = Vote.where(review_id: @review).sum(:value)
  end

  def upvotes_count(review_id)
    @review = Review.find(review_id)
    @votes = Vote.where(review_id: @review, value: 1).count
  end

  def downvotes_count(review_id)
    @review = Review.find(review_id)
    @votes = Vote.where(review_id: @review, value: -1).count
  end
end
