import 'package:flutter/material.dart';
import 'package:foodology/screens/accountPage.dart';
import 'package:foodology/screens/addRecipesPage.dart';
import 'package:foodology/screens/home/homePage.dart';
import 'package:foodology/screens/messagesPage.dart';
import 'package:foodology/screens/searchPage.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _selectedPage = 0;
  final pageOptions = [
    HomePage(),
    SearchPage(),
    AddRecipesPage(),
    MessagesPage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Foodology",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: IndexedStack(
          index: _selectedPage,
          children: pageOptions,
        ),
        appBar: AppBar(title: Text("Foodology")),
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