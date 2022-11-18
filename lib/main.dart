import 'package:flutter/material.dart';
import 'package:flutter_ebook/screens/bottom_nav_bar.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'E-Book App',
      debugShowCheckedModeBanner: false,
      home: BottomNavBar(),
    );
  }
}