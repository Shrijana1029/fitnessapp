import 'package:get/get.dart';
import 'food_list.dart'; // Import your Food class and foodList

class FavoritesController extends GetxController {
  var favoriteFoods = <Food>[].obs;
// Observable list of favorite items

  void addToFavorites(Food food) {
    if (!favoriteFoods.contains(food)) {
      favoriteFoods.add(food);
    }
  }

  void removeFromFavorites(Food food) {
    favoriteFoods.remove(food);
  }
}
