import 'package:flutter/material.dart';
import 'package:foodology/screens/AccountPage.dart';
import 'package:foodology/screens/AddRecipesPage.dart';
import 'package:foodology/screens/Home.dart';
import 'package:foodology/screens/MessagesPage.dart';
import 'package:foodology/screens/SearchPage.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedPage = 0;
  final pageOptions = [
    Home(),
    SearchPage(),
    AddRecipesPage(),
    MessagesPage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BottomNav",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(title: Text("Bottom Nav")),
          body: pageOptions[_selectedPage],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedPage,
            onTap: (int index) {
              setState(() {
                _selectedPage = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text("Home")
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  title: Text("Search")
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.add),
                  title: Text("Add Recipes")
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.message),
                  title: Text("Messages")
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle),
                  title: Text("Account")
              )
            ],
          ),
      ),
    );
  }
}