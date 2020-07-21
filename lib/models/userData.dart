import 'package:cloud_firestore/cloud_firestore.dart';

// Updates the user info of the current user
class UserData{
  PrivateInfo private;
  PublicInfo public;

  UserData({this.public, this.private});

  // Gets both the public and private data and stores them for use
  factory UserData.fromFirestore(QuerySnapshot snapshot){
    UserData info = UserData();
    snapshot.documents.forEach((element) {
      if(element.documentID == "Public"){
        info.public = PublicInfo.fromFirestore(element);
      } else {
        info.private = PrivateInfo.fromFirestore(element);
      }
    });
    return info;
  }
}

// Gets the private data of the current user and stores it for use
class PrivateInfo{
  String email;
  List<String> friends;
  Map<String, dynamic> recommendedRecipes;
  List<String> liked;

  PrivateInfo({this.email, this.friends, this.recommendedRecipes, this.liked});

  // Get data from the snapshot
  factory PrivateInfo.fromFirestore(DocumentSnapshot doc){
    Map data = doc.data ?? { };
    return PrivateInfo(
      email: data['email'] ?? '',
      friends: List.from(data['friends']) ?? [],
      recommendedRecipes: Map.from(data['recommendedRecipes'])  ?? Map(),
      liked: List.from(data['liked']) ?? []
    );
  }
}

// Gets the public data of the current user and stores it for use
class PublicInfo{
  String name;
  double authorRating;
  String profilePicture;

  PublicInfo({this.name, this.authorRating, this.profilePicture});

  // Get data from the snapshot
  factory PublicInfo.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data ?? { };
    return PublicInfo(
      name: data['name'] ?? '',
      authorRating: data['authorRating'] ?? 0.0,
      profilePicture: data['profilePicture'] ?? '',
    );
  }
}