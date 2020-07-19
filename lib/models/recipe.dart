import 'package:cloud_firestore/cloud_firestore.dart';

// This class holds all the data for each recipe
class Recipe {
  String detailedSummary;
  List<String> images;
  double recipeRating;
  String summary;
  String title;
  int likes;
  int dislikes;

  Recipe({this.detailedSummary, this.images, this.recipeRating, this.summary, this.title, this.likes, this.dislikes});

  // Updates the fields of Recipe with a document snapshot from firebase
  factory Recipe.fromFirestore(DocumentSnapshot doc){
    Map data = doc.data ?? {};
    return Recipe(
      detailedSummary: data['detailedSummary'] ?? '',
      images: List.from(data['images']) ?? [],
      recipeRating: data['recipeRating'] ?? 0.0,
      summary: data['summary'] ?? '',
      title: data['title'] ?? '',
      likes: data['likes'] ?? 0,
      dislikes: data['dislikes'] ?? 0,
    );
  }
}