angular.module('users')
.component('settings', {
  templateUrl: "components/users/settings.html",
  controller: ['$auth','$state', 'toastr', '$http', function ($auth, $state, toastr, $http) {
    vm = this;
    $auth.validateUser()
    .then(function (resp) {
      vm.user = resp
    }, function () {
      $state.go('app.home')
    })
    vm.update = function () {
      $auth.updateAccount(vm.user)
        .then(function (user) {
          vm.user = user;
          $state.go("app.home");
          toastr.success('Profile updated!');
        }, function (error) {
          vm.errors = error.data.errors
        })
    }
  }
  ]
})
