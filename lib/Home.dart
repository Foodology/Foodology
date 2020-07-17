import 'package:flutter/material.dart';
import 'package:foodology/createHomeCards.dart';
import 'package:foodology/models/recipe.dart';
import 'package:foodology/models/userInfo.dart';
import 'package:foodology/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return CreateHomeCards();
  }
}
