import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:youtube_tutorial_ecommerce/custom_widgets/DrawerScreen.dart';
import 'package:youtube_tutorial_ecommerce/screens/First_Screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.red[400],
        height: 45,
        items: [
          Icon(Icons.home, size: 25),
          Icon(Icons.favorite_border_sharp, size: 25),
          Icon(Icons.perm_identity, size: 25),
        ],
      ),
      backgroundColor: Colors.black87,
      body: Stack(
        children: [DrawerScreen(), HomeScreen()],
      ),
    );
  }
}
