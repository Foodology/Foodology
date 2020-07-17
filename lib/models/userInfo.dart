import 'package:cloud_firestore/cloud_firestore.dart';

class UserData{
  PrivateInfo private;
  PublicInfo public;

  UserData({this.public, this.private});

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

class PrivateInfo{
  String email;
  List<String> friends;
  Map<String, String> recommendedRecipes;

  PrivateInfo({this.email, this.friends, this.recommendedRecipes});

  factory PrivateInfo.fromFirestore(DocumentSnapshot doc){
    Map data = doc.data ?? { };
    return PrivateInfo(
      email: data['email'] ?? '',
      friends: List.from(data['friends']) ?? [],
      recommendedRecipes: Map.from(data['recommendedRecipes'])  ?? Map()
    );
  }
}

class PublicInfo{
  String name;
  double authorRating;
  String profilePicture;

  PublicInfo({this.name, this.authorRating, this.profilePicture});

  factory PublicInfo.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data ?? { };
    return PublicInfo(
      name: data['name'] ?? '',
      authorRating: data['authorRating'] ?? 0.0,
      profilePicture: data['profilePicture'] ?? '',
    );
  }
}