import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print("Error: $e");
    }
  }

  void signOut() async {
    _auth.signOut();
  }

  String? getEmailUser() {
    final user = _auth.currentUser;
    return user?.email;
  }

  String? getUser() {
    final user = _auth.currentUser;
    return user?.uid;
  }


}