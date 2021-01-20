// import 'package:afrikelist/models/order.dart';
// import 'package:afrikelist/screens/action/order_tile_ship.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class OrderListShip extends StatefulWidget {
//   @override
//   _OrderListShipState createState() => _OrderListShipState();
// }

// class _OrderListShipState extends State<OrderListShip> {
//   @override
//   Widget build(BuildContext context) {
//     final orderListShip = Provider.of<List<Order>>(context).reversed.toList();

//     return ListView.builder(
//       itemCount: orderListShip.length,
//       itemBuilder: (context, index) {
//         return OrderTileShip(order: orderListShip[index]);
//       },
//     );
//   }
// }
