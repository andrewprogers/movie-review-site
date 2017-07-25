class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :review

  validates :value, presence: true, numericality: { only_integer: true }
  validates_inclusion_of :value, in: -1..1
end
