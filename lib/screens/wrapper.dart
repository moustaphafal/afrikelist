import 'package:afrikelist/screens/aunthenticate/authenticate.dart';
import 'package:afrikelist/screens/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser>(context);
    // return either home or auth widget

    if (user == null) {
      return Authenticate();
    } else {
      return Home(uid: user.uid);
    }
  }
}
