import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:task_management_app/state/user_state/user_model/user_model.dart';
import 'package:task_management_app/utilities/constants/db_constants.dart';
import 'package:task_management_app/utilities/extensions/firebase_user_ext.dart';

class UsersHandler {
  UsersHandler();

  CollectionReference<Map<String, dynamic>> db = FirebaseFirestore.instance.collection(USER_COLLECTION);

  Future<UserModel?> userLogin(User? user, {String? displayName}) async {
    if (user == null) return null;
    // Queries db if id exists
    final isUserExist = await db.doc(user.uid).get().then((value) => value.exists);

    if (!isUserExist) {
      // Creates entity when user does not exist in database
      final newUser = user.toMap;
      await db.doc(user.uid).set(newUser);
      await user.updateDisplayName(displayName);
    }

    final userDoc = await db.doc(user.uid).get();

    if (userDoc.data() == null) return null;

    final currUser = UserModel.fromJson(userDoc.data()!);

    return currUser;
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final userCred = await FirebaseAuth.instance.signInWithCredential(credential);

    return userCred;
  }

  Future<UserCredential> signInWithEmailAndPassword({required String email, required String password}) async {
    final userCred = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCred;
  }
}
