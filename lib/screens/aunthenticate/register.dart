import 'package:afrikelist/services/auth.dart';
import 'package:afrikelist/shared/constants.dart';
import 'package:afrikelist/shared/loading.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //text field state
  String name = '';
  String email = '';
  String password = '';
  bool isManager = false;
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.blue,
              title: Text('Create new account'),
            ),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Name'),
                      validator: (val) => val.isEmpty ? 'enter name' : null,
                      onChanged: (val) {
                        setState(() => name = val);
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Email'),
                      validator: (val) => val.isEmpty ? 'enter email' : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Password'),
                      validator: (val) =>
                          val.length < 6 ? 'enter password 6+' : null,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text('is this new user a manager?'),
                    Checkbox(
                      value: isManager,
                      onChanged: (bool value) {
                        setState(() {
                          isManager = value;
                        });
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          setState(() => loading = true);
                          dynamic result =
                              await _auth.registerWithEmailAndPassword(
                                  email, password, name, isManager);
                          if (result == null) {
                            setState(() {
                              error = 'give valid credential';
                              loading = false;
                            });
                          } else {
                            setState(() {
                              loading = false;
                            });
                          }
                        }
                      },
                      color: Colors.blue,
                      child: Text(
                        'Create',
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      error,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
