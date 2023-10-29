import 'package:flutter/material.dart';
import 'package:flutter_assignment_2/login.dart';
import 'package:flutter_assignment_2/sign%20up.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF765DC2),
        hintColor: Color.fromARGB(255, 170, 97, 196),
      ),
      themeMode: ThemeMode.system,
      home: SwipeableScreens(),
    );
  }
}

class SwipeableScreens extends StatelessWidget {
  final PageController _pageController = PageController();

  SwipeableScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: const <Widget>[
          LoginPage(), // First screen
          SignupPage(), // Second screen
        ],
      ),
    );
  }
}
