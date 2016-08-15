angular.module('ingredients')
.component('addIngredients', {
  templateUrl: "components/ingredients/addIngredients.html",
  bindings: {
    ingredients: "="
  },
  controller: AddIngredientsController
})

function AddIngredientsController() {
  var vm = this;
  
  vm.addIngredient = function (event) {
    if (event.which === 13 && vm.ingredient.name.length > 1) {
      vm.ingredients.push(vm.ingredient);
      vm.ingredient = {};
    }
  }

  vm.remove = function (ing) {
    var index = vm.ingredients.indexOf(ing);
    if (index > -1) {
      vm.ingredients.splice(index, 1)
    }
  }
}
