angular.module('recipes')
.component('recipeList', {
  templateUrl: "components/recipes/recipeList.html",
  controller: RecipeListController
})

function RecipeListController(Recipe) {
  var vm = this;
  Recipe.all()
  .then(function (resp) {
    vm.recipes = resp.data;
  })
}
