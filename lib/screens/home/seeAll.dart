import 'package:afrikelist/models/order.dart';
import 'package:afrikelist/screens/action/order_list.dart';
import 'package:afrikelist/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SeeAll extends StatefulWidget {
  @override
  _SeeAllState createState() => _SeeAllState();
}

class _SeeAllState extends State<SeeAll> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Order>>.value(
      value: DatabaseService().orders,
      child: Scaffold(
        appBar: AppBar(
          title: Text('All orders'),
        ),
        body: OrderList(),
      ),
    );
  }
}

// class _AllOrderState extends State<AllOrder> {
//   @override
//   Widget build(BuildContext context) {
//     return StreamProvider<List<Order>>.value(
//       value: DatabaseService().orders,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('All orders'),
//         ),
//         body: OrderList(),
//       ),
//     );
//   }
// }
