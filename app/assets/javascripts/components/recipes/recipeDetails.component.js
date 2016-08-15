angular.module('recipes')
.component('recipeDetails', {
  templateUrl: "components/recipes/recipeDetails.html",
  controller: RecipeDetailsController
})

function RecipeDetailsController(Recipe, $stateParams) {
  var vm = this;
  
  Recipe.get($stateParams.id)
  .then(function (resp) {
    vm.recipe = resp.data
  })
}
