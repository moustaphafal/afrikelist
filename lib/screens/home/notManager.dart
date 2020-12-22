import 'package:afrikelist/screens/action/createOrder.dart';
import 'package:afrikelist/screens/home/allOrders.dart';
import 'package:afrikelist/screens/home/deleteOrder.dart';
import 'package:afrikelist/services/auth.dart';
import 'package:afrikelist/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotManager extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().user,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Home'),
          backgroundColor: Colors.blue,
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(Icons.person),
              label: Text('logout'),
            )
          ],
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 150,
              ),

              SizedBox(
                height: 50,
              ),

              //Button too create order
              FlatButton(
                color: Colors.blue,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreateOrder()),
                  );
                },
                child: Text('     create Order     '),
              ),
              SizedBox(
                height: 50,
              ),

              //Button to delete (close order)
              FlatButton(
                color: Colors.blue,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DeleteOrder()),
                  );
                },
                child: Text('       close order       '),
              ),
              SizedBox(
                height: 50,
              ),

              FlatButton(
                minWidth: 20,
                child: Text('          All Orders          '),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AllOrder()),
                  );
                },
                color: Colors.blue,
              ),
              SizedBox(
                height: 20,
              ),
              //Button to show all completed orders
              // FlatButton(
              //   child: Text('   All Closed orders   '),
              //   onPressed: () {
              //     // Navigator.pushNamed(context, '/closed');
              //   },
              //   color: Colors.blue,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
