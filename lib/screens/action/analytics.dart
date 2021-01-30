// import 'package:afrikelist/models/order.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class AnalyticsBuild extends StatefulWidget {
//   @override
//   _AnalyticsBuildState createState() => _AnalyticsBuildState();
// }

// class _AnalyticsBuildState extends State<AnalyticsBuild> {
//   @override
//   Widget build(BuildContext context) {
//     final orderListDelete = Provider.of<List<Order>>(context);
//     int numOrderToday;
//     int numOrderYesterday;
//     int numOrderThisMonth;
//     int numOrderLastMonth;
//     int numOrderThisYear;
//     for (Order item in orderListDelete) {
//       DateTime orderDate =
//           DateTime.fromMillisecondsSinceEpoch(int.parse(item.orderDate));
//       DateTime today = DateTime.now();
//       bool dayEqual = orderDate.day == today.day;
//       bool monthEqual = orderDate.month == today.month;
//       bool yearEqual = orderDate.year == today.year;

//       if (dayEqual && monthEqual && yearEqual) {
//         numOrderToday++;
//       }
//       if (monthEqual && yearEqual) {
//         numOrderThisMonth++;
//       }
//       if (yearEqual) {
//         numOrderThisYear++;
//       }
//     }
//     return Container();
//   }
// }
