class RecipesController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
    @recipes = Recipe.all.order("created_at DESC")
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    puts params[:recipe][:ingredient_attributes]
    if @recipe.save
      render 'show'
    else
      render json: @recipe.errors
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
      render json: @recipe.errors
    end
  end

  def destroy
    @recipe = current_user.recipes.find(params[:id])
    @recipe.destroy
    head :no_content
  end


  private

  def recipe_params
    params.require(:recipe).permit(:title, :description, :image, :ingredients_attributes => [:id, :name])
  end
end
