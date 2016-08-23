require 'rails_helper'

RSpec.describe Review, type: :model do
  it { should validate_presence_of(:recipe) }
  it { should validate_presence_of(:comment) }
  it { should validate_inclusion_of(:rating).in_range(1..5).with_message('The rating must be between 1 and 5') }

end
