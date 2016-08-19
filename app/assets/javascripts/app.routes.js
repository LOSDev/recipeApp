angular.module('app').config(function($stateProvider, $urlRouterProvider) {
  //
  // For any unmatched url, redirect to /state1
  $urlRouterProvider.otherwise("/");
  //
  // Now set up the states
  $stateProvider
    .state('app', {
      url: "/",
      abstract: true,
      template: "<my-app></my-app>"
    })
    .state('app.home', {
      url: "",
      template: "<recipe-list></recipe-list>"
    })
    .state('app.about', {
      url: "about",
      template: "<about-us></about-us>"
    })
    .state('app.search', {
      url: "search/:term",
      template: "<recipe-results></recipe-results>"
    })

});
