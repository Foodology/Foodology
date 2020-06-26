import 'package:flutter/material.dart';
import 'package:foodology/Home.dart';

void main() {
  runApp(MaterialApp(
    title: 'Foodology',
    home: Scaffold(
      appBar: AppBar(
        title: Text('Foodology'),
      ),
      body: Home()
    ),
  ));
}