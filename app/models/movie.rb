class Movie < ApplicationRecord
  validates :name, presence: true
end
