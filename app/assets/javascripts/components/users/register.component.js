angular.module('users')
.component('register', {
  templateUrl: "components/users/register.html",
  controller: ['$auth','$state', 'toastr', function ($auth, $state, toastr) {
    vm = this;
    vm.register = function () {
      $auth.submitRegistration(vm.user)
        .then(function (user) {
          $state.go("app.home");
          toastr.success('Registration successful!', 'Congratulations');
        }, function (error) {
          vm.errors = error.data.errors
        })
    }
  }
  ]
})
