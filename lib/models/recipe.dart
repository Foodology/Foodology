import 'package:cloud_firestore/cloud_firestore.dart';

class Recipe {
  final String id;
  final RecipeData data;

  Recipe.fromSnapshot(DocumentSnapshot snapshot)
      : id = snapshot.documentID,
        data = RecipeData.fromMap(snapshot.data);
}

class RecipeData {
  final String author;
  final String title;
  final double authorRating;
  final String detailedSummary;
  final double recipeRating;
  final String summary;

  RecipeData.fromMap(Map<dynamic, dynamic> data)
      : author = data['author'],
        title = data['title'],
        authorRating = data['authorRating'],
        detailedSummary = data['detailedSummary'],
        recipeRating = data['recipeRating'],
        summary = data['summary'];
}