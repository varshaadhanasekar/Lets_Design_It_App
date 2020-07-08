import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CrudMethods {
  bool isLoggedIn() {
    if (FirebaseAuth.instance.currentUser() != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> addData(data, coll) async {
    if (isLoggedIn()) {
      Firestore.instance.collection(coll).add(data).catchError((e) {
        print(e);
      });
    } else {
      print('You need to be logged in');
    }
  }

  getData(coll) async {
    return Firestore.instance.collection(coll).snapshots();
  }

  updateData(selectedDoc, newValues, coll) {
    Firestore.instance
        .collection(coll)
        .document(selectedDoc)
        .updateData(newValues)
        .catchError((e) {
      print(e);
    });
  }
}
