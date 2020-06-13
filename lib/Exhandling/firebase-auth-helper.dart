import 'package:Shopping/models/user.dart';

import './auth-result-status.dart';
import './auth-exception-handler.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthHelper {
  final FirebaseAuth _auth = FirebaseAuth.instance;

User _userFromFirebaseUser(FirebaseUser user){

  return user != null ? User(uid:user.uid) :null;

}


Stream<User>get user{

  return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
}














  
  AuthResultStatus _status;

  ///
  /// Helper Functions
  ///
  Future<AuthResultStatus> createAccount({email, pass}) async {
    try {
      AuthResult authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: pass);
      if (authResult.user != null) {
        _status = AuthResultStatus.successful;
      } else {
        _status = AuthResultStatus.undefined;
      }
    } catch (e) {
      print('Exception @createAccount: $e');
      _status = AuthExceptionHandler.handleException(e);
    }
    return _status;
  }

  Future<AuthResultStatus> login({email, pass}) async {
    try {
      final authResult =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);

      if (authResult.user != null) {
        _status = AuthResultStatus.successful;
      } else {
        _status = AuthResultStatus.undefined;
      }
    } catch (e) {
      print('Exception @createAccount: $e');
      _status = AuthExceptionHandler.handleException(e);
    }
    return _status;
  }

  logout() {
    _auth.signOut();
  }
}