import 'package:afrikelist/screens/home/managet.dart';
import 'package:afrikelist/screens/home/notManager.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final String uid;

  const Home({Key key, this.uid}) : super(key: key);
  @override
  _HomeState createState() => _HomeState(uid);
}

class _HomeState extends State<Home> {
  final String uid;
  var isManager;

  _HomeState(this.uid);
  @override
  Widget build(BuildContext context) {
    // void setIsManager() async {
    //   final FirebaseUser user = await _authTest.currentUser();
    //   final uid = user.uid;
    //   var docRef = Firestore.instance.collection('user');
    //   var snap = await docRef.getDocuments();
    //   for (var item in snap.documents) {
    //     if (item.documentID == uid) {
    //       setState(() {
    //         isManager = item.data['isManager'];
    //       });
    //     }
    //   }
    //   setState(() {
    //     isManager = false;
    //   });
    // }

    // setIsManager();
    // return this.isManager ? Manager() : NotManager();
    return uid == "CkLcYvEaa4XMp0eVXwyMuHWtc3I3" ? Manager() : NotManager();
  }
}
