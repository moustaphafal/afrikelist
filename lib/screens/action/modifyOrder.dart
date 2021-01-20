import 'package:afrikelist/models/order.dart';
import 'package:afrikelist/services/auth.dart';
import 'package:afrikelist/services/database.dart';
import 'package:afrikelist/shared/constants.dart';
import 'package:afrikelist/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ModifyOneOrder extends StatefulWidget {
  final Order order;
  ModifyOneOrder(this.order);
  @override
  _ModifyOrderState createState() => _ModifyOrderState(order);
}

class _ModifyOrderState extends State<ModifyOneOrder> {
  Order order;
  _ModifyOrderState(this.order);
  final AuthService _auth = AuthService();

  final _formKey = GlobalKey<FormState>();
  String customerName = '';
  String customerPhone = '';
  String orderDescription = '';
  String acompte = '';
  String operatorName = '';
  bool isShipped = false;
  bool isCompleted = false;

  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              title: Text('Modify order'),
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
            body: ListView(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (val) => val.isEmpty ? 'enter name' : null,
                        decoration: textInputDecoration.copyWith(
                            hintText: 'current name: ' + order.customerName),
                        onChanged: (val) {
                          setState(() => customerName = val);
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (val) => val.isEmpty ? 'enter phone' : null,
                        decoration: textInputDecoration.copyWith(
                            hintText: 'current Phone: ' + order.customerPhone),
                        onChanged: (val) {
                          setState(() => customerPhone = val);
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 400,
                        child: TextFormField(
                          enabled: false,
                          validator: (val) => val.isEmpty ? null : null,
                          decoration: textInputDecoration.copyWith(
                              hintText: 'Operator name: ' + order.operatorName),
                          onChanged: (val) {
                            setState(() => operatorName = val);
                          },
                        ),
                      ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // TextFormField(
                      //   enabled: false,
                      //   validator: (val) =>
                      //       val.isEmpty ? 'a description' : null,
                      //   decoration: textInputDecoration.copyWith(
                      //       hintText: 'order id -> ' +
                      //           order.id +
                      //           '\n' +
                      //           'order date ->' +
                      //           order.orderDate +
                      //           '\n' +
                      //           'order shipping date ->' +
                      //           order.shippingDate +
                      //           '\n' +
                      //           'order completion date->' +
                      //           order.orderDate),
                      //   keyboardType: TextInputType.multiline,
                      //   maxLines: 8,
                      //   onChanged: (val) {
                      //     setState(() => orderDescription = val);
                      //   },
                      // ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (val) =>
                            val.isEmpty ? 'a description' : null,
                        decoration: textInputDecoration.copyWith(
                            hintText:
                                'current Description: ' + order.description),
                        keyboardType: TextInputType.multiline,
                        maxLines: 5,
                        onChanged: (val) {
                          setState(() => orderDescription = val);
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 400,
                        child: TextFormField(
                          validator: (val) => val.isEmpty
                              ? 'enter acompte (0 for no acompte)'
                              : null,
                          decoration: textInputDecoration.copyWith(
                              hintText: 'current acompte: ' + order.acompte),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            // ignore: deprecated_member_use
                            WhitelistingTextInputFormatter.digitsOnly
                          ],
                          onChanged: (val) {
                            setState(() => acompte = val);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text('has been shipped to senegal'),
                      Checkbox(
                        value: isShipped,
                        onChanged: (bool newValue) {
                          setState(() {
                            isShipped = newValue;
                          });
                        },
                      ),
                      Text('Is the order complete'),
                      Checkbox(
                        value: isCompleted,
                        onChanged: (bool newValue) {
                          setState(() {
                            isCompleted = newValue;
                          });
                        },
                      ),
                      RaisedButton(
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            DateTime today = new DateTime.now();
                            String orderDate =
                                "${today.day.toString()}/${today.month.toString().padLeft(2, '0')}/${today.year.toString().padLeft(2, '0')} at ${today.hour.toString().padLeft(2, '0')}:${today.minute.toString().padLeft(2, '0')}";
                            // String operatorName = '';
                            // ignore: await_only_futures
                            await showDialog(
                              context: this.context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                      'Are you  sure you want to modify this order?'),
                                  content: Text('Confirm'),
                                  actions: <Widget>[
                                    // usually buttons at the bottom of the dialog
                                    new FlatButton(
                                      child: new Text("Yes"),
                                      onPressed: () async {
                                        Navigator.pop(context);
                                        setState(() => loading = true);
                                        await DatabaseService().updateOrderData(
                                            order.id,
                                            customerName,
                                            customerPhone,
                                            orderDescription,
                                            acompte,
                                            orderDate,
                                            order.operatorName,
                                            true,
                                            isCompleted,
                                            '');

                                        setState(() => loading = false);
                                      },
                                    ),
                                    new FlatButton(
                                      child: new Text("No"),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    )
                                  ],
                                );
                              },
                            );
                            Navigator.pop(context);
                          }
                        },
                        color: Colors.blue,
                        child: Text(
                          'Modify',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
