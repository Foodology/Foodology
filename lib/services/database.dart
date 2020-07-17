import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodology/models/recipe.dart';
import 'package:foodology/models/userInfo.dart';

class DatabaseService {

  DatabaseService._internal();

  static final DatabaseService _singleton = DatabaseService._internal();

  factory DatabaseService() {
    return _singleton;
  }

  // Brew list from snapshot
  List<Recipe> _recipesFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      return Recipe(
        id: doc.documentID,
          data: RecipeData(
            title: doc.data['title'] ?? '',
            author: doc.data['author'] ?? '',
            authorRating: doc.data['authorRating'] ?? '',
            recipeRating: doc.data['recipeRating'] ?? '',
            summary: doc.data['summary'] ?? '',
            detailedSummary: doc.data['detailedSummary'] ?? ''
          ),
      );
    }).toList();
  }

  Stream<List<Recipe>> get recipes {
    return Firestore.instance
        .collection('Recipes')
        .document('FIA1d66UO7O4puwb1Zhia1q4nFh1')
        .collection('topRecipes').snapshots().map(_recipesFromSnapshot);
  }

  Stream<UserInfo> get userInfo {
    return Firestore.instance.collection('Users')
        .document('FIA1d66UO7O4puwb1Zhia1q4nFh1').get().then((value) {
          return UserInfo(
              authorRating: value["authorRating"],
              email: value['email'],
              friends: value['friends'],
              name: value['name'],
              profilePicture: value['profilePicture']
          );
    }).asStream();
  }
}