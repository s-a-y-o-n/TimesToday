import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timestoday/controller/bottomnavcontroller.dart';
import 'package:timestoday/controller/categorycontroller.dart';
import 'package:timestoday/controller/homescreencontroller.dart';
import 'package:timestoday/controller/searchscreencontroller.dart';
import 'package:timestoday/view/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeScreenController()),
        ChangeNotifierProvider(create: (context) => SearchScreenController()),
        ChangeNotifierProvider(create: (context) => BottomNavController()),
        ChangeNotifierProvider(create: (context) => CategoryController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Main_page(),
      ),
    );
  }
}
