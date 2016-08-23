class Review < ApplicationRecord
  belongs_to :recipe

  validates :recipe, presence: true
  validates :comment, presence: true
  validates :rating, inclusion: { in: 1..5, message: "The rating must be between 1 and 5" }
end
