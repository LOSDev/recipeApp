class Recipe < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user, inverse_of: :recipes
  has_many :ingredients, :inverse_of => :recipe, dependent: :destroy
  has_many :directions, inverse_of: :recipe, dependent: :destroy

  validates :title, presence: true
  validates :user, presence: true

  validates :description, presence: true
  validates :ingredients, length: { minimum: 1, maximum: 20}
  validates :directions, length: { minimum: 1, maximum: 20}


  accepts_nested_attributes_for :ingredients,
    :allow_destroy => true,
    :reject_if     => :all_blank
  accepts_nested_attributes_for :directions,
    :allow_destroy => true,
    :reject_if     => :all_blank

end
