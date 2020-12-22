import 'package:afrikelist/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference _userCollectionReferencee =
      Firestore.instance.collection('user');

  Future createUser(User user) async {
    try {
      await _userCollectionReferencee.document(user.uid).setData(user.toJson());
    } catch (e) {
      return e.message;
    }
  }
}
