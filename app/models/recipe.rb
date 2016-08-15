class Recipe < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :ingredients, :inverse_of => :recipe
  has_many :directions

  validates :title, presence: true
  validates :description, presence: true

  accepts_nested_attributes_for :ingredients,
    :allow_destroy => true,
    :reject_if     => :all_blank

end
