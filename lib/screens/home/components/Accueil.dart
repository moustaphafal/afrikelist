import 'package:afrikelist/screens/action/order_list.dart';
import 'package:flutter/material.dart';
import '../allOrders.dart';
import '../completed.dart';

class Accueil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.flash_on),
                  text: 'All Orders',
                ),
                Tab(
                  icon: Icon(Icons.sync),
                  text: 'Infinite Process',
                ),
                Tab(
                  icon: Icon(Icons.person),
                  text: 'Compte',
                ),
              ],
            ),
            title: Text('Isolate Example'),
          ),
          body: TabBarView(
            children: [
              OrderList(),
              OrderList(),
              Completed(),
            ],
          ),
        ),
      ),
    );
  }
}