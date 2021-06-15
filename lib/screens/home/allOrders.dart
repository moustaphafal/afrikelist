import 'package:afrikelist/models/order.dart';
import 'package:afrikelist/screens/action/order_list.dart';
import 'package:afrikelist/screens/home/seeAll.dart';
import 'package:afrikelist/screens/action/createOrder.dart';
import 'package:afrikelist/screens/home/sorting/sortedOrder.dart';
import 'package:afrikelist/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'completed.dart';

class AllOrder extends StatefulWidget {
  @override
  _AllOrderState createState() => _AllOrderState();
}

 class _AllOrderState extends State<AllOrder> {
   @override
   Widget build(BuildContext context) {
     return StreamProvider<List<Order>>.value(
       value: DatabaseService().orders,
       child: Scaffold(
         appBar: AppBar(
           title: Text('All orders'),
         ),
         body: OrderList(),
         floatingActionButton: FloatingActionButton(
           onPressed: () {

           },
           child: Icon(Icons.add),
           backgroundColor: Colors.red[300],
         ),
       ),
     );
   }
 }

/*class _AllOrderState extends State<AllOrder> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Order>>.value(
      value: DatabaseService().orders,
      child: Scaffold(
        appBar: AppBar(
          title: Text('All orders'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[

                FlatButton(
                  height: 50,
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SortedOrder(
                                isComplete: false,
                                selectedDate: null,
                                monthOrder: true,
                              )
                      ),
                    );
                  },
                  child: Text('   Ongoing   '),
                ),

                SizedBox(height: 100,),

                FlatButton(
                  height: 50,
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Completed()),
                    );
                  },
                  child: Text('   Completed   '),
                ),

                // SizedBox(
                //   height: 100,
                // ),
                // FlatButton(
                //   height: 50,
                //   color: Colors.blue,
                //   onPressed: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => SeeAll()),
                //     );
                //   },
                //   child: Text('           See all           '),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}*/
