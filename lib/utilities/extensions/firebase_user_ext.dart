import 'package:firebase_auth/firebase_auth.dart';

extension FirebaseUserExt on User {
  Map<String, dynamic> get toMap => <String, dynamic>{
        "uid": uid,
        "email": email,
        "firstName": displayName?.split(' ')[0],
        "lastName": displayName?.split(' ')[1],
        "username": email,
      };
}
