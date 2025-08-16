import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper/pages/categories.dart';
import 'package:wallpaper/pages/home.dart';
import 'package:wallpaper/pages/search.dart';

class Bottomnav extends StatefulWidget {
  const Bottomnav({super.key});

  @override
  State<Bottomnav> createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
  int currentTabIndex = 0;
  late List<Widget> pages;
  late Home home;

  late Categories categories;
  late Search search;
  late Widget currentPage;
  @override
  void initState() {
    home = Home();

    categories = Categories();
    search = Search();
    pages = [home, categories, search];
    currentPage = Home();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
       backgroundColor: Color.fromARGB(255, 11, 10, 31),
        buttonBackgroundColor: Colors.pink, //255 10 16 66
        height: 75,
        color: Color.fromARGB(255, 10, 16, 66),
        animationDuration: Duration(microseconds: 500),
        onTap: (int index) {
          setState(() {
            currentTabIndex = index;
          });
        },

        items: [
          Icon(Icons.home, color: Colors.white),
          Icon(Icons.category_outlined,color: Colors.white),
          Icon(Icons.search_off_outlined,color: Colors.white),
        ],
      ),
      body: pages[currentTabIndex],
    );
  }
}
