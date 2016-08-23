class ReviewsController < ApplicationController

  def index
    @reviews = Recipe.find(params[:recipe_id]).reviews.order("created_at DESC")
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @review = @recipe.reviews.build(review_params)
    if @review.save
      render 'show', status: :created
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  
  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
