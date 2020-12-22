import 'package:afrikelist/models/order.dart';

import 'package:afrikelist/screens/action/order_list_ship.dart';
import 'package:afrikelist/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShipOrder extends StatefulWidget {
  @override
  _ShipOrderState createState() => _ShipOrderState();
}

class _ShipOrderState extends State<ShipOrder> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Order>>.value(
      value: DatabaseService().orders,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Mark orders as shipped'),
        ),
        body: OrderListShip(),
      ),
    );
  }
}
