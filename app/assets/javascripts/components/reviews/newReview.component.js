angular.module('reviews')
.component('newReview', {
  templateUrl: "components/reviews/newReview.html",
  bindings: {
    onSubmit: '&'
  },
  controller: ['Review', '$stateParams', 'toastr', NewReviewController]
})

function NewReviewController(Review, $stateParams, toastr) {
  var vm = this;
  vm.review = {
    rating: 0,
    comment: ""
  }

  vm.submit = function () {
    Review.create($stateParams.id, vm.review)
    .then(function (resp) {
      toastr.success('Review successfully created!');
      vm.onSubmit({review: resp.data});
    }, function (resp) {
      vm.errors = resp.data;
    })
  }

  vm.setRating = function (value) {
    vm.review.rating = value;
  }
}
