require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  let(:recipe) { FactoryGirl.create(:recipe, user: user) }
  let(:review) { FactoryGirl.create(:review, recipe: recipe) }


  let(:valid_review) { {rating: 5, comment: "World"
  } }
  let(:invalid_review) { {rating: 1, comment: ""
  } }

  describe "GET index" do
    it "assigns @reviews" do
      get :index, xhr: true, params: { recipe_id: recipe.id}
      expect(assigns(:reviews)).to eq([review])
    end

    it "renders the index template" do
      get :index, xhr: true, params: { recipe_id: recipe.id}
      expect(response).to render_template("index")
    end

    it "has http status 200" do
      get :index, xhr: true, params: { recipe_id: recipe.id}
      expect(response).to have_http_status(:success)
    end
  end


  describe "POST create" do

    describe 'valid review' do
      it "renders the show template" do
        post :create, xhr: true, params: { review: valid_review, recipe_id: recipe.id}
        expect(response).to render_template("show")
      end

      it "has http status 201" do
        post :create, xhr: true, params: { review: valid_review, recipe_id: recipe.id}
        expect(response).to have_http_status(:created)
      end
    end

    describe 'invalid review' do
      it "returns error message" do
        post :create, xhr: true, params: { review: invalid_review, recipe_id: recipe.id}
        expect(response.body).to include("can't be blank")
      end

      it "has http status 422" do
        post :create, xhr: true, params: { review: invalid_review, recipe_id: recipe.id}
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end


end
