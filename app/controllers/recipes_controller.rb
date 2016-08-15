class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all.order("created_at DESC")
  end

  def create
    @recipe = User.first.recipes.build(recipe_params)
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
    @recipe = User.first.recipes.find(params[:id])
    if @recipe.update(recipe_params)
      render 'show'
    else
      render json: @recipe.errors
    end
  end

  def destroy
    @recipe = User.first.recipes.find(params[:id])
    @recipe.destroy
    head :no_content
  end


  private

  def recipe_params
    params.require(:recipe).permit(:title, :description)
  end
end
