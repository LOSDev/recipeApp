require "rails_helper"
RSpec.describe Recipe, type: :model do

  let(:recipe) { FactoryGirl.build(:recipe) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:user) }
  it { should have_many(:ingredients).dependent(:destroy) }
  it { should have_many(:directions).dependent(:destroy) }
  it { should belong_to(:user) }


  describe 'ingredients' do
    describe 'at least 1' do
      it "should be invalid without ingredients" do
        recipe.ingredients.delete_all
        expect(recipe).to be_invalid
      end
      it "should be valid with 1 ingredient" do
        expect(recipe).to be_valid
      end
    end
  end

  describe 'directions' do
    describe 'at least 1' do
      it "should be invalid without directions" do
        recipe.directions.delete_all
        expect(recipe).to be_invalid
      end
      it "should be valid with 1 direction" do
        expect(recipe).to be_valid
      end
    end
  end

end
