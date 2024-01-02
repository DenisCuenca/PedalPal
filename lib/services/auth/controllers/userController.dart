import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/userModel.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<void> createUser(UserModel user) async {
    await _db
        .collection("users")
        .add(user.toJSON())
        .whenComplete(() => Get.snackbar(
            "Bien Hecho", "Cuenta creada exitosamente!",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red.shade200,
            colorText: Colors.green))
        .catchError((error, stackTrace) {
      Get.snackbar("Opps...", error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.lightGreen.shade200,
          colorText: Colors.red);
    });
  }
}
