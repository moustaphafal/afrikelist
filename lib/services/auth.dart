import 'package:afrikelist/models/user.dart';
import 'package:afrikelist/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  ///create a user object based on Firebase user
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

  /// name: user
  /// @Description: Listens to auth change in user stream
  ///
  /// @param:
  /// @return:
  ///        Stream:  [Stream<FirebaseUser>]
  Stream<FirebaseUser> get user {
    return _auth.onAuthStateChanged;
  }

  /// name: signInAnon
  /// @Description: Method to sign in Anonymously
  ///
  /// @param:
  ///             name: [String] name of the user
  ///             isManager: [bool] (if the custom user is a manager or not)
  ///
  /// @return:
  ///        user:  [User] (_userFromFirebaseUser)
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

  /// name: registerWithEmailAndPassword
  /// @Description: Method to register new user with email and password
  ///
  /// @param:
  ///
  ///             email: [String] user email
  ///             password: [String] user password
  ///             name: [String] name of the user
  ///             isManager: [bool] (if the custom user is a manager or not)
  ///
  /// @return:
  ///        user:  [User] (_userFromFirebaseUser)
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

  /// name: signInWithEmailAndPassword
  /// @Description: Method to signin user with email and password
  ///
  /// @param:
  ///
  ///             email: [String] user email
  ///             password: [String] user password
  ///
  /// @return:
  ///        user:  [User]
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

  /// name: signOut
  /// @Description: Method to signout user
  ///
  /// @param:
  ///
  /// @return:
  ///        user:  [Future]
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
