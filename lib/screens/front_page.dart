import 'package:fitnessapp/screens/breakfast_page.dart';
import 'package:fitnessapp/screens/food_list.dart';
import 'package:fitnessapp/screens/home.dart';
// import 'package:fitnessapp/screens/login_page.dart';
import 'package:fitnessapp/screens/profile.dart';
// import 'package:fitnessapp/screens/signup_page.dart';
import 'package:flutter/material.dart';

class FrontPage extends StatefulWidget {
  FrontPage({super.key});

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  int _selectedindex = 0;

  void _tappedItem(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  // make list for display text
  final List<Widget> _pages = [
    const Home(),
    const BreakFast(),
    const FoodList(),
    // scrollbottom(context)
    const Profile()
    // const Home()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 184, 216, 201),
      ///////////APP BAR CONTEXT//////////
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipOval(
            child: Image.asset(
              'assets/img/user.jpg',
              height: 40,
              width: 40,
              fit: BoxFit.cover,
            ),
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.messenger)),
        ],
        backgroundColor: const Color.fromARGB(255, 184, 216, 201),
      ),
      body: _pages[_selectedindex],

      //////////BOTTOM NAVIGATION BAR////////
      bottomNavigationBar: Container(
        height: 90,
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 184, 216, 201),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(50),
            )),
        child: BottomNavigationBar(
          onTap: _tappedItem,
          backgroundColor: Colors.transparent,

          currentIndex: _selectedindex,
          selectedItemColor: const Color.fromARGB(255, 233, 218, 115),
          unselectedItemColor: Colors.black,
          showSelectedLabels: true, //display labels for selected items
          // showUnselectedLabels: false, //hides labels for unselected items
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), label: 'sDashboard'),
            BottomNavigationBarItem(
                icon: Icon(Icons.menu_book_sharp), label: 'Diary'),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month_rounded), label: 'Plans'),
            BottomNavigationBarItem(
                icon: Icon(Icons.more_horiz), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}

Future scrollbottom(BuildContext context) {
  // return showModalBottomSheet(
  //     context: context,
  //     builder: (context) {
  //       return StatefulBuilder(
  //           builder: (BuildContext context, StateSetter setState) {
  //         return Container();
  //       });
  //     }
  //     );
  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('This is a Modal Bottom Sheet'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        ),
      );
    },
  );
}
