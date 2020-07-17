import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodology/models/userInfo.dart';

class DatabaseService {

  DatabaseService._internal();

  static final DatabaseService _singleton = DatabaseService._internal();

  factory DatabaseService() {
    return _singleton;
  }

  Stream<PublicInfo> publicUserInfo() {
    return Firestore.instance
        .collection('Users')
        .document('1weHFMrmWtV2UtFY7za11ODbyb13')
        .collection('Info')
        .document('Public')
        .snapshots()
        .map((snap) => PublicInfo.fromFirestore(snap));
  }

  Stream<PrivateInfo> privateUserInfo() {
    return Firestore.instance
        .collection('Users')
        .document('1weHFMrmWtV2UtFY7za11ODbyb13')
        .collection('Info')
        .document('Private')
        .snapshots()
        .map((snap) => PrivateInfo.fromFirestore(snap));
  }

  Stream<UserData> userData() {
    return Firestore.instance
        .collection('Users')
        .document('FIA1d66UO7O4puwb1Zhia1q4nFh1')
        .collection('Info')
        .snapshots()
        .map((event) => UserData.fromFirestore(event));
  }
}