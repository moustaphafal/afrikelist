import 'package:afrikelist/services/auth.dart';
import 'package:afrikelist/shared/constants.dart';
import 'package:afrikelist/shared/loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //text field state
  String email = '';
  String password = '';
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            // appBar: AppBar(
            //   backgroundColor: Colors.blue,
            //   title: Text('Afriklist'),
            //   // actions: <Widget>[
            //   //   FlatButton.icon(
            //   //     onPressed: () {},
            //   //     label: Text('register'),
            //   //     icon: Icon(Icons.person),
            //   //   ),
            //   // ],
            // ),

            body: ListView(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 150,
                      ),
                      Image.asset('images/logo.png'),
                      SizedBox(
                        height: 50,
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
                        height: 50,
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
                        height: 50,
                      ),
                      RaisedButton(
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() => loading = true);
                            dynamic result = await _auth
                                .signInWithEmailAndPassword(email, password);
                            if (result == null) {
                              setState(() {
                                error = 'give valid credential';
                                loading = false;
                              });
                            }
                          }
                        },
                        color: Colors.blue,
                        child: Text(
                          'Sign in',
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
              ],
            ),
          );
  }
}
