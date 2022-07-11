import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vipratechuserauth/widgets/loader.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_model.dart';

CollectionReference userCollection =
    FirebaseFirestore.instance.collection('user_collection');

class RegistrationProvider extends ChangeNotifier {
  UserModel? userModel;

  Future<bool> signUp() async {
    try {
      if (userModel != null) {
        await userCollection.add(
          {
            'name': userModel?.name,
            'email': userModel?.email,
            'mobile': userModel?.mobile,
            'password': userModel?.password
          },
        );
      }
      return true;
    } catch (e) {
      const SnackBar(
        content: Text("Something went wrong!!"),
      );
      return false;
    }
  }
}
