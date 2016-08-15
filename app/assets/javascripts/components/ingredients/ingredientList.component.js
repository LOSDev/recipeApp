angular.module('ingredients')
.component('ingredientList', {
  templateUrl: "components/ingredients/ingredientList.html",
  bindings: {
    ingredients: "<"
  }
})
