// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

class BreakFast extends StatefulWidget {
  const BreakFast({super.key});

  @override
  State<BreakFast> createState() => _BreakFastState();
}

class _BreakFastState extends State<BreakFast> {
  int _selectedindex = 0;
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
              height: 50,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorLight,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  Icon(Icons.search, color: Colors.grey),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(10),
                      ),
                    ),
                  ),
                  Icon(Icons.filter_list, color: Colors.grey),
                ],
              ),
            ),
          ),
          //////////////////RECENT AND FAVORITES///////////
          Container(
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColorLight,
              borderRadius: BorderRadius.circular(25),
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
              itemCount: 10,
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Food Item ${index + 1}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          const SizedBox(height: 4),
                          Text('${index * 50 + 75} cals'),
                        ],
                      ),
                      const Icon(Icons.add_circle_outline, color: Colors.blue),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
