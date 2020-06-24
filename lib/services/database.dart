import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  DatabaseService._internal();

  static final DatabaseService _singleton = DatabaseService._internal();

  factory DatabaseService() {
    return _singleton;
  }

  Future getRecipe() async {
    print("here");
    await Firestore.instance.collection('collection_name').getDocuments().then((event) {
      if (event.documents.isNotEmpty) {
        Map<String, dynamic> documentData = event.documents.single.data;//if it is a single document
        print(documentData);
      }
    }).catchError((e)=> print("error fetching data: $e"));
  }
}