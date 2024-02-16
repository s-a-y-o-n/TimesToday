import 'package:flutter/material.dart';
import 'package:timestoday/view/categoryscreen.dart';
import 'package:timestoday/view/homepage.dart';
import 'package:timestoday/view/searchscreen.dart';

class BottomNavController extends ChangeNotifier {
  int selectedindex = 0;
  void onItemtap(index) {
    selectedindex = index;
    notifyListeners();
  }

  List<Widget> mypages = [HomePage(), CategoryScreen(), SearchScreen()];
}
