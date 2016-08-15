angular.module('recipes').config(function($stateProvider, $urlRouterProvider) {
  //
  // Now set up the states
  $stateProvider
    .state('app.newRecipe', {
      url: "recipes/new",
      template: "<new-recipe></new-recipe>"
    })
    .state('app.recipeDetails', {
      url: "recipes/:id",
      template: "<recipe-details></recipe-details>"
    })

});
