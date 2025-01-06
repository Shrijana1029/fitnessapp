// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'favorites_controller.dart';
// import 'food_list.dart';

// class FoodDetail extends StatelessWidget {
//   final Food food;
//   final FavoritesController favoritesController = Get.find();

//   FoodDetail({super.key, required this.food});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Food Details'),
//         actions: [
//           Obx(() {
//             final isFavorite = favoritesController.favoriteFoods.contains(food);
//             return IconButton(
//               icon: Icon(
//                 isFavorite ? Icons.favorite : Icons.favorite_border,
//                 color: isFavorite ? Colors.red : null,
//               ),
//               onPressed: () {
//                 if (isFavorite) {
//                   favoritesController.removeFromFavorites(food);
//                 } else {
//                   favoritesController.addToFavorites(food);
//                 }
//               },
//             );
//           }),
//         ],
//       ),
//       body: Center(
//         child: Text(food.name), // Simplified for clarity
//       ),
//     );
//   }
// }
