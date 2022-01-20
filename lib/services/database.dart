import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Map<String, dynamic> data = {"Roll_No": 'TECOD467'};
  addData() {
    CollectionReference<Map<String, dynamic>> studentCollection =
        FirebaseFirestore.instance.collection('student');
    studentCollection.add(data);
  }

  getData() {
    CollectionReference<Map<String, dynamic>> studentCollection =
        FirebaseFirestore.instance.collection('student');
    studentCollection.snapshots().listen((snapshot) {});
  }
}
