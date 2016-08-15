angular.module('users')
.config(function ($stateProvider) {
  $stateProvider
    .state('app.register', {
      url: "register",
      template: "<register></register>",
      onEnter: ['$state', '$auth', function($state, $auth) {
        $auth.validateUser().then(function (){
         $state.go('app.home');
        })
      }]
    })
    .state('app.login', {
      url: "login",
      template: "<login></login>",
      onEnter: ['$state', '$auth', function($state, $auth) {
        $auth.validateUser().then(function (){
         $state.go('app.home');
        })
      }]
    })
    .state('app.settings', {
      url: "settings",
      template: "<settings user='$resolve.user'></settings>",
      onEnter: ['$state', '$auth', function($state, $auth) {
        $auth.validateUser().catch(function (){
         $state.go('app.home');
        })
      }]
    })
})
