import 'package:flutter/material.dart';

showAlertDialog(BuildContext context) {
  // set up the buttons

  Widget cancelButton = FlatButton(
    child: Text("Cancel"),
    onPressed: () {
      return false;
    },
  );
  Widget confirmButton = FlatButton(
    child: Text("confirm"),
    onPressed: () {
      return true;
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Confirm ?"),
    content: Text("do you want to confirm?"),
    actions: [
      cancelButton,
      confirmButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
