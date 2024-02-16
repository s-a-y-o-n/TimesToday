import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timestoday/controller/bottomnavcontroller.dart';

class Main_page extends StatelessWidget {
  const Main_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider.of<BottomNavController>(context)
          .mypages[Provider.of<BottomNavController>(context).selectedindex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Color.fromARGB(106, 70, 76, 88),
              borderRadius: BorderRadius.circular(20)),
          child: BottomNavigationBar(
              elevation: 0,
              currentIndex:
                  Provider.of<BottomNavController>(context).selectedindex,
              onTap: Provider.of<BottomNavController>(context).onItemtap,
              backgroundColor: Colors.transparent,
              selectedIconTheme: IconThemeData(
                  color: Color.fromARGB(255, 0, 153, 255), size: 25),
              unselectedIconTheme: IconThemeData(
                  color: const Color.fromARGB(255, 255, 255, 255), size: 23),
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.white,
              showUnselectedLabels: false,
              showSelectedLabels: false,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.category), label: "Category"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), label: "Search"),
              ]),
        ),
      ),
    );
  }
}
