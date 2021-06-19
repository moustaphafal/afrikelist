import 'package:afrikelist/screens/action/createOrder.dart';
import 'package:afrikelist/screens/aunthenticate/register.dart';
import 'package:afrikelist/screens/home/allOrders.dart';
import 'package:afrikelist/screens/home/deleteOrder.dart';
import 'package:afrikelist/services/auth.dart';
import 'package:afrikelist/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Manager extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().user,
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CreateOrder()),
            );
          },
        ),
        appBar: AppBar(
          title: Text('Home'),
          backgroundColor: Colors.blue,
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(Icons.person),
              label: Text('Logout'),
            )
          ],
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                //Button too create order
                FlatButton(
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CreateOrder()),
                    );
                  },
                  child: Text('     Create Order     '),
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
                  child: Text('       Close Order       '),
                ),

                SizedBox(
                  height: 50,
                ),

                FlatButton(
                  minWidth: 20,
                  child: Text('         All Orders         '),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AllOrder()),
                    );
                  },
                  color: Colors.blue,
                ),
                SizedBox(
                  height: 50,
                ),
                // Button to modify orders
                FlatButton(
                  child: Text('   Create new user   '),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Register()),
                    );
                  },
                  color: Colors.blue,
                ),
                // SizedBox(
                //   height: 50,
                // ),
                // // Button to modify orders
                // FlatButton(
                //   child: Text('   Analytics   '),
                //   onPressed: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => Analytics()),
                //     );
                //   },
                //   color: Colors.blue,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
