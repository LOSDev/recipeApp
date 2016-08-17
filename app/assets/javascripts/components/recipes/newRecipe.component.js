angular.module('recipes')
.component('newRecipe', {
  templateUrl: "components/recipes/newRecipe.html",
  controller: NewRecipeController
})

function NewRecipeController($state, Recipe) {
  var vm = this;
  vm.recipe = {
    ingredients_attributes: [],
    directions_attributes: []
  };

  vm.submit = function () {
    Recipe.create(vm.recipe)
    .then(function (resp) {
        $state.go("app.recipeDetails", {id: resp.data.id})
    }, function (resp) {
        console.log('Error status: ' + resp.status);
    }, function (evt) {
        var progressPercentage = parseInt(100.0 * evt.loaded / evt.total);
        console.log('progress: ' + progressPercentage + '% ' + evt);
    });
  }


}
