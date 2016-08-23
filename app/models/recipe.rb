class Recipe < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user, inverse_of: :recipes
  has_many :ingredients, :inverse_of => :recipe, dependent: :destroy
  has_many :directions, inverse_of: :recipe, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :title, presence: true
  validates :user, presence: true

  validates :description, presence: true
  validates :ingredients, length: { minimum: 1, maximum: 20, :too_short => 'add at least 1 Ingredient',
            :too_long => 'not more than 20 Ingredients'}
  validates :directions, length: { minimum: 1, maximum: 20, :too_short => 'add at least 1 Direction',
            :too_long => 'not more than 20 Directions'}


  accepts_nested_attributes_for :ingredients,
    :allow_destroy => true,
    :reject_if     => :all_blank
  accepts_nested_attributes_for :directions,
    :allow_destroy => true,
    :reject_if     => :all_blank

end
