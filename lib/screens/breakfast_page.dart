// import 'package:flutter/foundation.dart';
import 'package:fitnessapp/screens/food_details.dart';
import 'package:fitnessapp/screens/food_list.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

class BreakFast extends StatefulWidget {
  const BreakFast({super.key});

  @override
  State<BreakFast> createState() => _BreakFastState();
}

class _BreakFastState extends State<BreakFast> {
  int _selectedindex = 0;
  List<Food> foods = foodList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context)
          .primaryColorDark, // Gradient background starting color
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Calculate Calories'),
        centerTitle: true,
        actions: const [Icon(Icons.more_vert)],
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
              itemCount: foods.length,
              itemBuilder: (context, index) {
                final food = foods[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 119, 170, 144),
                      border: Border.all(
                        color: const Color.fromARGB(255, 66, 31, 31),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10), // Add this line
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      child: ListTile(
                        leading: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(30), // Add this line
                          ),
                          child: Image.asset(
                            food.image1,
                            fit: BoxFit.cover,
                            width: 50,
                            height: 50,
                          ),
                        ),
                        title: Text(food.name),
                        trailing: const Icon(Icons.favorite_border),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FoodList(food: food),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  ///food search///////////
  void searchedItem(String query) {
    final suggestions = foodList.where((food) {
      final foodName = food.name.toLowerCase();
      final input = query.toLowerCase();
      return foodName.contains(input);
    }).toList();
    setState(
      () => foods = suggestions,
    );
  }
}
