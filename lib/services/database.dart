import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit_app_exam/models/pet.dart';
import 'package:fit_app_exam/models/user.dart';
import 'package:fit_app_exam/screens/authenticate/register.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});
//collection reference
  final CollectionReference petCollection =
      FirebaseFirestore.instance.collection('petfit');

  Future updateUserData(String Name, String Surname, String Age, String Weigth,
      String Heigth, String Nickname, String userID, List step) async {
    return await petCollection.doc(uid).set({
      'Name': Name,
      'Surname': Surname,
      'Age': Age,
      'Weigth': Weigth,
      'Heigth': Heigth,
      'Nickname': Nickname,
      'UserID': userID,
      'ListStep': step,
    });
  }

  //list from snapshot

  Iterable<pet> _petListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return pet(
          name: doc.get('Name') ?? '',
          surname: doc.get('Surname') ?? '',
          age: doc.get('Age') ?? 0,
          weigth: doc.get('Weigth') ?? 0,
          heigth: doc.get('Heigth') ?? 0,
          nickname: doc.get('Nickname') ?? '',
          userID: doc.get('UserID') ?? '',
          step: doc.get('ListStep') ?? []);
    }).toList();
  }

  //get userdata from snapshot

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot['Name'],
      surname: snapshot['Surname'],
      age: snapshot['Age'],
      heigth: snapshot['Heigth'],
      weigth: snapshot['Weigth'],
      nickname: snapshot['Nickname'],
      userID: snapshot['UserID'],
      step: snapshot['ListStep'],
    );
  }

  //get stream

  Stream<Iterable<pet>> get petdata {
    return petCollection.snapshots().map(_petListFromSnapshot);
  }

  //get user doc stream
  Stream<UserData> get userData {
    return petCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
