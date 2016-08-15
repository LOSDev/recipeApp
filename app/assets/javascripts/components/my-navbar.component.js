angular.module('app')
.component('myNavbar', {
  templateUrl: "components/my-navbar.html",
  controller: ['$state', '$auth', '$scope', '$rootScope', function ($state, $auth, $scope, $rootScope) {
    vm = this;

    $auth.validateUser()

    vm.logout = function () {
      $auth.signOut().then(function (resp) {
        $rootScope.user = {};
        $state.go('app.home')
      })
    }


  }]
})
