class Movie < ApplicationRecord
  mount_uploader :poster, MoviePosterUploader

  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  belongs_to :user

  def self.search(query)
    where("name like ?", "%#{query}%")
  end
end
