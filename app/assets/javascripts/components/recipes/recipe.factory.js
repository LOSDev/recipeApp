angular.module('recipes')
.factory('Recipe', ['$http', 'Upload', function ($http, Upload) {
  var o = {};
  var urlBase = "/api/recipes"
  o.create = function (recipe, image) {
    return Upload.upload({
            url: urlBase + '.json',
            data: {recipe: recipe}
        })
  },
  o.update = function (recipe) {
    return Upload.upload({
      method: 'PUT',
      url: urlBase + "/" + recipe.id + ".json",
      data: {recipe: recipe}
    })
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
