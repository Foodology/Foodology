import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

 
//import 'package:flutter/material.dart';
//
//class HomePage extends StatefulWidget {
//  @override
//  _HomePageState createState() => _HomePageState();
//}
//
//class _HomePageState extends State<HomePage> {
//
//  int _selectedPage = 0;
//  final pageOptions = [
//    Text("Page1"),
//    Text("Page2"),
//    Text("Page3"),
//    Text("Page4"),
//    Text("Page5")
//  ];
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("HomePage"),
//      ),
//      body: pageOptions[_selectedPage],
//      bottomNavigationBar: BottomNavigationBar(
//        currentIndex: _selectedPage,
//        onTap: (int index) {
//          setState(() {
//            _selectedPage = index;
//          });
//        },
//        items: [
//          BottomNavigationBarItem(
//              icon: Icon(Icons.home),
//              title: Text("Home")
//          ),
//          BottomNavigationBarItem(
//              icon: Icon(Icons.search),
//              title: Text("Explore")
//          ),
//          BottomNavigationBarItem(
//              icon: Icon(Icons.add),
//              title: Text("Add")
//          ),
//          BottomNavigationBarItem(
//              icon: Icon(Icons.message),
//              title: Text("Message")
//          ),
//          BottomNavigationBarItem(
//              icon: Icon(Icons.account_circle),
//              title: Text("Profile")
//          ),
//        ],
//      ),
//    );
//  }
//}
