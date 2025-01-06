import 'package:fitnessapp/screens/foods/favorite_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'food_details.dart';
import '../foods/controller.dart';

import 'food_list.dart';

class BreakFast extends StatefulWidget {
  BreakFast({super.key});

  @override
  State<BreakFast> createState() => _BreakFastState();
}

class _BreakFastState extends State<BreakFast> {
  int _selectedindex = 0;

  // List<Food> foods = foodList;
  final FavoritesController favoritesController =
      Get.put(FavoritesController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculate Calories'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          //////////SEARCH///////////////
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 60,
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorLight,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: Colors.grey),
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: 'Search...',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(10),
                        ),
                        onChanged: searchedItem,
                      ),
                    ),
                    const Icon(Icons.filter_list, color: Colors.grey),
                  ],
                ),
              ),
            ),
          ),
          //////////////////RECENT AND FAVORITES///////////
          Container(
            height: 60,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColorLight,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Center(
                      child: TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: _selectedindex == 0
                                  ? Colors.grey
                                  : Theme.of(context).primaryColorLight),
                          onPressed: () {
                            setState(() {
                              _selectedindex = 0;
                            });
                          },
                          child: const Text(
                            'Recent',
                            style: TextStyle(color: Colors.black),
                          ))),
                ),
                Expanded(
                  child: Center(
                    child: TextButton(
                        onPressed: () {
                          setState(() {
                            _selectedindex = 1;
                          });
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: _selectedindex == 1
                                ? Colors.grey
                                : Theme.of(context).primaryColorLight),
                        child: const Text('Favorites',
                            style: TextStyle(
                              color: Colors.black,
                            ))),
                  ),
                ),
              ],
            ),
          ),
          /////////////RECENT FOOD ITEMS////////////
          Expanded(
            child: ListView.builder(
              itemCount: foodList.length,
              itemBuilder: (context, index) {
                final food = foodList[index];
                return ListTile(
                  leading: Image.asset(food.image1, width: 50, height: 50),
                  title: Text(food.name),
                  trailing: Obx(() {
                    //remember it returns bool value //
                    final isFavorite =
                        favoritesController.favoriteFoods.contains(food);
                    //
                    return IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : null,
                      ),
                      onPressed: () {
                        if (isFavorite) {
                          favoritesController.removeFromFavorites(food);
                        } else {
                          favoritesController.addToFavorites(food);
                        }
                      },
                    );
                  }),
                  onTap: () => Get.to(() => FoodDetail(food: food)),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.favorite),
          onPressed: () {
            Get.to(FavoritesPage());
          }),
    );
  }

  //food search///////////
  void searchedItem(String query) {
    final suggestions = foodList.where((food) {
      final foodName = food.name.toLowerCase();
      final input = query.toLowerCase();
      return foodName.contains(input);
    }).toList();
    setState(
      () => foodList = suggestions,
    );
  }
}
