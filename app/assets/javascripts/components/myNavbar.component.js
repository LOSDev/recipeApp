angular.module('app')
.component('myNavbar', {
  templateUrl: "components/myNavbar.html",
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
