import 'package:flutter/material.dart';
import 'package:foodology/screens/home/cards/createHomeCards.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CreateHomeCards(),
    );
  }
}
