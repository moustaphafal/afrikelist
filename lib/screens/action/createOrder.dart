import 'package:afrikelist/services/auth.dart';
import 'package:afrikelist/services/database.dart';
import 'package:afrikelist/shared/constants.dart';
import 'package:afrikelist/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreateOrder extends StatefulWidget {
  @override
  _CreateOrderState createState() => _CreateOrderState();
}

class _CreateOrderState extends State<CreateOrder> {
  final AuthService _auth = AuthService();

  final _formKey = GlobalKey<FormState>();
  String customerName = '';
  String customerPhone = '';
  String orderDescription = '';
  String acompte = '';
  String operatorName = '';
  bool confirm = false;

  showAlertDialog(BuildContext context) {
    // set up the buttons

    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget confirmButton = TextButton(
      child: Text("Confirm"),
      onPressed: () {
        setState(() {
          confirm = true;
        });
        Navigator.pop(context);
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Confirm ?"),
      content: Text("do you want to confirm?"),
      actions: [
        cancelButton,
        confirmButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              title: Text('create new order'),
              actions: <Widget>[
                TextButton.icon(
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
                        Text(''),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 150,
                              height: 50,
                              child: TextFormField(
                                validator: (val) =>
                                    val.isEmpty ? 'enter name' : null,
                                decoration: textInputDecoration.copyWith(
                                    hintText: 'Customer name'),
                                onChanged: (val) {
                                  setState(() => customerName = val);
                                },
                              ),
                            ),
                            SizedBox(
                              width: 35,
                            ),
                            SizedBox(
                              width: 150,
                              height: 50,
                              child: TextFormField(
                                validator: (val) =>
                                    val.isEmpty ? 'enter phone' : null,
                                decoration: textInputDecoration.copyWith(
                                    hintText: 'Customer Phone'),
                                onChanged: (val) {
                                  setState(() => customerPhone = val);
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 400,
                          child: TextFormField(
                            validator: (val) =>
                                val.isEmpty ? 'Enter your name' : null,
                            decoration: textInputDecoration.copyWith(
                                hintText: 'Operator name'),
                            onChanged: (val) {
                              setState(() => operatorName = val);
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: (val) =>
                              val.isEmpty ? 'a description' : null,
                          decoration: textInputDecoration.copyWith(
                              hintText: 'Description'),
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
                                hintText: 'acompte'),
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
                        RaisedButton(
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              String orderDate = DateTime.now()
                                  .millisecondsSinceEpoch
                                  .toString();
                              // String orderDate =
                              //     "${today.day.toString()}/${today.month.toString().padLeft(2, '0')}/${today.year.toString().padLeft(2, '0')} at ${today.hour.toString().padLeft(2, '0')}:${today.minute.toString().padLeft(2, '0')}";
                              String id = 'U' +
                                  DateTime.now()
                                      .millisecondsSinceEpoch
                                      .toString();
                              // String operatorName = '';
                              // ignore: await_only_futures
                              await showDialog(
                                context: this.context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Confirm?'),
                                    content: Text('Confirm?'),
                                    actions: <Widget>[
                                      // usually buttons at the bottom of the dialog
                                      new FlatButton(
                                        child: new Text("Yes"),
                                        onPressed: () async {
                                          Navigator.pop(context);
                                          setState(() => loading = true);
                                          await DatabaseService()
                                              .updateOrderData(
                                                  id,
                                                  customerName,
                                                  customerPhone,
                                                  orderDescription,
                                                  acompte,
                                                  orderDate,
                                                  operatorName,
                                                  true,
                                                  false,
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
                            }
                            // Navigator.pushNamed(context, '/loading');
                          },
                          color: Colors.blue,
                          child: Text(
                            'Confirm',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                      ],
                    ),
                  ),
                ]),
          );
  }
}
