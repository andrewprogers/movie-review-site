class Movie < ApplicationRecord
  has_many :reviews
  validates :name, presence: true
  belongs_to :user
end
