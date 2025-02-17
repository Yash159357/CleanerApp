import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:internship_project/model/job_item.dart';
// import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> signUp(String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'email': email,
        'password': password,
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      rethrow;
    }
  }

  void logout() {
    _auth.signOut();
  }

  Future<void> saveToFirestore(JobItem jobItem) async {
    try {
      await FirebaseFirestore.instance.collection('jobItems').doc(jobItem.id).set({
        'title': jobItem.title,
        'address': jobItem.address,
        'price': jobItem.price,
        'rating': jobItem.rating,
        'imageUrl': jobItem.imageUrl,
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> googleLogin() async {}
  Future<void> facebookLogin() async {}
  Future<void> phoneLogin() async {}
}
