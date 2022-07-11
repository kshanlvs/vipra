import 'package:flutter/foundation.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class LoginProvider extends ChangeNotifier {
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection('user_collection');

  bool _isInvalid = false;
  set isInvalidCredential(bool val) {
    _isInvalid = val;
    notifyListeners();
  }
  get hasLogInFailed => _isInvalid;

// //For setting a specific document ID use .set instead of .add
// users.doc(documentId).set({
//             //Data added in the form of a dictionary into the document.
//             'full_name': fullName,
//             'grade': grade,
//             'age': age
//           });

//For updating docs, you can use this function.
// Future<void> updateUser() {
//   return students
//     //referring to document ID, this can be queried or named when added accordingly
//     .doc(documentId)
//     //updating grade value of a specific student
//     .update({'grade': newGrade})
//     .then((value) => print("Student data Updated"))
//     .catchError((error) => print("Failed to update data"));
// }
  Future<bool> login({required String email, required String password}) async {
    var hasMatch = await userCollection
        .where("password", isEqualTo: password)
        .where("email", isEqualTo: email)
        .get();
    if (hasMatch.docChanges.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
