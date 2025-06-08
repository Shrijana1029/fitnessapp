import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'food_list.dart'; // Import your Food class and foodList

class FavoritesController extends GetxController {
  // Observable list of favorite items
  var favoriteFoods = <Food>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadFavorites(); // Load favorites when the app starts
  }

  void addToFavorites(Food food) async {
    if (!favoriteFoods.contains(food)) {
      favoriteFoods.add(food);
      await saveFavorites();
    }
  }

  void removeFromFavorites(Food food) async {
    favoriteFoods.remove(food);
    await saveFavorites();
  }

  // Save favorites to SharedPreferences
  Future<void> saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    // Save the names of favorite foods
    final favoriteNames = favoriteFoods.map((food) => food.name).toList();
    prefs.setStringList('favoriteFoods', favoriteNames);
  }

  // Load favorites from SharedPreferences
  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    // Get saved food names
    final favoriteNames = prefs.getStringList('favoriteFoods') ?? [];
    // Match saved names with the `foodList`
    favoriteFoods.value =
        foodList.where((food) => favoriteNames.contains(food.name)).toList();
  }
}

class SetgoalsController extends GetxController {
  var selectedWaterCap = ''.obs;
  var selectedTimeValue = ''.obs;
  var fromTime = ''.obs;
  var toTime = ''.obs;
  void setWaterCap(String value) {
    selectedWaterCap.value = value;
  }

  void setTimeInterval(String value) {
    selectedTimeValue.value = value;
  }

  void setFromTime(String time) {
    fromTime.value = time;
  }

  void setToTime(String time) {
    toTime.value = time;
  }

  void saveReminder() {
    // You could save this to a database or shared preferences instead
    print('Water Cap: ${selectedWaterCap.value}');
    print('Interval: ${selectedTimeValue.value}');
    print('From: ${fromTime.value}');
    print('To: ${toTime.value}');
  }
}
