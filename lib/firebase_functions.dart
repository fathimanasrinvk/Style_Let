import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseFunctions {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final DatabaseReference dbRef = FirebaseDatabase.instance.reference();

  /// Register user
  Future<String?> registerUser(
      {required String name,
        required String email,
        required String pwd}) async {
    try {
      final credential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: pwd,
      );
      User? user = credential.user;
      if (user != null) {
        await dbRef.child('users').child(user.uid).set({
          'name': name,
          'email': email,
        });
      }
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      print(e);
    }
  }

  /// Login user
  Future<String?> loginUser({required String email, required String pwd}) async {
    try {
      final credential = await auth.signInWithEmailAndPassword(
        email: email,
        password: pwd,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      print(e);
    }
  }

// ///sign out
//
// Future<void> logoutUser() async {
//   await FirebaseAuth.instance.signOut();
// }
}
