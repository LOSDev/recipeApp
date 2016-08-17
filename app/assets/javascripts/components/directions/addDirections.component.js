angular.module('directions')
.component('addDirections', {
  templateUrl: "components/directions/addDirections.html",
  bindings: {
    directions: "="
  },
  controller: AddDirectionsController
})

function AddDirectionsController() {
  var vm = this;

  vm.direction = {
    step: ''
  };

  vm.addDirection = function (event) {
    if (event.which === 13 && vm.direction.step.length > 1) {
      vm.directions.push(vm.direction);
      vm.direction = {};
    }
  }

  vm.remove = function (ing) {
    ing._destroy = 1;
  }
}
