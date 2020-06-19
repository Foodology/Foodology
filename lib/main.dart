import 'package:flutter/material.dart';
import 'package:foodology/home-card.dart';

void main() {
  runApp(MaterialApp(
    title: 'Welcome to Flutter',
    home: Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Flutter'),
      ),
      body: HomeCard()
    ),
  ));
}