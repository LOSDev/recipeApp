class Direction < ApplicationRecord
  belongs_to :recipe, :inverse_of => :directions
  validates :step, presence: true
  validates :recipe, presence: true


end
