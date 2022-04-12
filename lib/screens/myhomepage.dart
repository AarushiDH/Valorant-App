import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:venatus_app/screens/home_page.dart';
import 'package:venatus_app/screens/showprofile.dart';
import '../widget/navigation_drawer_widget.dart';
import 'package:venatus_app/screens/userform.dart';
import '../page/agents.dart';

class MyHomePage extends StatefulWidget {
  static const routeName = '/home-page';
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  final screens = [
    HomePage(),
    Agents(),
    ShowProfile(),
  ];
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    final items = <Widget>[
      Icon(Icons.home, size: 30),
      Icon(Icons.photo_size_select_actual_rounded, size: 30),
      Icon(Icons.person, size: 30),
    ];
    // TODO: implement build
    return Scaffold(
      extendBody: true,
      body: screens[currentIndex],
      backgroundColor: Theme.of(context).accentColor,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        items: items,
        height: 60,
        index: currentIndex,
        onTap: (index) => setState(() => this.currentIndex = index),
        // type: BottomNavigationBarType.fixed,
        // currentIndex: currentIndex,
        // onTap: (index) => setState(() => currentIndex = index),
        // items: [
        //   BottomNavigationBarItem(
        //     icon: Icon(Icons.home),
        //     label: 'Home',
        //     backgroundColor: Colors.red,
        //   ),
        //   BottomNavigationBarItem(
        //     icon: Icon(Icons.person),
        //     label: 'User Data',
        //     backgroundColor: Colors.red,
        //   ),
        // ],
      ),
    );
  }
}
