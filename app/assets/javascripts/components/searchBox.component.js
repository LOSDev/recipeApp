angular.module('app')
.component('searchBox', {
  templateUrl: "components/searchBox.html",
  controller: ['$state', SearchBoxController]
})

function SearchBoxController($state) {
  var vm = this;
  vm.search = function () {
    if (vm.term && vm.term.length > 1) {
      $state.go('app.search', {term: vm.term})
    }
  }
}
