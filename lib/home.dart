import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white, // Set the background color to white
      body: Center(
        child: Text(
          'Welcome :)',
          style: TextStyle(
            fontSize: 50,
            color: Color(0xFF765DC2), // Text color
          ),
        ),
      ),
    );
  }
}
