angular.module('recipes')
.component('editRecipe', {
  templateUrl: "components/recipes/editRecipe.html",
  controller: EditRecipeController
})

function EditRecipeController(Recipe, $stateParams, $state) {
  var vm = this;
  Recipe.get($stateParams.id)
  .then(function (resp) {
    vm.recipe = resp.data;
    vm.recipe.ingredients_attributes = resp.data.ingredients;
    vm.recipe.directions_attributes = resp.data.directions;

  })
  vm.update = function () {
    Recipe.update(vm.recipe)
    .then(function (resp) {
      $state.go('app.recipeDetails', {id: resp.data.id});
    })
  }
}
