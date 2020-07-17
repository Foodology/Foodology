import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodology/models/userData.dart';
import 'package:foodology/models/recipe.dart';

class DatabaseService {

  DatabaseService._internal();

  static final DatabaseService _singleton = DatabaseService._internal();

  factory DatabaseService() {
    return _singleton;
  }

  Stream<PublicInfo> publicUserInfo(String key) {
    return Firestore.instance
        .collection('Users')
        .document(key)
        .collection('Info')
        .document('Public')
        .snapshots()
        .map((snap) => PublicInfo.fromFirestore(snap));
  }

  Stream<UserData> userData() {
    return Firestore.instance
        .collection('Users')
        .document('FIA1d66UO7O4puwb1Zhia1q4nFh1')
        .collection('Info')
        .snapshots()
        .map((event) => UserData.fromFirestore(event));
  }

  Stream<Recipe> recipe(DocumentReference doc){
    return doc.snapshots().map((event) => Recipe.fromFirestore(event));
  }
}