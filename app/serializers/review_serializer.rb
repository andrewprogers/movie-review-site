class ReviewSerializer < ActiveModel::Serializer
  attributes :body, :rating, :user, :movie, :id, :updated_at
end
