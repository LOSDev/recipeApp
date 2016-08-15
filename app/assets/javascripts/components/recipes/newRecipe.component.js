angular.module('recipes')
.component('newRecipe', {
  templateUrl: "components/recipes/newRecipe.html",
  controller: NewRecipeController
})

function NewRecipeController($state, Recipe) {
  var vm = this;
  vm.submit = function () {
    Recipe.create(vm.recipe)
    .then(function (resp) {
      $state.go("app.recipeDetails", {id: resp.data.id})
    })
  }
}
