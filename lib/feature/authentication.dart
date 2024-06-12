import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authentication {
  final _auth = FirebaseAuth.instance;

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      _auth.signInWithCredential(credential);
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  bool isAuthenticate() {
    return _auth.currentUser == null ? false : true;
  }
}
