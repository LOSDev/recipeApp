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
      templateUrl: "components/app.html"
    })
    .state('app.home', {
      url: "",
      template: "<h1>Home Page</h1>"
    })

});
