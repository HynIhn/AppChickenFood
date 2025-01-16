import 'package:ChickenFood/page/my_page.dart';
import 'package:flutter/material.dart';
import 'Theme/color_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'APP_CHICKEN',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: mainColor),
        fontFamily: 'Lato'
      ),
      home: const MyHomePage(),
    );
  }
}


