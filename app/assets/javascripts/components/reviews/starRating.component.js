angular.module('reviews')
.component('starRating', {
  templateUrl: "components/reviews/starRating.html",
  bindings: {
    rating: '<',
    setRating: '&'
  },
  controller: StarRatingController
})

function StarRatingController() {
  var vm = this;

   vm.$onInit = function () {
     vm.entries = new Array(5);
     for (var i = 0; i < vm.entries.length; i++) {
       if (vm.rating > i) {
         vm.entries[i] = true;
       }
     }
   }

   vm.$onChanges = function () {
     for (var i = 0; i < vm.entries.length; i++) {
       if (vm.rating > i) {
         vm.entries[i] = true;
       }else {
         vm.entries[i] = false;
       }
     }
   }
}
