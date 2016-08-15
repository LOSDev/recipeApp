angular.module('recipes')
.factory('Recipe', ['$http', function ($http) {
  var o = {};
  var urlBase = "/api/recipes"
  o.create = function (recipe) {
    return $http.post(urlBase + ".json", {recipe: recipe})
  },
  o.update = function (recipe) {
    return $http.put(urlBase + "/" + recipe.id + ".json", {recipe: recipe})
  },
  o.get = function (id) {
    return $http.get(urlBase + "/" + id + ".json")
  }
  o.all = function (page, id) {
    if (id) {
      return $http.get(urlBase + ".json" + "?tag=" + id + "&page=" + page)
    }else {
      return $http.get(urlBase + ".json" + "?page=" + page)
    }
  }
  o.delete = function (recipe) {
    return $http.delete(urlBase + "/" + recipe.id + ".json")
  }
  return o;
}])
