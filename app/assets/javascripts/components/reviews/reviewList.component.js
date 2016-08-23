angular.module('reviews')
.component('reviewList', {
  templateUrl: "components/reviews/reviewList.html",
  bindings: {
    reviews: '='
  },
  controller: ['Review', '$stateParams', ReviewListController]
})

function ReviewListController(Review, $stateParams) {
  var vm = this;

  Review.all($stateParams.id)
  .then(function (resp) {
    vm.reviews = resp.data;
  })
}
