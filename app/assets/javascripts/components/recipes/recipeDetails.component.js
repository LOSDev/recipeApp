angular.module('recipes')
.component('recipeDetails', {
  templateUrl: "components/recipes/recipeDetails.html",
  controller: RecipeDetailsController
})

function RecipeDetailsController(Recipe, $stateParams, $state, $window) {
  var vm = this;

  Recipe.get($stateParams.id)
  .then(function (resp) {
    vm.recipe = resp.data
  })

  vm.delete = function () {
    if ($window.confirm("Do you want to delete this Recipe?")) {
      Recipe.delete(vm.recipe)
      .then(function (resp) {
        $state.go('app.home');
      })
    }
  }
}
