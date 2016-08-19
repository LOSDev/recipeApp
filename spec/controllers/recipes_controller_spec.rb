require "rails_helper"
RSpec.describe RecipesController do

  let(:user) { FactoryGirl.create(:user) }
  let(:recipe) { FactoryGirl.create(:recipe, user: user) }

  let(:valid_recipe) { {title: "Hello", description: "World",
     ingredients_attributes: [{name: "Salt"}, {name: "Sugar"}],
      directions_attributes: [{step: "One"}, {step: "Two"}]
  } }
  let(:invalid_recipe) { {title: "", description: "World",
     ingredients_attributes: [{name: "Salt"}, {name: "Sugar"}],
     directions_attributes: [{step: "One"}, {step: "Two"}]
  } }

  describe "GET index" do
    it "assigns @recipes" do
      get :index, xhr: true
      expect(assigns(:recipes)).to eq([recipe])
    end

    it "renders the index template" do
      get :index, xhr: true
      expect(response).to render_template("index")
    end

    it "has http status 200" do
      get :index, xhr: true
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET show" do
    it "assigns @recipe" do
      get :show, params: { id: recipe.id }, xhr:true
      expect(assigns(:recipe)).to eq(recipe)
    end

    it "renders the index template" do
      get :show, params: { id: recipe.id }, xhr:true
      expect(response).to render_template("show")
    end

    it "has http status 200" do
      get :show, params: { id: recipe.id }, xhr:true
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST create" do
    describe 'unauthorized' do
      it "returns error message" do
        post :create, xhr: true, params: { recipe: recipe }

        body = JSON.parse(response.body)
        expect(body['errors'][0]).to eq "Authorized users only."
      end

      it "has http status 401" do
        post :create, xhr: true, params: { recipe: recipe }

        expect(response).to have_http_status(:unauthorized)
      end
    end

    describe 'authorized' do
      before(:each) do
        auth_headers = user.create_new_auth_token
        request.headers.merge!(auth_headers)
      end
      describe 'valid recipe' do
        it "renders the show template" do
          post :create, xhr: true, params: { recipe: valid_recipe }
          expect(response).to render_template("show")
        end

        it "has http status 201" do
          post :create, xhr: true, params: { recipe: valid_recipe }
          expect(response).to have_http_status(:created)
        end
      end

      describe 'invalid recipe' do
        it "returns error message" do
          post :create, xhr: true, params: { recipe: invalid_recipe }
          expect(response.body).to include("can't be blank")
        end

        it "has http status 422" do
          post :create, xhr: true, params: { recipe: invalid_recipe }
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end
  describe "PUT update" do
    describe 'valid recipe' do
      before(:each) do
        auth_headers = user.create_new_auth_token
        request.headers.merge!(auth_headers)
        put :update, xhr: true, params: { id: recipe.id, recipe: valid_recipe}
      end
      it "renders the show template" do
        expect(response).to render_template("show")
      end
      it "has http status 200" do
        expect(response).to have_http_status(:success)
      end
      it "updates title" do
        expect(assigns(:recipe).title).to eq("Hello")
      end
    end

    describe 'invalid recipe' do
      before(:each) do
        auth_headers = user.create_new_auth_token
        request.headers.merge!(auth_headers)
        put :update, xhr: true, params: { id: recipe.id, recipe: invalid_recipe}
      end
      it "returns error message" do
        expect(response.body).to include("can't be blank")
      end
      it "has http status 200" do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE destroy' do
    describe 'logged in' do
      before(:each) do
        @recipe = FactoryGirl.create(:recipe, user: user)
        auth_headers = user.create_new_auth_token
        request.headers.merge!(auth_headers)
      end
      it "deletes recipe" do
        expect{
          delete :destroy, xhr: true, params: { id: @recipe.id}
        }.to change {Recipe.count}.by(-1)
      end
      it "deletes recipe" do
        delete :destroy, xhr: true, params: { id: recipe.id}
        expect(response.body).to eq ""
      end
    end

    describe 'not logged in' do
      it "returns 401" do
        delete :destroy, xhr: true, params: { id: recipe.id}
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe "GET search" do
    before do
      get :search, xhr: true, params: {q: recipe.title}
    end

    it "assigns @recipes" do
      expect(assigns(:recipes).length).to eq(1)
    end

    it "renders the index template" do
      expect(response).to render_template("index")
    end

    it "has http status 200" do
      expect(response).to have_http_status(:success)
    end
  end
end
