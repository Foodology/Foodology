import 'package:flutter/material.dart';
import 'package:foodology/screens/accountPage.dart';
import 'package:foodology/screens/addRecipesPage.dart';
import 'package:foodology/screens/homePage.dart';
import 'package:foodology/screens/messagesPage.dart';
import 'package:foodology/screens/searchPage.dart';

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
    homePage(),
    searchPage(),
    addRecipesPage(),
    messagesPage(),
    accountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BottomNav",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(title: Text("Foodology")),
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