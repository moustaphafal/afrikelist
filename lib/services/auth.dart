import 'package:afrikelist/models/user.dart';
import 'package:afrikelist/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //create a user object based on Firebase user
  /// name: _userFromFirebaseUser
  /// @Description: Create a custom [User] object (package:afrikelist/models/user.dart) based on [FirebaseUser]
  ///
  /// @param:
  ///             user: [FirebaseUser] (FirebaseUser to be converted)
  ///             name: [name] (name of the custom user)
  ///             isManager: [bool] (if the custom user is a manager or not)
  ///
  /// @return:
  ///        user:  [User] (An instance of the User object based on FirebaseUser)
  User _userFromFirebaseUser(FirebaseUser user, String name, bool isManager) {
    return user != null
        ? User(uid: user.uid, name: name, isManager: isManager)
        : null;
  }

  //auth change user stream
  Stream<FirebaseUser> get user {
    return _auth.onAuthStateChanged;
  }

  //This method lets you sign in anonymously
  Future signInAnon(name, isManager) async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user, name, isManager);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //This method lets you sign in with your email
  Future registerWithEmailAndPassword(
      String email, String password, String name, bool isManager) async {
    try {
      print('in function before');
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      print('in function after');
      FirebaseUser user = result.user;
      //create a firestore document for the user with uid
      await DatabaseService().updateUserData(user.uid, name, isManager);

      return _userFromFirebaseUser(user, name, isManager);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // this function is for signing in
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return user; //_userFromFirebaseUser(user, name, isManager);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //This method lets you sign in with your email
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //This method lets you register new user
}
