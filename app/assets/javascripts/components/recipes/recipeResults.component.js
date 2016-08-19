angular.module('recipes')
.component('recipeResults', {
  templateUrl: "components/recipes/recipeList.html",
  controller: RecipeResultsController
})

function RecipeResultsController($stateParams, Recipe) {
  var vm = this;

  vm.headline = "Recipe's including: " + $stateParams.term
  if ($stateParams.term && $stateParams.term.length > 1) {
    Recipe.search($stateParams.term)
    .then(function (resp) {
      vm.recipes = resp.data;
    })
  }

}
