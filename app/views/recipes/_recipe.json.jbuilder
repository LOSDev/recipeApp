json.extract! recipe, :id, :title, :description, :created_at
json.user recipe.user
json.image recipe.image
json.ingredients recipe.ingredients
json.directions recipe.directions
