angular.module('ingredients')
.component('addIngredients', {
  templateUrl: "components/ingredients/addIngredients.html",
  bindings: {
    ingredients: "=",
    errors: '='
  },
  controller: AddIngredientsController
})

function AddIngredientsController() {
  var vm = this;

  vm.ingredient = {
    name: ''
  };

  vm.addIngredient = function (event) {
    if (event.which === 13 && vm.ingredient.name.length > 1) {
      vm.ingredients.push(vm.ingredient);
      vm.ingredient = {};
    }
  }

  vm.remove = function (ing) {
    ing._destroy = 1;
  }
}
