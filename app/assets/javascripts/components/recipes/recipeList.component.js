angular.module('recipes')
.component('recipeList', {
  templateUrl: "components/recipes/recipeList.html",
  controller: RecipeListController
})

function RecipeListController(Recipe) {
  var vm = this;
  vm.headline = "Latest Recipes";

  Recipe.all()
  .then(function (resp) {
    vm.recipes = resp.data;
  })
}
