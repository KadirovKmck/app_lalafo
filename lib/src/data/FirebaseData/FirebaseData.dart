// ignore_for_file: file_names

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:university/src/domain/model/UserModels.dart';

class FirebaseData {
  final firebaseUser = FirebaseAuth.instance;

  static final informationAboutUser =
      FirebaseFirestore.instance.collection('informationAboutUser');

  void registerFirebase(String name, String email, String password) async {
    try {
      final userCreate = await firebaseUser.createUserWithEmailAndPassword(
          email: email, password: password);

      final User? userId = userCreate.user;

      final userModel = UserModels(
        name: name,
        email: email,
        password: password,
        images: '',
        id: userId!.uid.toString(),
      );

      await informationAboutUser.doc(userId.uid).set(userModel.toMap());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'слабый пароль') {
        log('Предоставленный пароль слишком слабый.');
      } else if (e.code == 'Этот электронный адрес уже занят') {
        log('Аккаунт для этого адреса электронной почты уже существует.');
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
