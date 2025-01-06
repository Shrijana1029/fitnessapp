import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../foods/controller.dart';
import 'food_details.dart';

class FavoritesPage extends StatelessWidget {
  final FavoritesController favoritesController = Get.find();

  FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (favoritesController.favoriteFoods.isEmpty) {
          return const Center(child: Text('No favorites added.'));
        }
        return ListView.builder(
          itemCount: favoritesController.favoriteFoods.length,
          itemBuilder: (context, index) {
            final food = favoritesController.favoriteFoods[index];
            return ListTile(
              leading: Image.asset(food.image1, width: 50, height: 50),
              title: Text(food.name),
              trailing: IconButton(
                icon: const Icon(Icons.remove_circle, color: Colors.red),
                onPressed: () {
                  favoritesController.removeFromFavorites(food);
                },
              ),
              onTap: () => Get.to(() => FoodDetail(food: food)),
            );
          },
        );
      }),
    );
  }
}
