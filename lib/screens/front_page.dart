import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedindex = 0;

  void _tappedItem(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 184, 216, 201),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipOval(
            child: Image.asset(
              'assets/img/user.jpg',
              height: 20,
              width: 20,
              // fit: BoxFit.cover,
            ),
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.messenger)),
        ],
        backgroundColor: const Color.fromARGB(255, 184, 216, 201),
      ),
      body: const Center(
          child: Text(
        "HELLO  !!!",
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
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
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Dashboard'),
            BottomNavigationBarItem(
                icon: Icon(Icons.menu_book_sharp), label: 'Diary'),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month_rounded), label: 'Plans'),
            BottomNavigationBarItem(
                icon: Icon(Icons.more_horiz), label: 'More'),
          ],
        ),
      ),
    );
  }
}
