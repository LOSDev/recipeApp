angular.module('reviews')
.factory('Review', ['$http', function ($http) {
  var o = {};
  var urlBase = "/api/recipes"
  o.create = function (id, review) {
    return $http.post(urlBase + '/' + id + '/reviews.json', {review: review})
  },
  o.update = function (recipe) {

  },
  o.all = function (id) {
    return $http.get(urlBase + "/" + id + "/reviews.json")
  }
  o.delete = function (recipe) {
    return $http.delete(urlBase + "/" + recipe.id + ".json")
  }
  return o;
}])
