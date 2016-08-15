angular.module('users')
.component('login', {
  templateUrl: "components/users/login.html",
  controller: ['$auth','$state', 'toastr', function ($auth, $state, toastr) {
    vm = this;
    vm.login = function () {
      $auth.submitLogin(vm.user)
        .then(function (user) {
          $state.go("app.home");
          toastr.success('You are now logged in.');
        }, function (error) {
          toastr.error(error.errors[0]);
        })
    }
  }]
})
