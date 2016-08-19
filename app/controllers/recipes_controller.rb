class RecipesController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show, :search]

  def index
    @recipes = Recipe.all.order("created_at DESC").limit(20)
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      render 'show', status: :created
    else
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = current_user.recipes.find(params[:id])
    if @recipe.update(recipe_params)
      render 'show'
    else
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @recipe = current_user.recipes.find(params[:id])
    @recipe.destroy
    head :no_content
  end

  def search
    @recipes = Recipe.where("title LIKE :term OR description LIKE :term", term: "%#{params[:q]}%").limit(20) if params[:q]
    render 'index'
  end


  private

  def recipe_params
    params.require(:recipe).permit(:title, :description, :image, :ingredients_attributes => [:id, :name, :_destroy], :directions_attributes => [:id, :step, :_destroy])
  end
end
