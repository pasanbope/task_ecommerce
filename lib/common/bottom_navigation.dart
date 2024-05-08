import 'package:flutter/material.dart';

import '../screens/bag.dart';
import '../screens/category_page.dart';
import '../screens/favorite.dart';
import '../screens/home.dart';
import '../screens/profile.dart';



class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int currentIndex=0;
  List pages = [
    HomeScreen(),
    const ScrollableListPage(),
    const Bag(),
    const Favorite(),
    const Profile(),



  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar:Container(
        margin:  const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration:  const BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey
          )
        ]),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          onTap:(index) {
            setState(() {
              currentIndex = index;
            });
          },
          currentIndex: currentIndex,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          elevation: 0,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: 'Shop'),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_bag),label: 'Bag'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'Favorite'),
            BottomNavigationBarItem(icon: Icon(Icons.person_sharp),label: 'Profile'),
          ],
        ),
      ),
     body: pages[currentIndex],
    );
  }
}
