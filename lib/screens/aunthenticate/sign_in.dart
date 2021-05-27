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
                      SizedBox(height: 100),
                      Image.asset('images/logo.png'),
                      Text(
                        'LOGIN',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 35.0,
                          color: Colors.blue[500],
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        margin: EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.red[100],
                          borderRadius: BorderRadius.circular(10),
                          ),
                        //icon: Icon(Icons.error),
                        child: Text(
                          error,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      SizedBox(height: 10),

                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        margin: EdgeInsets.symmetric(vertical: 10.0),
                        decoration: BoxDecoration(
                          color: Colors.blue[200],
                          borderRadius: BorderRadius.circular(29) ,
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            icon: Icon(
                                Icons.person,
                                color: Colors.white
                            ),
                            hintText: "Email",
                            border: InputBorder.none,
                          ),
                          style: TextStyle(color: Colors.white),
                          validator: (val) => val.isEmpty ? 'enter email' : null,
                          onChanged: (val) {
                            setState(() => email = val);
                          },
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        margin: EdgeInsets.symmetric(vertical: 10.0),
                        decoration: BoxDecoration(
                          color: Colors.blue[200],
                          borderRadius: BorderRadius.circular(29) ,
                        ),
                        child: TextFormField(
                        decoration:
                            InputDecoration(
                              icon: Icon(Icons.lock,
                              color: Colors.white),
                              suffixIcon: Icon(
                                Icons.visibility,
                                color: Colors.white,
                              ),
                              hintText: 'Password',
                              border: InputBorder.none,
                            ),
                        validator: (val) =>
                            val.length < 6 ? 'enter password 6+' : null,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                        obscureText: true,
                      ),
                      ),

                      SizedBox(height: 20,),

                      RaisedButton(
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() => loading = true);
                            dynamic result = await _auth
                                .signInWithEmailAndPassword(email, password);
                            if (result == null) {
                              setState(() {
                                error = 'Give valid credential';
                                loading = false;
                                });
                              }
                          }
                        },
                        padding: EdgeInsets.symmetric(
                            vertical :16.0,
                            horizontal:90.0
                        ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)
                            ),
                            color: Colors.blue[400],
                            child: Text(
                              'Sign in',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}

/*class TextFieldContainer extends StatelessWidget{
  final Widget child;
  const TextFieldContainer({
    Key key,
    this.child,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'EMAIL',
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
    throw UnimplementedError();
  }

}*/
