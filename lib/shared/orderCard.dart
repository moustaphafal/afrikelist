import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Card OrderCard(context, String name, String content) {
  return Card(
    margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
    child: ListTile(
      title: Text(
        name,
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        content,
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
      onTap: () async {
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(name),
              content: Text(content),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                new FlatButton(
                  child: new Text("Okay"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            );
          },
        );
      },
    ),
  );
}
