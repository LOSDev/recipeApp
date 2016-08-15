angular.module('recipes').config(function($stateProvider, $urlRouterProvider) {
  //
  // Now set up the states
  $stateProvider
    .state('app.newRecipe', {
      url: "recipes/new",
      template: "<new-recipe></new-recipe>",
      onEnter: ['$state', '$auth', function($state, $auth) {
        $auth.validateUser().catch(function (){
         $state.go('app.home');
        })
      }]
    })
    .state('app.recipeDetails', {
      url: "recipes/:id",
      template: "<recipe-details></recipe-details>"
    })
    .state('app.editRecipe', {
      url: "recipes/:id/edit",
      template: "<edit-recipe></edit-recipe>",
      onEnter: ['$state', '$auth', function($state, $auth) {
        $auth.validateUser().catch(function (){
         $state.go('app.home');
        })
      }]
    })

});
