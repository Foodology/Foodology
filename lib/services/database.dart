import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodology/models/recipe.dart';

class DatabaseService {

  DatabaseService._internal();

  static final DatabaseService _singleton = DatabaseService._internal();

  factory DatabaseService() {
    return _singleton;
  }

//  Stream<List<Recipe>> getRecipes() {
//    return Firestore.instance
//        .collection("Recipes")
//        .getDocuments()
//        .then((snapshot) {
//          return Recipe.fromSnapshot(snapshot);
//    }).asStream();
//  }

  Stream<Recipe> getRecipe() {
    return Firestore.instance
        .collection("Recipes")
        .document("Hml1ImpBEfuEgzyyCYFp")
        .get()
        .then((snapshot) {
      try {
        return Recipe.fromSnapshot(snapshot);
      } catch (e) {
        print(e);
        return null;
      }
    }).asStream();
  }

//  Future getRecipe() {
//    Firestore.instance.collection('Recipes').getDocuments().then((event) {
//      if (event.documents.isNotEmpty) {
//        Map<String, dynamic> documentData = Map<String, dynamic>();
//        event.documents.forEach((element) {
//          documentData[element.documentID] = element;
//        });
//        print(documentData);
//      }
//    }).catchError((e)=> print("error fetching data: $e"));
//  }
}