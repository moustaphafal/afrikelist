// import 'package:afrikelist/models/order.dart';
// import 'package:afrikelist/services/database.dart';
// import 'package:flutter/material.dart';

// class OrderTileShip extends StatelessWidget {
//   final Order order;
//   MaterialColor setColor(Order order) {
//     if (order.isCompleted) {
//       return Colors.green;
//     }
//     if (order.isConfirmed) {
//       return Colors.red;
//     }
//     return Colors.red;
//   }

//   OrderTileShip({this.order});
//   @override
//   Widget build(BuildContext context) {
//     if (order.isCompleted) {
//       return SizedBox();
//     }
//     return Padding(
//       padding: EdgeInsets.only(top: 8),
//       child: Card(
//         margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
//         child: ListTile(
//           leading: CircleAvatar(
//             radius: 25,
//             backgroundColor: setColor(order),
//           ),
//           title: Text(order.customerName),
//           subtitle: Text(order.description),
//           onTap: () async {
//             await showDialog(
//               context: context,
//               builder: (BuildContext context) {
//                 return AlertDialog(
//                   title: Text(
//                       'Are you sure you want to mark this order as shipped?'),
//                   content: Text("Customer " +
//                       order.customerName +
//                       " Ordered " +
//                       order.description),
//                   actions: <Widget>[
//                     // usually buttons at the bottom of the dialog
//                     new FlatButton(
//                       child: new Text("Yes"),
//                       onPressed: () async {
//                         Navigator.pop(context);
//                         DateTime today = new DateTime.now();
//                         String orderDate =
//                             "${today.day.toString()}/${today.month.toString().padLeft(2, '0')}/${today.year.toString().padLeft(2, '0')} at ${today.hour.toString().padLeft(2, '0')}:${today.minute.toString().padLeft(2, '0')}";

//                         DatabaseService().updateOrderData(
//                             order.id,
//                             order.customerName,
//                             order.customerPhone,
//                             order.description,
//                             order.acompte,
//                             order.orderDate,
//                             order.operatorName,
//                             order.isConfirmed,
//                             order.isCompleted,
//                             order.completionDate);
//                       },
//                     ),
//                     new FlatButton(
//                       child: new Text("No"),
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                     )
//                   ],
//                 );
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
